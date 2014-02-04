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

end
