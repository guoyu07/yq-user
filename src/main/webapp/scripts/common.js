$().ready(function() {

	//双色格
	(function(){
		$(".content-table tr:odd").css("background","#fff");
	})();

	//二级导航
	$(".nav a").click(function(){
		$(this).siblings("div").show();
	});

	$(".close").click(function(){
		$(this).parent().hide();
	});

	/*
	$(".nav a").hover(function(){$(this).siblings("div").show();});
	$(".ej").mouseout(function(){$(this).hide();})
	*/

	//hover 抢购背景
	$(".cp-list li").hover(function(){
		$(this).addClass("hover");
	},function(){
		$(this).removeClass("hover");
	});

	//登录导航切换
	$(".clickTop span").click(function(){
		$(".d-nav").slideToggle();
		$(this).toggleClass("hover");
	});

	$(".denglu").height($(this).height());

});