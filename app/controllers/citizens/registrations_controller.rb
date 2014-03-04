class Citizens::RegistrationsController < Devise::RegistrationsController

	
	def create
		build_resource(sign_up_params)
		resource.avatar = params[:avatar] 

		if resource.save
			if resource.active_for_authentication?
				set_flash_message :notice, :signed_up if is_navigational_format?
				sign_up(resource_name, resource)
				respond_with resource, :location => after_sign_up_path_for(resource)
			else
				set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
				expire_session_data_after_sign_in!
				respond_with resource, :location => after_inactive_sign_up_path_for(resource)
			end
		else
			clean_up_passwords resource
			flash[:error] = resource.errors.full_messages.join(', ')
			redirect_to register_url
		end
	end

	def update

	# debugger
    # required for settings form to submit when password is left blank
    if params[:citizen][:password].blank? && params[:citizen][:password_confirmation].blank?
        params[:citizen].delete(:password)
        params[:citizen].delete(:password_confirmation)
    end

    @user = Citizen.find(current_user.id)
    if @user.update_attributes(params_citizen)
      set_flash_message :notice, :updated
      
      # Sign in the user bypassing validation in case his password changed
      sign_in(@user, :bypass => true)

      redirect_to root_url(subdomain: current_user.subdomain)	
    else
      render "edit"
    end
  end

  private

  def params_citizen
  	params.require(:citizen).permit(:email, :subdomain, :password, :password_confirmation, :avatar)
  end

end