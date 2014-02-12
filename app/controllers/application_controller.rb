class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :populate_tags
  helper_method :current_user
  
  protected 
  
  layout :layout_by_resource
  
  def layout_by_resource
    if devise_controller? and current_user
      "application"
    elsif devise_controller?
      "devise_layout"
    else
      "application"
    end
  end
  
  def populate_tags
    @super_admin = current_super_admin
  end

  def current_user
      current_super_admin or current_citizen
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    root_url(subdomain: 'www')
  end
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.class == Citizen
      root_url(subdomain: resource_or_scope.subdomain)
    else
      super
    end
  end
end
