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

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#prof-pif').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
  }

  $("#super_admin_avatar").change(function(){
  readURL(this);
});

// jQuery.ajaxSetup({ 
//   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
// })

// jQuery.fn.submitWithAjax = function() {
//   this.submit(function() {
//     $.post(this.action, $(this).serialize(), null, "script");
//     return false;
//   })
//   return this;
// };