class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :populate_tags
  before_filter :ensure_correct_subdomain
  helper_method :current_user
  after_filter :flash_to_headers

  def url_options
    {subdomain: (current_user.try(:subdomain) or 'www'), only_path: false}.merge(super)
  end

  protected 
  
  layout :layout_by_resource
  
  def layout_by_resource
    if devise_controller? and current_user
      "application"
    elsif devise_controller? and resource_class == SuperAdmin
      "devise_layout"
    elsif devise_controller? and resource_class == Citizen
      "citizen_devise"
    else
      "application"
    end
  end

  def devise_parameter_sanitizer
    if resource_class == Citizen
      Citizen::ParameterSanitizer.new(Citizen, :citizen, params)
    elsif resource_class == SuperAdmin
      SuperAdmin::ParameterSanitizer.new(SuperAdmin, :super_admin, params)
    end
  end
  
  def populate_tags
    @super_admin = current_super_admin
  end


  def current_user
      current_super_admin or current_citizen
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    root_url(subdomain: 'www')
  end

  def ensure_correct_subdomain
    citizen = Citizen.find_by(subdomain: request.subdomain)
    super_admin = SuperAdmin.find_by(subdomain: request.subdomain)
    if current_user and (request.subdomain.empty? or request.subdomain.eql?('www'))
      redirect_to root_url(subdomain: current_user.subdomain)
    elsif current_user and devise_controller? and (params[:action] == 'new')
      redirect_to root_url(subdomain: current_user.subdomain)
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.class == Citizen
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

end
