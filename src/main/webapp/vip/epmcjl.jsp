<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title>一 币 求 现（卖出）明 细</title>
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
<DIV class="top_bg cBlue">
　</DIV>
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
<DIV class=box_title>一 币 求 现（卖出）明 细</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<strong>
		<font color="#000000" face="楷体" size="5">一 币 求 现（卖出）明 细</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
    <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="104" align="center" height="23" bgcolor="#FBFAEC"><b>流水号</b></td>
          <td width="136" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400">卖出方（自己）</strong></font></td>
          <td width="83" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000">求现金额</font></td>
          <td width="133" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000">发布时间</font></td>
          <td width="242" align="center" height="23" bgcolor="#FBFAEC">交易状态</td>
          <td width="342" align="center" height="23" bgcolor="#FBFAEC">操作</td>
          </tr>
           <s:iterator var="data" value="dataList">
          <tr> 
          <td height="28" width="104" align="center"><b>***${data.simplePayid}</b></td>
          <td height="28" width="136" align="center"><p><font color="#000000">${data.payusername}</font></td>
          <td valign="middle" align="center" width="83"><font color="#FF0000">${data.paynum9}元</font></td>
          <td valign="middle" align="center" width="133"><font color="#000000">${data.paytime}</font></td>
          <td valign="middle" align="center" width="242">
          <c:if test="${not empty data.zftime}">交易成功--对方--${data.dfuser}--${data.zftime}</c:if>
          <c:if test="${empty data.zftime}">
             <c:if test="${data.ep==1}">${data.dfuser}--已下单，等待${data.dfuser}付款中...</c:if>
             <c:if test="${data.ep==2}">${data.dfuser}--已向您付款-${data.paynum9}元，等待您在<b><font color="#0000FF">${data.rgdate}</font></b>前确认。。。</c:if>
             <c:if test="${data.ep!=1&&data.ep!=2}">等待认购中。。--<b><a onClick="return confirm('提示：您确定了吗？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000">撤销卖出</font></a></b></c:if>
          </c:if>
          </td>
          <td valign="middle" align="center" width="342">
          <a onClick="return confirm('提示：您确定已收到认购方 ${data.dfuser}给打款 ${data.paynum9}了吗？ 确定后不可恢复！')" href="mcepok.asp?ep= ${data.payid}"><font color="#FF0000" size="2">
          <c:if test="${data.ep==2}"><input type="button" value="确认收到${data.paynum9}元款" name="B1" onclick=disabled=true style="font-size: 10pt; color: #0000FF; font-weight: bold">
          </c:if>
          </font>
          </a>
          </td>
          </tr>
          </s:iterator>
            </table> 
</div><aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epjysc"><font color="#0000FF">到一币-交易市场</font></a>---<a href="epmyjl"><font color="#008000">到一币-认购明细</font></a></font></p>
<p align="center">
　</p>
<p align="center">
　</p>
<meta http-equiv=Refresh content="120; url=">
</body> 
</html>