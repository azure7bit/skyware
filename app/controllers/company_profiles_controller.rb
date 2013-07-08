class CompanyProfilesController < ApplicationController
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
    @company_profile = CompanyProfile.find_by_super_admin_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_profile }
    end
  end

  # GET /company_profiles/new
  # GET /company_profiles/new.json
  def new
    @company_profile = CompanyProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_profile }
    end
  end

  # GET /company_profiles/1/edit
  def edit
    @company_profile = CompanyProfile.find(params[:id])
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
end
