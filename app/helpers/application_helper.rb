module ApplicationHelper
  def flash_messages(opts = {})
    # raise
    alert_type = {success: :success, error: :danger, notice: :info, alert: :danger}
    flash.each do |msg_type, text|
      concat(
        content_tag(:div, class: "alert alert-#{alert_type[msg_type]} alert-dismissable") do
          '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>'.html_safe + text
        end
      )
    end
    nil
  end

  def resource_admin
    @resource ||= SuperAdmin.new
  end

  def resource
     @resource = Citizen.new
     @resource ||= SuperAdmin.new
     @resource ||= User.new
  end

  def resource_name
    resource_name = :citizen
    resource_name ||= :super_admin
    return resource_name
  end

end



# def create
#  unless Mentor.find_by_email(params[:mentor][:email])
#         auth_options = {scope: :mentee, recall: 'sessions#new'}
#        resource_name = :mentee
#        warden.config[:default_scope] = :mentee
#        params[:mentee] = params.delete(:mentor)
#        resource_name = :mentee
#      else
#        resource_name = :mentor
#        auth_options = {scope: :mentor, recall: 'sessions#new'}
#      end
#      resource = warden.authenticate!(auth_options)
#      set_flash_message(:notice, :signed_in) if is_navigational_format?
#      sign_in(resource_name, resource)
#      respond_with resource, :location => after_sign_in_path_for(resource)
#    end
