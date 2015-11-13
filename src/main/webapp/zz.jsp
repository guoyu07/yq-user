<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.bg{display:none;position:fixed;width:100%;height:100%;background:#000;z-index:2;top:0;left:0;opacity:0.7;}
.content{display:none;width:500px;height:100px;position:fixed;top:50%;margin-top:-150px;background:#fff;z-index:3;left:50%;margin-left:-250px;}
</style>
	<script src="/scripts/jquery.js"></script>
<body> 
<p><div class="click1" style="color:red">点击这里</div></p>
<div></div>
<div class="bg"></div>
<div class="content">
<p>操作正在执行！请稍后片刻。。。</p>
</div>

<script type="text/javascript">
$(function(){

    $('.click1').click(function(){
        $('.bg').fadeIn(200);
        $('.content').fadeIn(400);
});

$('.bg').click(function(){
    $('.bg').fadeOut(800);
    $('.content').fadeOut(800);
});
});
</script>
</body>

</html>