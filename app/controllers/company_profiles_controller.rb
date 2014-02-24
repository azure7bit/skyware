class CompanyProfilesController < ApplicationController
  before_filter :authenticate_super_admin!, :only => [:admin_profile]
  skip_before_filter :verify_authenticity_token, :only => [:save_tagline]
  # GET /company_profiles
  # GET /company_profiles.json
  def index
    @company_profiles = CompanyProfile.all
    @posts = Blogit::Post.where(:blogger_id => current_user.id, :blogger_type => current_user.class).order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_profiles }
    end
  end

  # GET /company_profiles/1
  # GET /company_profiles/1.json
  def show
    @company_profile = current_super_admin.company_profile

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_profile }
    end
  end

  # GET /company_profiles/new
  # GET /company_profiles/new.json
  def new
    @company_profile = CompanyProfile.new
    @super_admin = current_super_admin

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
    @super_admin = current_super_admin
    respond_to do |format|
      format.html
    end
  end

  # POST /company_profiles
  # POST /company_profiles.json
  def create
    @company_profile = CompanyProfile.new(params[:company_profile])
    @company_profile.super_admin_id = current_super_admin.id

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
    @citizen = Citizen.find(params[:id])
    if !params[:title].nil?
      @citizen.update_attributes(title_tagline: params[:title])
      text = @citizen.title_tagline
    else
      @citizen.update_attributes(tagline: params[:tagline])
      text = @citizen.tagline
    end
    
    sign_in(@citizen, :bypass => true)

    render :text => text
  end
end
