class Citizens::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
	    # You need to implement the method below in your model (e.g. app/models/super_admin.rb)
	    @user = Citizen.find_for_google_oauth2(request.env["omniauth.auth"], current_citizen)

	    if @user.persisted?
	      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
	      sign_in_and_redirect @user, :event => :authentication
	    else
	      session["devise.google_data"] = request.env["omniauth.auth"]
	      redirect_to user_register_path
	    end
	end
end