class BusinessMessengersController < ApplicationController
  # GET /business_messengers
  # GET /business_messengers.json
  def index
    @business_messengers = BusinessMessenger.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_messengers }
    end
  end

  # GET /business_messengers/1
  # GET /business_messengers/1.json
  def show
    @business_messenger = BusinessMessenger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_messenger }
    end
  end

  # GET /business_messengers/new
  # GET /business_messengers/new.json
  def new
    @business_messenger = BusinessMessenger.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_messenger }
    end
  end

  # GET /business_messengers/1/edit
  def edit
    @business_messenger = BusinessMessenger.find(params[:id])
  end

  # POST /business_messengers
  # POST /business_messengers.json
  def create
    @business_messenger = BusinessMessenger.new(params[:business_messenger])

    respond_to do |format|
      if @business_messenger.save
        format.html { redirect_to @business_messenger, notice: 'Business messenger was successfully created.' }
        format.json { render json: @business_messenger, status: :created, location: @business_messenger }
      else
        format.html { render action: "new" }
        format.json { render json: @business_messenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_messengers/1
  # PUT /business_messengers/1.json
  def update
    @business_messenger = BusinessMessenger.find(params[:id])

    respond_to do |format|
      if @business_messenger.update_attributes(params[:business_messenger])
        format.html { redirect_to @business_messenger, notice: 'Business messenger was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_messenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_messengers/1
  # DELETE /business_messengers/1.json
  def destroy
    @business_messenger = BusinessMessenger.find(params[:id])
    @business_messenger.destroy

    respond_to do |format|
      format.html { redirect_to business_messengers_url }
      format.json { head :no_content }
    end
  end
end
