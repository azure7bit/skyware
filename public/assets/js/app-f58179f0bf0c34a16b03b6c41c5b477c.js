/*   
 * Template Name: Unify - Responsive Bootstrap Template
 * Description: Business, Corporate, Portfolio and Blog Theme.
 * Version: 1.3
 * Author: Html Stream
 * Website: http://htmlstream.com/preview/unify
*/
var App=function(){function e(){jQuery.browser.msie&&jQuery.browser.version.substr(0,1)<9&&jQuery("input[placeholder], textarea[placeholder]").each(function(){var e=jQuery(this);jQuery(e).val(e.attr("placeholder")),jQuery(e).focus(function(){e.val()==e.attr("placeholder")&&e.val("")}),jQuery(e).blur(function(){(e.val()==""||e.val()==e.attr("placeholder"))&&e.val(e.attr("placeholder"))})})}function t(){jQuery(".carousel").carousel({interval:15e3,pause:"hover"}),jQuery(".tooltips").tooltip(),jQuery(".popovers").popover()}function n(){jQuery(".search").click(function(){jQuery(".search-btn").hasClass("icon-search")?(jQuery(".search-open").fadeIn(500),jQuery(".search-btn").removeClass("icon-search"),jQuery(".search-btn").addClass("icon-remove")):(jQuery(".search-open").fadeOut(500),jQuery(".search-btn").addClass("icon-search"),jQuery(".search-btn").removeClass("icon-remove"))})}function r(){var e=jQuery(".style-switcher");jQuery(".style-switcher-btn").click(function(){jQuery(".style-switcher").show()}),jQuery(".theme-close").click(function(){jQuery(".style-switcher").hide()}),jQuery("li",e).click(function(){var n=jQuery(this).attr("data-style"),r=jQuery(this).attr("data-header");t(n,r),jQuery(".list-unstyled li",e).removeClass("theme-active"),jQuery(this).addClass("theme-active")});var t=function(e,t){jQuery("#style_color").attr("href","assets/css/themes/"+e+".css"),t=="light"?(jQuery("#style_color-header-1").attr("href","assets/css/themes/headers/header1-"+e+".css"),jQuery("#logo-header").attr("src","assets/img/logo1-"+e+".png"),jQuery("#logo-footer").attr("src","assets/img/logo2-"+e+".png")):t=="dark"&&(jQuery("#style_color-header-2").attr("href","assets/css/themes/headers/header2-"+e+".css"),jQuery("#logo-header").attr("src","assets/img/logo1-"+e+".png"),jQuery("#logo-footer").attr("src","assets/img/logo2-"+e+".png"))}}function i(){jQuery(".boxed-layout-btn").click(function(){jQuery(this).addClass("active-switcher-btn"),jQuery(".wide-layout-btn").removeClass("active-switcher-btn"),jQuery("body").addClass("boxed-layout container")}),jQuery(".wide-layout-btn").click(function(){jQuery(this).addClass("active-switcher-btn"),jQuery(".boxed-layout-btn").removeClass("active-switcher-btn"),jQuery("body").removeClass("boxed-layout container")})}return{init:function(){t(),e(),n(),r(),i()},initSliders:function(){$("#clients-flexslider").flexslider({animation:"slide",easing:"swing",animationLoop:!0,itemWidth:1,itemMargin:1,minItems:2,maxItems:9,controlNav:!1,directionNav:!1,move:2}),$("#clients-flexslider1").flexslider({animation:"slide",easing:"swing",animationLoop:!0,itemWidth:1,itemMargin:1,minItems:2,maxItems:5,controlNav:!1,directionNav:!1,move:2}),$("#photo-flexslider").flexslider({animation:"slide",controlNav:!1,animationLoop:!1,itemWidth:80,itemMargin:0}),$("#testimonal_carousel").collapse({toggle:!1})},initFancybox:function(){jQuery(".fancybox-button").fancybox({groupAttr:"data-rel",prevEffect:"none",nextEffect:"none",closeBtn:!0,helpers:{title:{type:"inside"}}})},initBxSlider:function(){$(".bxslider").bxSlider({minSlides:4,maxSlides:4,slideWidth:360,slideMargin:10}),$(".bxslider1").bxSlider({minSlides:3,maxSlides:3,slideWidth:360,slideMargin:10}),$(".bxslider2").bxSlider({minSlides:2,maxSlides:2,slideWidth:360,slideMargin:10})}}}();