class UsersController < InheritedResources::Base
  respond_to :html, :json

  actions :new, :create, :show, :edit, :update

  before_filter :authenticate_user!, :except => [:new, :create, :check]

  def check
    if email = param.user.email
      render :text => User.find_by_email(email).nil?
      return
    end

    if username = param.user.username
      render :text => User.find_by_username(username).nil?
      return
    end
  end

  protected

  def resource
    current_user
  end

end

