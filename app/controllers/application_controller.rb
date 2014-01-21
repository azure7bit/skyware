class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :populate_tags
  
  protected 
  
  layout :layout_by_resource
  
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
        "devise"
    else
        "application"
    end
  end
  
  def populate_tags
    @super_admin = current_super_admin
  end
end
