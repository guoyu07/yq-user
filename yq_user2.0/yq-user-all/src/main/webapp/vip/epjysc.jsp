<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>一 币 交 易 市 场</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
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
<DIV class=box_title>一 币 交 易 市 场</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center"><strong><font color="#000000" size="5" face="楷体">一 币 交 易 市 场</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
    <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><b>流水号</b></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400">卖出方</strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#FF00FF">信用星</font></b></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000">求现金额</font></td>
          <td width="161" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">认购后可换一币</font></td>
          <td width="167" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000">认购后可获利</font></b></td>
          <td width="260" align="center" height="23" bgcolor="#FBFAEC">交易状态</td>
          <td width="177" align="center" height="23" bgcolor="#FBFAEC">操作</td>
          </tr>
        <s:iterator var="data" value="dataList">
          <tr> 
          <td height="28" width="127" align="center"><b>***${data.simplePayid}</b></td>
          <td height="28" width="142" align="center"><p><font color="#000000">${data.payusername}</font></td>
          <td valign="middle" align="center" width="121"><font color="#FF00FF"><b>${data.cxt}</b></font></td>
          <td valign="middle" align="center" width="121"><font color="#FF0000">${data.paynum9}</font></td>
          <td valign="middle" align="center" width="161"><font color="#0000FF">${data.paynum}</font></td>
          <td valign="middle" align="center" width="167"><b><font color="#0000FF"></font><font color="#FF0000">${data.paynum-data.paynum9}</font></td>
          <td valign="middle" align="center" width="260">
          <c:if test="${data.payusername==userName}"><b><a onClick="return confirm('提示：您确定了吗？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000">撤销卖出</font></a></b></c:if><c:if test="${data.payusername!=userName}">等待认购中。。。</c:if></td>
          <td valign="middle" align="center" width="177"><a onClick="return confirm('提示：对方使用的收款方式是“${data.paybank}”您确定认购了吗？')" href="epmy?ep=${data.payid}"><font color="#FF0000" size="2">我要认购</font></a></td>
          </tr>
         </s:iterator>
            </table> 
</div> <aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epmcjl"><font color="#0000FF">到一币-求现明细</font></a>---<a href="epmyjl"><font color="#008000">到一币-认购明细</font></a></font></p>
<p align="center"></p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="80; url=">
</body> 
</html>