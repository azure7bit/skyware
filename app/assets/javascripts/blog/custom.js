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

		if($(window).width() <= 1366 && primary.hasClass("col-sm-9")){
			primary.removeClass("col-sm-9");
			primary.addClass("col-sm-8");
		}
	});

});