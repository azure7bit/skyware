//= require jquery
//= require ./website/jquery-migrate-1.2.1.min
//= require bootstrap
//= require ./website/hover-dropdown.min
//= require ./website/back-to-top
//= require ./website/jquery.flexslider-min
//= require ./website/jquery.bxslider
//= require ./website/jquery.fancybox.pack
//= require ./website/jquery.themepunch.revolution.min
//= require ./website/app
//= require ./website/new_index
//= require ./website/gmap
//= require ./website/contact

$(function(){
    App.init();
    App.initSliders();
    App.initFancybox();
    App.initBxSlider();
    Index.initRevolutionSlider();
    Contact.initMap();
})