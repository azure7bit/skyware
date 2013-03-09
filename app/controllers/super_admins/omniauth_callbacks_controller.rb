class SuperAdmins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
	    # You need to implement the method below in your model (e.g. app/models/super_admin.rb)
	    @super_admin = SuperAdmin.find_for_google_oauth2(request.env["omniauth.auth"], current_super_admin)

	    if @super_admin.persisted?
	      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
	      sign_in_and_redirect @super_admin, :event => :authentication
	    else
	      session["devise.google_data"] = request.env["omniauth.auth"]
	      redirect_to new_super_admin_registration_url
	    end
	end
end