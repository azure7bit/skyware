class ManagersController < ApplicationController
  # GET /managers
  # GET /managers.json
  # def index
  #   @managers = Manager.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @managers }
  #   end
  # end

  # GET /managers/1
  # GET /managers/1.json
  def show
    @location = Location.find(params[:location_id])
    @manager = Manager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manager }
    end
  end

  # GET /managers/new
  # GET /managers/new.json
  def new
    @location = Location.find(params[:location_id])
    @manager = Manager.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manager }
    end
  end

  # GET /managers/1/edit
  def edit
    @location = Location.find(params[:location_id])
    @manager = Manager.find(params[:id])
  end

  # POST /managers
  # POST /managers.json
  def create
    @location = Location.find(params[:location_id])
    @manager = @location.managers.build(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to location_path(@location), notice: 'Manager was successfully created.' }
        format.json { render json: @manager, status: :created, location: @manager }
      else
        format.html { render action: "new" }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /managers/1
  # PUT /managers/1.json
  def update
    @location = Location.find(params[:location_id])
    @manager = Manager.find(params[:id])

    respond_to do |format|
      if @manager.update_attributes(manager_params)
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
    @location = Location.find(params[:location_id])
    @manager = Manager.find(params[:id])
    @manager.destroy

    respond_to do |format|
      format.html { redirect_to location_path(@manager.location) }
      format.json { head :no_content }
    end
  end

  private
  def manager_params
    params.require(:manager).permit(:email, :password_confirmation, :password, :first_name, :last_name, :location_id, :title)
  end
end
