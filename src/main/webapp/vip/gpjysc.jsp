<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title>积分交易市场</title>
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
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">个人信息</A> </LI>
  <LI><A>业绩查询</A> 
  </LI>
  <LI><A>财务管理</A> 
  </LI>
  <LI><A>消息管理</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">退出系统</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title>积 分 交 易 市 场</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="80">
    <tr>
      <td width="100%" height="25"><p align="center"><strong><font color="#000000" size="6">积 分 交 易 市 场</font></strong><font size="4"><b><font color="#0000FF">当前交易价是 </font><font color="#FF0000">
      <c:if test="${fcxt.jygj<1.0}">0${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1.0}">${fcxt.jygj}</c:if></font></b></font><p align="center">
　<p align="center"> </td> 
  </tr>
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="80">
	<div align="center">
		<table border="1" width="85%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tr>
				<td align="center" width="160" bgcolor="#FFFFFF" rowspan="2"><font color="#800000" face="黑体"><b><a href="/mcsl" style="text-decoration: none; background-color:#FFFFFF"><font color="#800000" style="font-size: 16pt">发布卖出</font></a></b></font></td>
				<td align="center" width="100"><b><font color="#FFFF00" style="font-size: 11pt">开盘价</font></b></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>最高价</b></font></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>最低价</b></font></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>现价</b></font></td>
				<td align="center" width="100"><font color="#FFFF00" style="font-size: 11pt"><b>交易范围</b></font></td>
				<td align="center" width="160" bgcolor="#FFFFFF" rowspan="2"><font color="#000000" face="黑体"> <a href="/mysl" style="text-decoration: none; font-weight:700; background-color:#FFFFFF"><font color="#FF0000" style="font-size: 16pt">发布买入</font></a></font></td>
			</tr>
			<tr>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">0.77</span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">
				<c:if test="${fcxt.zgj+0.03<1.0}">0${fcxt.zgj+0.03}</c:if><c:if test="${fcxt.zgj+0.03>=1.0}">${fcxt.zgj+0.03}</c:if></span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">0${fcxt.zdj}</span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">
				<c:if test="${fcxt.jygj<1}">0${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></span></font></td>
				<td align="center" width="100"><font color="#FFFFFF"><span style="font-size: 11pt; font-weight:700">
                <c:if test="${fcxt.zgj+0.03<1.0}">0${fcxt.zgj+0.03}</c:if><c:if test="${fcxt.zgj+0.03>=1.0}">${fcxt.zgj+0.03}</c:if>/0 ${fcxt.zdj}
				</span></font></td>
			</tr>
		</table>
	</div>
	<p align="center"><font size="2">友情提醒：根据市场情况，电子积分单价会稳步上涨，到一定时候拆分。</font><table border="0" width="100%" id="table2" cellpadding="2">
		<tr>
			<td align="center"><iframe name="I1" marginwidth="1" marginheight="1" width="100%" height="1250" align="center" border="0" frameborder="0" src="gpjymc" scrolling="no" ></iframe></td>
			<td align="center"><iframe name="I2" marginwidth="1" marginheight="1" width="100%" height="1250" align="center" border="0" frameborder="0" src="gpjymy" scrolling="no" ></iframe></td>
		</tr>
	</table>
</tr> 
</table> 
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body>
<meta http-equiv=Refresh content="120; url=">
</html>