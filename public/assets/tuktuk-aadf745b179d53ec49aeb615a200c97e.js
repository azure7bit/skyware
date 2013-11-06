/*
TukTuk - Simple (but powerful) RWD Framework
http://tuktuk.tapquo.com
Copyright (c) 2011-2013 Tapquo S.L. - Licensed GPLv3, Commercial

@namespace  Tuktuk
@author     Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
*/
(function(){var e,t=[].slice;window.TukTuk=e={},e.VERSION="0.7",e.dom=function(){var e;return e=1<=arguments.length?t.call(arguments,0):[],typeof $$!="undefined"&&$$!==null?$$.apply(null,e):$.apply(null,e)},e.ready=e.dom().ready}).call(this),function(){TukTuk.Box=function(e){var t,n,r,i;return r=void 0,t=void 0,i=function(n){return t=e.dom("[data-tuktuk=boxes] #"+n).first(),t.addClass("active"),this},n=function(){return t.removeClass("active"),this},{_Instance:function(){return e.dom("[data-tuktuk=boxes] aside.absolute").each(function(t,n){var r;return r=e.dom(n),r.html("<div>"+r.html()+"</div>")}),e.dom("[data-tuktuk=boxes] [data-box=close]").on("click",function(){return TukTuk.Box.hide()}),e.dom("[data-tuktuk-box]").on("click",function(){return TukTuk.Box.show(e.dom(this).attr("data-tuktuk-box"))})}(),show:i,hide:n}}(TukTuk)}.call(this),function(){TukTuk.Events=function(e){return{init:function(){return TukTuk.dom("[data-control=checkbox]").on("change",function(e){var t,n,r;e.preventDefault(),n=TukTuk.dom(this),r=n.find("input"),t=r[0].checked,r.val(t.toString()),n.removeClass("checked");if(t)return n.addClass("checked")})}()}}(TukTuk)}.call(this),function(){var e;e=function(){var e,t,n,r;e=navigator.userAgent,t=/(Android|BlackBerry|IEMobile|Nokia|iP(ad|hone|od)|Opera M(obi|ini))/,r=!1;if(e.match(t))return n=function(){return window.scrollTo(0,1)},r=!0,addEventListener("load",function(){return setTimeout(n,0)},!1)}}.call(this),function(){var e=[].slice;window.TukTuk||(window.TukTuk={dom:function(){var t;return t=1<=arguments.length?e.call(arguments,0):[],typeof $$!="undefined"&&$$!==null?$$.apply(null,t):$.apply(null,t)}}),window.TukTuk.Modal=function(e){var t,n,r,i,s;return r=void 0,i=void 0,s=function(t){return r.addClass("active").show(),this._hideAnyModal(),i=e.dom("[data-tuktuk=modal]#"+t).addClass("active"),this},t=function(){return r.removeClass("active"),i!=null&&i.removeClass("active"),setTimeout(function(){return r.attr("data-loading","false").hide()},250),this},n=function(e){return this._hideAnyModal(),r.attr("data-loading","true").addClass("active").show(),this},{_hideAnyModal:function(){return e.dom("[data-tuktuk=modal]").removeClass("active")},_Instance:function(){return e.dom("[data-tuktuk=modal].side").each(function(t,n){return i=e.dom(n),i.html("<div>"+i.html()+"</div>")}),e.dom("[data-tuktuk=modal] [data-modal=close]").on("click",function(){return TukTuk.Modal.hide()}),e.dom("[data-tuktuk-modal]").on("click",function(){return TukTuk.Modal.show(e.dom(this).attr("data-tuktuk-modal"))}),e.dom(document.body).append('<div data-tuktuk="lock" data-loading="false">\n  <div class="loading">\n    <div class="container">\n        <span class="top"></span>\n        <span class="right"></span>\n        <span class="bottom"></span>\n        <span class="left"></span>\n    </div>\n  </div>\n</div>'),r=e.dom("[data-tuktuk=lock]").first()}(),show:s,hide:t,loading:n}}(TukTuk)}.call(this);