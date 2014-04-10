class CompanyProfilesController < ApplicationController
  # before_filter :authenticate_super_admin!, :only => [:admin_profile]
  load_and_authorize_resource
  skip_before_filter :verify_authenticity_token, :only => [:save_tagline]
  before_filter :find_user_active
  
  # GET /company_profiles
  # GET /company_profiles.json
  def index
    @company_profiles = CompanyProfile.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_profiles }
    end
  end

  # GET /company_profiles/1
  # GET /company_profiles/1.json
  def show
    @company_profile = @access.company_profile

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_profile }
    end
  end

  def blog
    @user = current_user
    @posts = Blogit::Post.where(:blogger_id => current_user.id, :blogger_type => current_user.class).order("created_at desc").except(:order)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_profiles }
    end
  end

  # GET /company_profiles/new
  # GET /company_profiles/new.json
  def new
    @company_profile = CompanyProfile.new
    @super_admin = @access

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_profile }
    end
  end

  # GET /company_profiles/1/edit
  def edit
    @company_profile = CompanyProfile.find(params[:id])
  end

  def admin_profile
    @super_admin = @access
    respond_to do |format|
      format.html
    end
  end

  # POST /company_profiles
  # POST /company_profiles.json
  def create
    @company_profile = CompanyProfile.new(params[:company_profile])
    @company_profile.business_user_id = @access.id

    respond_to do |format|
      if @company_profile.save
        format.html { redirect_to @company_profile, notice: 'Company profile was successfully created.' }
        format.json { render json: @company_profile, status: :created, location: @company_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_profiles/1
  # PUT /company_profiles/1.json
  def update
    @company_profile = CompanyProfile.find(params[:id])

    respond_to do |format|
      if @company_profile.update_attributes(params[:company_profile])
        format.html { redirect_to @company_profile, notice: 'Company profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_profiles/1
  # DELETE /company_profiles/1.json
  def destroy
    @company_profile = CompanyProfile.find(params[:id])
    @company_profile.destroy

    respond_to do |format|
      format.html { redirect_to company_profiles_url }
      format.json { head :no_content }
    end
  end

  def save_tagline
    if !current_user.blank?
      @user = current_user
      if !params[:title].nil?
        @user.update_attributes(title_tagline: params[:title])
        text = @user.title_tagline
      else
        @user.update_attributes(tagline: params[:tagline])
        text = @user.tagline
      end
      sign_in(@user, :bypass => true)
    end
    render :text => text
  end

  def edit_post
    @post = Blogit::Post.find(params[:id])
    if params[:post][:post_type] == "0"
      params[:post][:post_type] = nil
    else
      params[:post][:post_type] = "Sticky"
    end
    @post.update_attributes(params_post.merge({:blogger_id => current_user.id, :blogger_type => current_user.class.to_s}))

    redirect_to :back
  end

  private
  def params_post
    params.require(:post).permit(:title, :tag_list, :body, :post_type)
  end

  def find_user_active
    @access = current_super_admin ? current_super_admin : current_business_user
  end
end
