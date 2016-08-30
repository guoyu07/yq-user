<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>团队服务中心<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1050407'/></title>
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
    document.getElementById("mTitle").innerHTML="<s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/>";
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
  <LI><A><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></A> </LI>
  <LI><A><s:text name='viewlinks.html.links.html.627723500'/></A> </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.1097687684'/></A> </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.860074668'/></A> </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1119407294'/></A> </LI>
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location><s:text name='vipvipup.jsp.vipup.jsp.-1860602679'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><s:text name='vipvipup.jsp.vipup.jsp.858899918'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <div align="center">
	<table border="0" width="60%" id="table1" height="209" cellspacing="3" cellpadding="2">
		<tr>
			<td align="right" width="32%"><s:text name='viewservice.jsp.service.jsp.858879560'/>：</td>
			<td width="66%"><font color="#FF0000">${upuname}***</font></td>
		</tr>
		<tr>
			<td align="right" width="32%"><s:text name='viewservice.jsp.service.jsp.1003555'/>：</td>
			<td width="66%"><font color="#0000FF">${gcuserup.name}</font></td>
		</tr>
		<tr>
			<td align="right" width="32%"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1050407'/>QQ：</td>
			<td width="66%"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>${gcuserup.qq}</td>
		</tr>
		<tr>
			<td align="right" width="32%"><s:text name='vipvipup.jsp.vipup.jsp.1010407087'/>：</td>
			<td width="66%">${gcuserup.call}</td>
		</tr>
		<tr>
			<td align="right" width="32%"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.799409753'/>：</td>
			<td width="66%">${gcuserup.bank}-${gcuserup.card}</td>
		</tr>
		<tr>
			<td><p align="right"><s:text name='reg.jsp.reg.jsp.-1009112269'/>：</td>
			<td>${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}<s:text name='vipuserpay.jsp.userpay.jsp.837885'/></td>
		</tr>
		<tr>
			<td colspan="2"><p><b><font size="2" color="#008000">&nbsp;&nbsp;&nbsp; <s:text name='vipvipup.jsp.vipup.jsp.-1667040930'/></font></b></td>
		</tr>
	</table>
	</div>
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
</body> 
</html>
