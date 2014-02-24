$(function(){

	var toggleSidebar = $("#togglesidebar");
	var primary = $("#primary");
	var secondary = $("#secondary");
	var window_height = $(window).height();

	toggleSidebar.on("click", function(){

		if(primary.hasClass("col-sm-9")){
			primary.removeClass("col-sm-9");
			primary.addClass("col-sm-12");
			secondary.css('display', 'none');
		}
		else {
			primary.removeClass("col-sm-12");
			primary.addClass("col-sm-9");
			secondary.css('display', 'inline-block');
		}

		if(window_height < secondary.height()){
			secondary.css("overflow", "auto");
		}
		else{
			secondary.css("overflow", "visible");
		}
	});

	var toggleSidebar = $("#togglesidebar-1");

	toggleSidebar.on("click", function(){

		if(primary.hasClass("col-sm-9") || primary.hasClass("col-sm-8")){
			primary.removeClass("col-sm-9");
			primary.removeClass("col-sm-8");
			primary.addClass("col-sm-12");
			secondary.css('display', 'none');
		}
		else {
			primary.removeClass("col-sm-12");
			primary.addClass("col-sm-9");
			secondary.css('display', 'inline-block');
		}

		if($(window).width() <= 1366 && primary.hasClass("col-sm-9")){
			primary.removeClass("col-sm-9");
			primary.addClass("col-sm-8");
		}
	});

});

$(document).ready(function() {
    var showChar = 355;
    var showChar2 = 200;
    var ellipsestext = "...";
    var moretext = "More";
    var lesstext = "Less";
    $('.more').each(function() {
        var content = $(this).html();if(showChar < content.length) {
            var c = content.substr(0, showChar);
            var h = content.substr(showChar-1, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
    });
 	 $('.more_about').each(function() {
        var content = $(this).html();
        if(showChar2 < content.length) {
            var c = content.substr(0, showChar2);
            var h = content.substr(showChar2-1, content.length - showChar2);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
    });
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
});