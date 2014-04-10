class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery
  before_filter :validate_subdomain
  before_filter :populate_tags
  before_filter :ensure_correct_subdomain
  before_filter :check_confirmation
  helper_method :current_user
  after_filter :flash_to_headers

  def url_options
    {subdomain: (current_user.try(:subdomain) or 'www'), only_path: false}.merge(super)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected 
  
    layout :layout_by_resource
    
    def layout_by_resource
      if devise_controller? and current_user
        "application"
      elsif devise_controller? and resource_class == SuperAdmin
        "citizen_devise"
      elsif devise_controller? and resource_class == Citizen
        "citizen_devise"
      elsif devise_controller? and resource_class == BusinessUser
        "citizen_devise"
      else
        "application"
      end
    end

    def devise_parameter_sanitizer
      if resource_class == Citizen
        Citizen::ParameterSanitizer.new(Citizen, :citizen, params)
      elsif resource_class == BusinessUser
        BusinessUser::ParameterSanitizer.new(BusinessUser, :business_user, params)
      elsif resource_class == SuperAdmin
        SuperAdmin::ParameterSanitizer.new(SuperAdmin, :super_admin, params)
      end
    end
    
    def populate_tags
      @super_admin = current_super_admin
      @super_admin ||= current_super_admin
    end


    def current_user
      current_super_admin or current_citizen or current_business_user
    end

    private

      def check_confirmation
        if params['confirmation_token']
          @user = Citizen.find_by(subdomain: params['confirmation_token'])
          @user ||= SuperAdmin.find_by(:confirmation_token => params['confirmation_token'])
          if @user && !@user.confirmed?
            @user.confirm!
            @user.save
          end
        end
      end

      def after_sign_out_path_for(resource_or_scope)
        root_url(subdomain: 'www')
      end

      def ensure_correct_subdomain
        citizen = Citizen.find_by(subdomain: request.subdomain)
        super_admin = SuperAdmin.find_by(subdomain: request.subdomain)
        user = BusinessUser.find_by(subdomain: request.subdomain)
        if current_user and (request.subdomain.empty? or request.subdomain.eql?('www'))
          redirect_to root_path
        elsif current_user and devise_controller? and (params[:action] == 'new')
          redirect_to root_path
        elsif current_user.nil? and request.subdomain.empty?
          redirect_to root_path
        end
      end

      def after_sign_in_path_for(resource_or_scope)
        if resource_or_scope.class == Citizen
          root_url(subdomain: resource_or_scope.subdomain)
        elsif resource_or_scope.class == BusinessUser
          root_url(subdomain: resource_or_scope.subdomain)
        else
          super
        end
      end

      def flash_to_headers
        return unless request.xhr?
        response.headers['X-Message'] = flash_message
        response.headers["X-Message-Type"] = flash_type.to_s
        flash.discard
      end

      def flash_message
        [:error, :success, :notice].each do |type|
          return flash[type] unless flash[type].blank?
        end
        return ''
      end
     
      def flash_type
        [:error, :success, :notice, :keep].each do |type|
          return type unless flash[type].blank?
        end
        return :empty
      end

      def validate_subdomain
        subdomain = Citizen.find_by(subdomain: request.subdomain)
        subdomain ||= BusinessUser.find_by(subdomain: request.subdomain)
        redirect_to "/404.html" unless subdomain || request.subdomain.eql?('www')
      end

end
