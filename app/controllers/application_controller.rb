class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :populate_tags
  helper_method :current_user
  
  protected 
  
  layout :layout_by_resource
  
  def layout_by_resource
    if devise_controller? and current_user
      "application"
    elsif devise_controller? and resource_class == SuperAdmin
      "devise_layout"
    elsif devise_controller? and resource_class == Citizen
      "citizen_devise"
    else
      "application"
    end
  end

  def devise_parameter_sanitizer
    if resource_class == Citizen
      Citizen::ParameterSanitizer.new(Citizen, :citizen, params)
    else
      super
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
