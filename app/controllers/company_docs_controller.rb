class CompanyDocsController < ApplicationController
  # GET /company_docs
  # GET /company_docs.json

  before_filter :find_user_active
  
  def index
    @company_docs = CompanyDoc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_docs }
    end
  end

  # GET /company_docs/1
  # GET /company_docs/1.json
  def show
    @company_doc = CompanyDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_doc }
    end
  end

  # GET /company_docs/new
  # GET /company_docs/new.json
  def new
    @company_doc = CompanyDoc.new uploader_id: @access.id, uploader_type: @access.user_type

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_doc }
    end
  end

  # GET /company_docs/1/edit
  def edit
    @company_doc = CompanyDoc.find(params[:id])
  end

  # POST /company_docs
  # POST /company_docs.json
  def create
    @company_doc = CompanyDoc.new(params[:company_doc].merge({uploader_id: @access.id, uploader_type: @access.user_type}))

    respond_to do |format|
      if @company_doc.save
        format.html { redirect_to company_docs_path, notice: 'Company document was successfully uploaded.' }
        format.json { render json: @company_doc, status: :created, location: @company_doc }
      else
        format.html { render action: "new" }
        format.json { render json: @company_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_docs/1
  # PUT /company_docs/1.json
  def update
    @company_doc = CompanyDoc.find(params[:id])

    respond_to do |format|
      if @company_doc.update_attributes(params[:company_doc])
        format.html { redirect_to @company_doc, notice: 'Company doc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_docs/1
  # DELETE /company_docs/1.json
  def destroy
    @company_doc = CompanyDoc.find(params[:id])
    @company_doc.destroy

    respond_to do |format|
      format.html { redirect_to company_docs_path }
      format.json { head :no_content }
    end
  end

  private
    def find_user_active
      @access = current_super_admin ? current_super_admin : current_business_user
    end
end
