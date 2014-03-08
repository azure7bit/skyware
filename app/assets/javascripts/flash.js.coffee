$(document).ajaxComplete (event, request) ->
	msg = request.getResponseHeader("X-Message")
	type = request.getResponseHeader("X-Message-Type")
	switch type
		when 'success' then alert_type = 'success'
		when 'error' then alert_type = 'danger'
		when 'notice' then alert_type = 'info'

	unless request.getResponseHeader("X-Message-Type").indexOf("keep") is 0
		$(".flash_msg_container").html("<div class='flash alert alert-#{alert_type} alert-dismissable'>
		<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
		#{msg}
		</div>") if msg
	$(".flash_msg_container").html("") unless msg