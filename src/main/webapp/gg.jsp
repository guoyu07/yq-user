<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>无标题文档</title>
<script>
window.onload = function(){
 var adleft = document.getElementById("adleft");
 var adright = document.getElementById("adright");
 var adtop = adleft.offsetTop;
 window.onscroll = function(){
  adleft.style.top = adtop + (document.documentElement.scrollTop || document.body.scrollTop) +"px"; 
  adright.style.top = adtop + (document.documentElement.scrollTop || document.body.scrollTop) +"px"; 
 }
} 
</script>
</head>
<body style="height:2000px;">
<h1>左右广告</h1>
<div id="adleft" style="width:30px;height:100px;padding:20px;font:14px/20px arial;text-align:center;background:#06c;position:absolute;cursor:pointer;color:#fff;left:0; top:150px;">左边广告</div>
<div id="adright" style="width:30px;height:100px;padding:20px;font:14px/20px arial;text-align:center;background:#06c;position:absolute;cursor:pointer;color:#fff;right:0; top:150px;">右边广告</div>
</body>
</html>