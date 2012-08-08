class SessionsController < ApplicationController
 
  skip_before_filter :authenticate_user!, :except => :destroy

  def new
    render :layout => 'login'
  end

  def create
    #raise auth_profile.to_yaml

    if @user = User.from_omniauth(auth_profile)
      if @user.valid?
        @user.save if @user.new_record?
        if auth_profile.info.image?
          @user.remote_avatar_url = auth_profile.info.image
          @user.save
        end

        session[:user_id] = @user.id
        notify "You are now signed in as #{@user.name}.", type: :success
        sign_in(:user, @user)
        redirect_to root_url
      else
        session[:user] = @user
        redirect_to "users/edit"
      end
    else
      notify 'Authentication failed, please try again.', type: :error
      redirect_to root_url      
    end
  end

  def destroy
    session[:user_id] = nil
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
