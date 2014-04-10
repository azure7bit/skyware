class ManageUsersController < ApplicationController

  before_filter :authenticate_super_admin!
  # load_and_authorize_resource
  
  before_filter :find_user, :only => [:edit, :update, :destroy, :show]

  def index
    @members = BusinessUser.is_for_user
  end

  def new
    @user = BusinessUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def show
  end

  def create
    password = Devise.friendly_token.first(8)
    params[:business_user][:password] = password
    @user = eval_user(params[:business_user][:user_type]).new(user_params)
    @user.generate_subdomain
    respond_to do |format|
      if @user.save
        format.html { redirect_to manage_user_path(@user), notice: 'Manager was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to manage_users_path }
      format.json { head :no_content }
    end
  end

  private
    def find_user
      @user = BusinessUser.find_by(:id => params[:id])
    end

    def user_params
      params.require(:business_user).permit(:email, :first_name, :last_name, :image, :username, :subdomain, :password)
    end

    def eval_user(user)
      eval user
    end

end
