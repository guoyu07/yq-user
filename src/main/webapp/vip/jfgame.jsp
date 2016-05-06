<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>积分游戏</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="首页";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});


</SCRIPT>
<script language="JavaScript">
 function checkdate()  {  
  if (Form.pa.value=="") {      alert("请输入登录密码密码!");      return false;    } 
  return true;  }  
 </script>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j?inputUrl=login2j.jsp" style="text-decoration: none">个人信息</A> </LI>
  <LI><A>业绩查询</A> 
  </LI>
  <LI><A>财务管理</A> 
  </LI>
  <LI><A>消息管理</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout">退出系统</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title>积 分 游 戏</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
        <p align="center">
		<strong><font size="6" color="#000000">积 分 游 戏</font></strong><p align="center">
		　<p align="center">
		<img border="0" src="images/02.png" width="926" height="238"><p align="center">
		　<p align="center">
		<a href="http://p.cfjte.com/GameInfo.html"><font color="#FF0000" size="3">积分游戏介绍</font></a>&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000" size="3">&nbsp;<a href="http://p.cfjte.com/FaqList.html"><font color="#FF0000">帮助中心</font></a>&nbsp;&nbsp;&nbsp; </font><b> <font color="#008000" size="3">&nbsp;</font></b><p align="center">
		　<p align="center">
		<b> <font color="#008000" size="3">提示：</font></b><font color="#FF0000" size="3"><a target="_blank" href="http://p.cfjte.com/download/棋牌游戏中心.exe"><font color="#0000FF">首次游戏请先下载游戏大厅并安装</font></a>（使用<a target="_blank" href="http://ie.sogou.com"><font color="#800000">搜狗浏览器</font></a>下载速度最佳）</font><p align="center">
		　<p align="center">
		<b><font color="#0000FF" size="3">您还没有激活积分游戏，按此处进行激活！</font></b><form method="POST" action="jfgame?status=1" name="Form" onSubmit="return checkdate()" >
			<p align="center">　</p>
			<p align="center"><font size="6" color="#FF00FF">近日将对游戏系统进行全面升级，对您带来不便敬请谅解！</font></p>
			<p align="center">　</p>
			<p align="center"><input type="submit" value="马上激活" name="B1" onClick="return confirm('提示：您确定了吗？')" ></p>
		</form>
		</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
<p align="center">
　</p>
</body> 
</html>