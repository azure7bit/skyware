class WebsitesController < ApplicationController
  before_filter :authenticate_super_admin!
  def index

  end
end