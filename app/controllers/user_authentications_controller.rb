class UserAuthenticationsController < Devise::SessionsController
  before_filter :find_subdomain, only: [:create]
  layout 'citizen_devise'

  def create
    subdomain = @subdomain.present? ? @subdomain.subdomain : params[:citizen][:email]
    @resource = Citizen.where("subdomain = ? or email = ?",subdomain,subdomain).first
    @resource ||= BusinessUser.where("username = ? or email = ?",subdomain,subdomain).first
    auth_options = @resource.is_a?(Citizen) ? {scope: :citizen, recall: 'devise/sessions#new'} : {scope: :business_user, recall: 'devise/sessions#new'}
    if @resource.present?
      resource = warden.authenticate!(auth_options)
      @resource.is_a?(Citizen) ? sign_in(:citizen, resource) : sign_in(:business_user, resource)
    else
      render 'citizens/sessions/new'
    end

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