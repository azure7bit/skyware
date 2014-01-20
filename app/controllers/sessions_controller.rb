class SessionsController < ApplicationController
 
  skip_before_filter :authenticate_super_admin!, :except => :destroy

  def new
    render :layout => 'login'
  end

  def create
    #raise auth_profile.to_yaml
    if @super_admin = SuperAdmin.from_omniauth(auth_profile)
      if @super_admin.valid?
        @super_admin.save if @super_admin.new_record?
        if auth_profile.info.image?
          @super_admin.remote_avatar_url = auth_profile.info.image
          @super_admin.save
        end

        session[:super_admin_id] = @super_admin.id
        notify "You are now signed in as #{@super_admin.name}.", type: :success
        sign_in(:super_admin, @super_admin)
        redirect_to root_url
      else
        session[:super_admin] = @super_admin
        redirect_to "super_admins/edit"
      end
    else
      notify 'Authentication failed, please try again.', type: :error
      redirect_to root_url      
    end
  end

  def destroy
    session[:super_admin_id] = nil
    notify 'You are now signed out. Bye!', type: :success
    redirect_to root_url
  end

  def failure
    notify 'Authentication failed, please try again.', type: :error
    redirect_to root_url
  end

  private

  def auth_profile
    Hashie::Mash.new request.env['omniauth.auth']
  end
end
