<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>团队服务中心联系</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
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
</head>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><A>个人信息</A> </LI>
  <LI><A>业绩查询</A> </LI>
  <LI><A>财务管理</A> </LI>
  <LI><A>消息管理</A> </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout">退出系统</A> </LI>
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title>团队服务中心联系</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <div align="center">
	<table border="0" width="60%" id="table1" height="209" cellspacing="3" cellpadding="2">
		<tr>
			<td align="right" width="32%">团队服务中心编号：</td>
			<td width="66%"><font color="#FF0000">${upuname}***</font></td>
		</tr>
		<tr>
			<td align="right" width="32%">称谓：</td>
			<td width="66%"><font color="#0000FF">${gcuserup.name}</font></td>
		</tr>
		<tr>
			<td align="right" width="32%">联系QQ：</td>
			<td width="66%"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>${gcuserup.qq}</td>
		</tr>
		<tr>
			<td align="right" width="32%">联系电话：</td>
			<td width="66%">${gcuserup.call}</td>
		</tr>
		<tr>
			<td align="right" width="32%">收款账号：</td>
			<td width="66%">${gcuserup.bank}-${gcuserup.card}</td>
		</tr>
		<tr>
			<td><p align="right">开户行所在地：</td>
			<td>${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}支行</td>
		</tr>
		<tr>
			<td colspan="2"><p><b><font size="2" color="#008000">&nbsp;&nbsp;&nbsp; 有关业务问题可咨询，如您无法在一币市场进行收购一币的操作或您想省去在收一币中（打款，等对方确认）的中间环节，就可以联系本团队服务中心快速购买（按1000一币，付款950元的比例进行）</font></b></td>
		</tr>
	</table>
	</div>
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>