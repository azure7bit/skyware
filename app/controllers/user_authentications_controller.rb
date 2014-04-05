class UserAuthenticationsController < Devise::SessionsController
  before_filter :find_subdomain, only: [:create]
  layout 'citizen_devise'
  def new
    self.resource = resource_class.new(devise_parameter_sanitizer)
    clean_up_passwords(resource)
    render 'citizens/sessions/new'
  end

  def create
    subdomain = @subdomain.present? ? @subdomain.subdomain : params[:super_admin][:email]
    resource = Citizen.where("subdomain = ? or email = ?",subdomain,subdomain).first
    resource ||= SuperAdmin.where("username = ? or email = ?",subdomain,subdomain).first
    auth_options = resource.is_a?(Citizen) ? {scope: :citizen, recall: 'sessions#new'} : {scope: :super_admin, recall: 'sessions#new'}
    if resource.present?
      self.resource = warden.authenticate!(auth_options)
      resource.is_a?(Citizen) ? sign_in(:citizen, resource) : sign_in(:super_admin, resource)
    else
      render 'citizens/sessions/new'
    end
  end

  private

    def find_subdomain
      @subdomain = Citizen.find_by(:subdomain => request.subdomain)
      @subdomain ||= SuperAdmin.find_by(:subdomain => request.subdomain)
    end
end