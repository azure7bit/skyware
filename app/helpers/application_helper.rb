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

  def resource_business
    @resource ||= BusinessUser.new
  end

  def resource
     @resource = Citizen.new
     @resource ||= BusinessUser.new
  end

  def resource_name
    resource_name = :citizen
    resource_name ||= :super_admin
    return resource_name
  end

  def new_blogit
    Blogit::Post.new
  end

end