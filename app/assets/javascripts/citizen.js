//= require jquery
//= require bootstrap
//= require_directory ./citizen

$.validator.setDefaults({
    highlight: function(element) {
        $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function(element) {
        $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function(error, element) {
    	element.closest('.form-group').removeClass('has-success').addClass('has-error has-feedback');
    	element.closest('.form-group').find('.form-control-feedback').remove();
    	$('<span class="glyphicon glyphicon-remove form-control-feedback"></span>').insertAfter(element);
        error.insertAfter(element.parent());
    },
    success: function(element){
    	element.closest('.form-group').removeClass('has-error').addClass('has-feedback has-success');
    	element.closest('.form-group').find('.form-control-feedback').remove();
    	$('<span class="glyphicon glyphicon-ok form-control-feedback"></span>').insertAfter(element.closest('.form-group').find('.form-control'));
    }
});

var form = $( ".citizen.reg-page" );
form.validate({
	rules: {
		'citizen[email]' : {
			required: true,
			email: true,
			remote: {
				url: 'check-email',
				method: 'post'
			}
		},
		'citizen[subdomain]' : {
			required: false,
			remote: {
				url: 'check-subdomain',
				method: 'post'
			}
		},
		'citizen[password]' : 'required',
		'citizen[password_confirmation]' : {
			required: true,
			equalTo: '#citizen_password'
		}
	},
	messages: {
		'citizen[email]' : {
			remote: "Email has already been taken"
		},
		'citizen[subdomain]' : {
			remote: 'HQID has already been taken'
		},
		'citizen[password_confirmation]': {
			equalTo: 'Must match with the password above'
		}
	}
});