$(document).ready(function(){$status=$(".status");var e={autoPlayDelay:4e3,pauseOnHover:!1,hidePreloaderDelay:500,nextButton:!0,prevButton:!0,pauseButton:!0,preloader:!0,hidePreloaderUsingCSS:!1,animateStartingFrameIn:!0,navigationSkipThreshold:750,customKeyEvents:{80:"pause"}},t=$("#sequence").sequence(e).data("sequence");t.afterNextFrameAnimatesIn=function(){t.settings.autoPlay&&!t.hardPaused&&!t.isPaused&&$status.addClass("active").css("opacity",1),$(".prev, .next").css("cursor","pointer").animate({opacity:1},500)},t.beforeCurrentFrameAnimatesOut=function(){t.settings.autoPlay&&!t.hardPaused&&$status.css({opacity:0},500).removeClass("active"),$(".prev, .next").css("cursor","auto").animate({opacity:.7},500)},t.paused=function(){$status.css({opacity:0}).removeClass("active").addClass("paused")},t.unpaused=function(){t.hardPaused||$status.removeClass("paused").addClass("active").css("opacity",1)}});