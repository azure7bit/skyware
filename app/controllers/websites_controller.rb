class WebsitesController < ApplicationController
  before_filter :authenticate_super_admin!, :except => :home
  
  def index
  	@businesses = current_super_admin.businesses
  	@json = Business.all.to_gmaps4rails
  end
  
  def home
    render 'websites/home', :layout => false
  end
end