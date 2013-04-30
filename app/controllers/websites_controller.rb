class WebsitesController < ApplicationController
  before_filter :authenticate_super_admin!
  
  def index
  	@businesses = current_super_admin.businesses
  end
end