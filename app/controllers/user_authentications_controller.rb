class UserAuthenticationsController < Devise::SessionsController
  # before_filter :find_subdomain, only: [:create]
  layout 'citizen_devise'
  # def new
  #   self.resource = resource_class.new(sign_in_params)
  #   clean_up_passwords(resource)
  #   render 'citizens/sessions/new'
  # end

  # def create
  #   subdomain = @subdomain.present? ? @subdomain.subdomain : params[:citizen][:email]
  #   @resource = Citizen.where("subdomain = ? or email = ?",subdomain,subdomain).first
  #   @resource ||= BusinessUser.where("username = ? or email = ?",subdomain,subdomain).first
  #   auth_options = @resource.is_a?(Citizen) ? {scope: :citizen, recall: 'sessions#new'} : {scope: :super_admin, recall: 'sessions#new'}
  #   if @resource.present?
  #     resource = warden.authenticate!(auth_options)
  #     @resource.is_a?(Citizen) ? sign_in(:citizen, resource) : sign_in(:super_admin, resource)
  #   else
  #     render 'citizens/sessions/new'
  #   end
  # end

  def create
    citizen = Citizen.find_by(:email => params[:citizen][:email], :subdomain => params[:citizen][:email])
    # business = BusinessUser.find_by(:email => params[:citizen][:email], :username => params[:citizen][:email])
    unless citizen.present?
      auth_options = {scope: :super_admin, recall: 'sessions#new'}
      resource_name = :super_admin
      warden.config[:default_scope] = :super_admin
      params[:business_user] = params.delete(:citizen)
      resource_name = :super_admin
    else
      resource_name = :citizen
      auth_options = {scope: :citizen, recall: 'sessions#new'}
    end
     # raise resource_name.inspect
     resource = warden.authenticate!(auth_options)
     set_flash_message(:notice, :signed_in) if is_navigational_format?
     sign_in(resource_name, resource)
     respond_with resource, :location => after_sign_in_path_for(resource)
   end

  private
  
    def sign_in_params
      devise_parameter_sanitizer.sanitize(:sign_in)
    end

    def find_subdomain
      @subdomain = Citizen.find_by(:subdomain => request.subdomain)
      @subdomain ||= BusinessUser.find_by(:subdomain => request.subdomain)
    end
end