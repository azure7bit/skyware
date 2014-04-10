// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap
//= require holder
//= require html5shiv
//= require respond.min
//= require_tree ./application/libraries
//= require_self
//= require_directory ./application
//= require_directory ./blog
//= require flash
//= require jquery-ui.1.8
//= require autocomplete

function readKeyPress(input, e){
  if(e.keyCode == 13){
    $.ajax({
     type: 'POST',
      url: '/reply_comment/' + $(input).attr('data-id'),
      data: {reply: input.value, post_id: $(input).attr('data-id')}
    });
    return false;
  }
}

function replyInbox(input){
	
	if(e.keyCode == 13){
    $.ajax({
     type: 'POST',
      url: '/inbox/'+$(input).attr('data-id')+'/reply',
      data: {reply: input.value, post_id: $(input).attr('data-id')}
    });
    return false;
  }
}