class LocationsController < ApplicationController
  # before_filter :authenticate_super_admin!, :only => [:index, :new, :create, :update, :destroy]
  # before_filter :authenticate_business_user!, :only => [:index, :new, :create, :update, :destroy]

  def index
    @locations = current_user.locations
    # @locations ||= current_user.locations

    @json = @locations.to_gmaps4rails

     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @locations }
     end
  end

  def show
    @location = Location.find(params[:id])
    # @managers = @location.managers
    @json = @location.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = current_user.locations.build(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
  private
  def location_params
    params.require(:location).permit(:name, :street, :city, :state, :zipcode, :country)
  end
end
