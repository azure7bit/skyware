class WebsitesController < ApplicationController
  before_filter :authenticate_super_admin!
  
  def index
  	@businesses = current_super_admin.businesses
  	@json = Business.all.to_gmaps4rails
  end
end