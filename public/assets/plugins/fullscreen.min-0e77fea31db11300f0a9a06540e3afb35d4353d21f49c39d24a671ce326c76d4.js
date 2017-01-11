/*!
 * froala_editor v2.4.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2016 Froala Labs
 */


!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof module&&module.exports?module.exports=function(b,c){return void 0===c&&(c="undefined"!=typeof window?require("jquery"):require("jquery")(b)),a(c),c}:a(jQuery)}(function(a){a.FE.PLUGINS.fullscreen=function(b){function c(){return b.$box.hasClass("fr-fullscreen")}function d(){i=a(b.o_win).scrollTop(),b.$box.toggleClass("fr-fullscreen"),a("body").toggleClass("fr-fullscreen"),j=a('<div style="display: none;"></div>'),b.$box.after(j),b.helpers.isMobile()&&(b.$tb.data("parent",b.$tb.parent()),b.$tb.prependTo(b.$box),b.$tb.data("sticky-dummy")&&b.$tb.after(b.$tb.data("sticky-dummy"))),k=b.opts.height,l=b.opts.heightMax,m=b.opts.zIndex,b.opts.height=b.o_win.innerHeight-(b.opts.toolbarInline?0:b.$tb.outerHeight()),b.opts.zIndex=9990,b.opts.heightMax=null,b.size.refresh(),b.opts.toolbarInline&&b.toolbar.showInline();for(var c=b.$box.parent();!c.is("body");)c.data("z-index",c.css("z-index")).css("z-index","9990"),c=c.parent();b.events.trigger("charCounter.update"),b.$win.trigger("scroll")}function e(){b.$box.toggleClass("fr-fullscreen"),a("body").toggleClass("fr-fullscreen"),b.$tb.prependTo(b.$tb.data("parent")),b.$tb.data("sticky-dummy")&&b.$tb.after(b.$tb.data("sticky-dummy")),b.opts.height=k,b.opts.heightMax=l,b.opts.zIndex=m,b.size.refresh(),a(b.o_win).scrollTop(i),b.opts.toolbarInline&&b.toolbar.showInline(),b.events.trigger("charCounter.update"),b.opts.toolbarSticky&&b.opts.toolbarStickyOffset&&(b.opts.toolbarBottom?b.$tb.css("bottom",b.opts.toolbarStickyOffset).data("bottom",b.opts.toolbarStickyOffset):b.$tb.css("top",b.opts.toolbarStickyOffset).data("top",b.opts.toolbarStickyOffset));for(var c=b.$box.parent();!c.is("body");)c.data("z-index")&&(c.css("z-index",""),c.css("z-index")!=c.data("z-index")&&c.css("z-index",c.data("z-index")),c.removeData("z-index")),c=c.parent();b.$win.trigger("scroll")}function f(){c()?e():d(),g(b.$tb.find('.fr-command[data-cmd="fullscreen"]'))}function g(a){var d=c();a.toggleClass("fr-active",d).attr("aria-pressed",d),a.find("> *:not(.fr-sr-only)").replaceWith(d?b.icon.create("fullscreenCompress"):b.icon.create("fullscreen"))}function h(){return!!b.$wp&&(b.events.$on(a(b.o_win),"resize",function(){c()&&(e(),d())}),void b.events.on("toolbar.hide",function(){if(c()&&b.helpers.isMobile())return!1}))}var i,j,k,l,m;return{_init:h,toggle:f,refresh:g,isActive:c}},a.FE.RegisterCommand("fullscreen",{title:"Fullscreen",undo:!1,focus:!1,accessibilityFocus:!0,forcedRefresh:!0,toggle:!0,callback:function(){this.fullscreen.toggle()},refresh:function(a){this.fullscreen.refresh(a)},plugin:"fullscreen"}),a.FE.DefineIcon("fullscreen",{NAME:"expand"}),a.FE.DefineIcon("fullscreenCompress",{NAME:"compress"})});
