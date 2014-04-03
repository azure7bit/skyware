class UserAuthenticationsController < Devise::SessionsController
  def new
  end

  def create
    subdomain = @subdomain.present? ? @subdomain.subdomain : params[:citizen][:username]
    resource = Citizen.where(:email => subdomain, :subdomain => subdomain).first
    resource ||= SuperAdmin.where(:username => subdomain, :email => subdomain).first

    if resource.present?
      resource.is_a?(Citizen) ? sign_in(:citizen, resource) : sign_in(:superadmin, resource)
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