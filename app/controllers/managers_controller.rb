class ManagersController < ApplicationController
  # GET /managers
  # GET /managers.json
  def index
    @business = Business.find(params[:business_id])
    @managers = Manager.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @managers }
    end
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
    @business = Business.find(params[:business_id])
    @manager = Manager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manager }
    end
  end

  # GET /managers/new
  # GET /managers/new.json
  def new
    @business = Business.find(params[:business_id])
    @manager = Manager.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manager }
    end
  end

  # GET /managers/1/edit
  def edit
    @business = Business.find(params[:business_id])
    @manager = Manager.find(params[:id])
  end

  # POST /managers
  # POST /managers.json
  def create
    @business = Business.find(params[:business_id])
    @manager = @business.managers.build(params[:manager])

    respond_to do |format|
      if @manager.save
        format.html { redirect_to business_manager_path(@business, @manager), notice: 'Manager was successfully created.' }
        format.json { render json: business_manager_path(@business, @manager), status: :created, location: @manager }
      else
        format.html { render action: "new" }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /managers/1
  # PUT /managers/1.json
  def update
    @business = Business.find(params[:business_id])
    @manager = Manager.find(params[:id])

    respond_to do |format|
      if @manager.update_attributes(params[:manager])
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @business = Business.find(params[:business_id])
    @manager = Manager.find(params[:id])
    @manager.destroy

    respond_to do |format|
      format.html { redirect_to business_managers_path(@business) }
      format.json { head :no_content }
    end
  end
end