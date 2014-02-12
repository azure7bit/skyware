class OnlineStoresController < ApplicationController
 before_filter :authenticate_super_admin!, :except => :show
  # GET /online_stores
  # GET /online_stores.json
  def index
    @online_stores = OnlineStore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @online_stores }
    end
  end

  # GET /online_stores/1
  # GET /online_stores/1.json
  def show
    @online_store = OnlineStore.find(params[:id])
    @products = @online_store.products

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @online_store }
    end
  end

  # GET /online_stores/new
  # GET /online_stores/new.json
  def new
    @online_store = OnlineStore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @online_store }
    end
  end

  # GET /online_stores/1/edit
  def edit
    @online_store = OnlineStore.find(params[:id])
  end

  # POST /online_stores
  # POST /online_stores.json
  def create
    @online_store = current_super_admin.build_online_store(params[:online_store].merge(super_admin_id: current_super_admin.id))

    respond_to do |format|
      if @online_store.save
        format.html { redirect_to @online_store, notice: 'Online store was successfully created.' }
        format.json { render json: @online_store, status: :created, location: @online_store }
      else
        format.html { render action: "new" }
        format.json { render json: @online_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /online_stores/1
  # PUT /online_stores/1.json
  def update
    @online_store = OnlineStore.find(params[:id])

    respond_to do |format|
      if @online_store.update_attributes(params[:online_store])
        format.html { redirect_to @online_store, notice: 'Online store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @online_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /online_stores/1
  # DELETE /online_stores/1.json
  def destroy
    @online_store = OnlineStore.find(params[:id])
    @online_store.destroy

    respond_to do |format|
      format.html { redirect_to online_stores_url }
      format.json { head :no_content }
    end
  end
end
