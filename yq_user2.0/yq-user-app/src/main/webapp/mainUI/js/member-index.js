!function(n){n.fn.swBanner=function(e){var i={animateTime:300,delayTime:5e3},a=n.extend({},i,e);return this.each(function(){function e(n){s.eq(n).addClass("active").siblings().removeClass("active"),o.eq(n).addClass("current").siblings().removeClass("current")}function i(){t=setInterval(function(){var n=$obj.find(".fomW").find("a.current").index();e((n+1)%c)},r)}$obj=n(this);var t,r=(a.animateTime,a.delayTime),s=$obj.find(".banList li"),c=s.length,o=$obj.find(".fomW a"),f=0;o.click(function(){s.is(":animated")||(f=n(this).index(),e(f))}),s.hover(function(){clearInterval(t)},function(){i()}),i()})}}(jQuery),$(function(){$(".banner").swBanner()});