/*

Holder - 2.0 - client side image placeholders
(c) 2012-2013 Ivan Malopinsky / http://imsky.co

Provided under the Apache 2.0 License: http://www.apache.org/licenses/LICENSE-2.0
Commercial use requires attribution.

*/
var Holder=Holder||{};(function(e,t){function o(e,t){var n="complete",r="readystatechange",i=!1,s=i,o=!0,u=e.document,a=u.documentElement,f=u.addEventListener?"addEventListener":"attachEvent",l=u.addEventListener?"removeEventListener":"detachEvent",c=u.addEventListener?"":"on",h=function(o){(o.type!=r||u.readyState==n)&&((o.type=="load"?e:u)[l](c+o.type,h,i),!s&&(s=!0)&&t.call(e,null))},p=function(){try{a.doScroll("left")}catch(e){setTimeout(p,50);return}h("poll")};if(u.readyState==n)t.call(e,"lazy");else{if(u.createEventObject&&a.doScroll){try{o=!e.frameElement}catch(d){}o&&p()}u[f](c+"DOMContentLoaded",h,i),u[f](c+r,h,i),e[f](c+"load",h,i)}}function u(e){e=e.match(/^(\W)?(.*)/);var t=document["getElement"+(e[1]?e[1]=="#"?"ById":"sByClassName":"sByTagName")](e[2]),n=[];return t!=null&&(t.length?n=t:t.length==0?n=t:n=[t]),n}function a(e,t){var n={};for(var r in e)n[r]=e[r];for(var i in t)n[i]=t[i];return n}function f(e,t,n){t=parseInt(t,10),e=parseInt(e,10);var r=Math.max(t,e),i=Math.min(t,e),s=1/12,o=Math.min(i*.75,.75*r*s);return{height:Math.round(Math.max(n.size,o))}}function l(e,t,n,r){var i=f(t.width,t.height,n),o=i.height,u=t.width*r,a=t.height*r,l=n.font?n.font:"sans-serif";s.width=u,s.height=a,e.textAlign="center",e.textBaseline="middle",e.fillStyle=n.background,e.fillRect(0,0,u,a),e.fillStyle=n.foreground,e.font="bold "+o+"px "+l;var c=n.text?n.text:Math.floor(t.width)+"x"+Math.floor(t.height),h=e.measureText(c).width;return h/u>=.75&&(o=Math.floor(o*.75*(u/h))),e.font="bold "+o*r+"px "+l,e.fillText(c,u/2,a/2,u),s.toDataURL("image/png")}function c(e,t,n,i){var s=n.dimensions,o=n.theme,u=n.text?decodeURIComponent(n.text):n.text,f=s.width+"x"+s.height;o=u?a(o,{text:u}):o,o=n.font?a(o,{font:n.font}):o;if(e=="image"){t.setAttribute("data-src",i),t.setAttribute("alt",u?u:o.text?o.text+" ["+f+"]":f);if(r||!n.auto)t.style.width=s.width+"px",t.style.height=s.height+"px";r?t.style.backgroundColor=o.background:t.setAttribute("src",l(d,s,o,g))}else if(e=="background")r||(t.style.backgroundImage="url("+l(d,s,o,g)+")",t.style.backgroundSize=s.width+"px "+s.height+"px");else if(e=="fluid"){t.setAttribute("data-src",i),t.setAttribute("alt",u?u:o.text?o.text+" ["+f+"]":f),s.height.substr(-1)=="%"?t.style.height=s.height:t.style.height=s.height+"px",s.width.substr(-1)=="%"?t.style.width=s.width:t.style.width=s.width+"px";if(t.style.display=="inline"||t.style.display=="")t.style.display="block";r?t.style.backgroundColor=o.background:(t.holderData=n,y.push(t),h(t))}}function h(e){var t;e.nodeType==null?t=y:t=[e];for(i in t){var n=t[i];if(n.holderData){var r=n.holderData;n.setAttribute("src",l(d,{height:n.clientHeight,width:n.clientWidth},r.theme,g))}}}function p(t,n){var r={theme:b.themes.gray},i=!1;for(sl=t.length,j=0;j<sl;j++){var s=t[j];e.flags.dimensions.match(s)?(i=!0,r.dimensions=e.flags.dimensions.output(s)):e.flags.fluid.match(s)?(i=!0,r.dimensions=e.flags.fluid.output(s),r.fluid=!0):e.flags.colors.match(s)?r.theme=e.flags.colors.output(s):n.themes[s]?r.theme=n.themes[s]:e.flags.text.match(s)?r.text=e.flags.text.output(s):e.flags.font.match(s)?r.font=e.flags.font.output(s):e.flags.auto.match(s)&&(r.auto=!0)}return i?r:!1}var n=!1,r=!1,s=document.createElement("canvas");document.getElementsByClassName||(document.getElementsByClassName=function(e){var t=document,n,r,i,s=[];if(t.querySelectorAll)return t.querySelectorAll("."+e);if(t.evaluate){r=".//*[contains(concat(' ', @class, ' '), ' "+e+" ')]",n=t.evaluate(r,t,null,0,null);while(i=n.iterateNext())s.push(i)}else{n=t.getElementsByTagName("*"),r=new RegExp("(^|\\s)"+e+"(\\s|$)");for(i=0;i<n.length;i++)r.test(n[i].className)&&s.push(n[i])}return s}),window.getComputedStyle||(window.getComputedStyle=function(e,t){return this.el=e,this.getPropertyValue=function(t){var n=/(\-([a-z]){1})/g;return t=="float"&&(t="styleFloat"),n.test(t)&&(t=t.replace(n,function(){return arguments[2].toUpperCase()})),e.currentStyle[t]?e.currentStyle[t]:null},this}),Object.prototype.hasOwnProperty||(Object.prototype.hasOwnProperty=function(e){var t=this.__proto__||this.constructor.prototype;return e in this&&(!(e in t)||t[e]!==this[e])});if(!s.getContext)r=!0;else if(s.toDataURL("image/png").indexOf("data:image/png")<0)r=!0;else var d=s.getContext("2d");var v=1,m=1;r||(v=window.devicePixelRatio||1,m=d.webkitBackingStorePixelRatio||d.mozBackingStorePixelRatio||d.msBackingStorePixelRatio||d.oBackingStorePixelRatio||d.backingStorePixelRatio||1);var g=v/m,y=[],b={domain:"holder.js",images:"img",bgnodes:".holderjs",themes:{gray:{background:"#eee",foreground:"#aaa",size:12},social:{background:"#3a5a97",foreground:"#fff",size:12},industrial:{background:"#434A52",foreground:"#C2F200",size:12}},stylesheet:".holderjs-fluid {font-size:16px;font-weight:bold;text-align:center;font-family:sans-serif;margin:0}"};e.flags={dimensions:{regex:/^(\d+)x(\d+)$/,output:function(e){var t=this.regex.exec(e);return{width:+t[1],height:+t[2]}}},fluid:{regex:/^([0-9%]+)x([0-9%]+)$/,output:function(e){var t=this.regex.exec(e);return{width:t[1],height:t[2]}}},colors:{regex:/#([0-9a-f]{3,})\:#([0-9a-f]{3,})/i,output:function(e){var t=this.regex.exec(e);return{size:b.themes.gray.size,foreground:"#"+t[2],background:"#"+t[1]}}},text:{regex:/text\:(.*)/,output:function(e){return this.regex.exec(e)[1]}},font:{regex:/font\:(.*)/,output:function(e){return this.regex.exec(e)[1]}},auto:{regex:/^auto$/}};for(var w in e.flags){if(!e.flags.hasOwnProperty(w))continue;e.flags[w].match=function(e){return e.match(this.regex)}}e.add_theme=function(t,n){return t!=null&&n!=null&&(b.themes[t]=n),e},e.add_image=function(t,n){var r=u(n);if(r.length)for(var i=0,s=r.length;i<s;i++){var o=document.createElement("img");o.setAttribute("data-src",t),r[i].appendChild(o)}return e},e.run=function(t){var r=a(b,t),i=[],s=[],o=[];typeof r.images=="string"?s=u(r.images):window.NodeList&&r.images instanceof window.NodeList?s=r.images:window.Node&&r.images instanceof window.Node&&(s=[r.images]),typeof r.bgnodes=="string"?o=u(r.bgnodes):window.NodeList&&r.elements instanceof window.NodeList?o=r.bgnodes:window.Node&&r.bgnodes instanceof window.Node&&(o=[r.bgnodes]),n=!0;for(d=0,h=s.length;d<h;d++)i.push(s[d]);var f=document.getElementById("holderjs-style");f||(f=document.createElement("style"),f.setAttribute("id","holderjs-style"),f.type="text/css",document.getElementsByTagName("head")[0].appendChild(f)),r.nocss||(f.styleSheet?f.styleSheet.cssText+=r.stylesheet:f.appendChild(document.createTextNode(r.stylesheet)));var l=new RegExp(r.domain+'/(.*?)"?\\)');for(var h=o.length,d=0;d<h;d++){var v=window.getComputedStyle(o[d],null).getPropertyValue("background-image"),m=v.match(l),g=o[d].getAttribute("data-background-src");if(m){var y=p(m[1].split("/"),r);y&&c("background",o[d],y,v)}else if(g!=null){var y=p(g.substr(g.lastIndexOf(r.domain)+r.domain.length+1).split("/"),r);y&&c("background",o[d],y,v)}}for(h=i.length,d=0;d<h;d++){var w=attr_data_src=v=null;try{w=i[d].getAttribute("src"),attr_datasrc=i[d].getAttribute("data-src")}catch(E){}attr_datasrc==null&&!!w&&w.indexOf(r.domain)>=0?v=w:!!attr_datasrc&&attr_datasrc.indexOf(r.domain)>=0&&(v=attr_datasrc);if(v){var y=p(v.substr(v.lastIndexOf(r.domain)+r.domain.length+1).split("/"),r);y&&(y.fluid?c("fluid",i[d],y,v):c("image",i[d],y,v))}}return e},o(t,function(){window.addEventListener?(window.addEventListener("resize",h,!1),window.addEventListener("orientationchange",h,!1)):window.attachEvent("onresize",h),n||e.run()}),typeof define=="function"&&define.amd&&define("Holder",[],function(){return e})})(Holder,window);