class CompanyForumsController < ApplicationController
  # GET /company_forums
  # GET /company_forums.json
  # def index
  #   @company_forums = CompanyForum.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @company_forums }
  #   end
  # end

  # GET /company_forums/1
  # GET /company_forums/1.json
  def show
    @company_forum = current_super_admin.company_forum
    @company_forum_topics = @company_forum.company_forum_topics

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_forum }
    end
  end

  # GET /company_forums/new
  # GET /company_forums/new.json
  def new
    @super_admin = current_super_admin
    @company_forum = CompanyForum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_forum }
    end
  end

  # GET /company_forums/1/edit
  def edit
    @company_forum = CompanyForum.find(params[:id])
  end

  # POST /company_forums
  # POST /company_forums.json
  def create
    @company_forum = current_super_admin.build_company_forum(params[:company_forum], :super_admin_id => current_super_admin.id)
    # @company_forum.super_admin_id = current_super_admin.id
    respond_to do |format|
      if @company_forum.save
        format.html { redirect_to @company_forum, notice: 'Company forum was successfully created.' }
        format.json { render json: @company_forum, status: :created, location: @company_forum }
      else
        format.html { render action: "new" }
        format.json { render json: @company_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_forums/1
  # PUT /company_forums/1.json
  def update
    @company_forum = CompanyForum.find(params[:id])

    respond_to do |format|
      if @company_forum.update_attributes(params[:company_forum])
        format.html { redirect_to @company_forum, notice: 'Company forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_forums/1
  # DELETE /company_forums/1.json
  def destroy
    @company_forum = CompanyForum.find(params[:id])
    @company_forum.destroy

    respond_to do |format|
      format.html { redirect_to company_forums_url }
      format.json { head :no_content }
    end
  end
end
