<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title><s:text name='vipepjysc.jsp.epjysc.jsp.-925818028'/></title>
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
    document.getElementById("mTitle").innerHTML="<s:text name='vipepjysc.jsp.epjysc.jsp.1257887'/>";
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
  <LI><a target="main" href="login2j?inputUrl=login2j.jsp" style="text-decoration: none"><s:text name='vipepjysc.jsp.epjysc.jsp.616144510'/></A> </LI>
  <LI><A><s:text name='vipepjysc.jsp.epjysc.jsp.627723500'/></A> 
  </LI>
  <LI><A><s:text name='vipepjysc.jsp.epjysc.jsp.1097687684'/></A> 
  </LI>
  <LI><A><s:text name='vipepjysc.jsp.epjysc.jsp.860074668'/></A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout"><s:text name='vipepjysc.jsp.epjysc.jsp.1119407294'/></A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle><s:text name='vipepjysc.jsp.epjysc.jsp.1257887'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><s:text name='vipepjysc.jsp.epjysc.jsp.-925818028'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center"><strong><font color="#000000" size="5" face="楷体"><s:text name='vipepjysc.jsp.epjysc.jsp.-925818028'/></font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
    <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><b><s:text name='vipepjysc.jsp.epjysc.jsp.27758404'/></b></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400"><s:text name='vipepjysc.jsp.epjysc.jsp.21178581'/></strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#FF00FF"><s:text name='vipepjysc.jsp.epjysc.jsp.20607384'/></font></b></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000"><s:text name='vipepjysc.jsp.epjysc.jsp.855285018'/></font></td>
          <td width="161" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000"><s:text name='vipepjysc.jsp.epjysc.jsp.-1780098759'/></font></td>
          <td width="167" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000"><s:text name='vipepjysc.jsp.epjysc.jsp.912665660'/></font></b></td>
          <td width="260" align="center" height="23" bgcolor="#FBFAEC"><s:text name='vipepjysc.jsp.epjysc.jsp.625799226'/></td>
          <td width="177" align="center" height="23" bgcolor="#FBFAEC"><s:text name='vipepjysc.jsp.epjysc.jsp.820271'/></td>
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
          <c:if test="${data.payusername==userName}"><b><a onClick="return confirm('<s:text name='vipepjysc.jsp.epjysc.jsp.1991539691'/>？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000"><s:text name='vipepjysc.jsp.epjysc.jsp.1991539691a'/></font></a></b></c:if><c:if test="${data.payusername!=userName}"><s:text name='vipepjysc.jsp.epjysc.jsp.1991539691b'/>。。。</c:if></td>
          <td valign="middle" align="center" width="177"><a onClick="return confirm('<s: text name='vipepjysc.jsp.epjysc.jsp.1903383816'/>?')" href="epmy?ep=${data.payid}"><font color="#FF0000" size="2"><s: text name='vipepjysc.jsp.epjysc.jsp.1903383816a'/></font></a></td>
          </tr>
         </s:iterator>
            </table> 
</div> <aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='vipepjysc.jsp.epjysc.jsp.1091246016'/></font></a></font></p>
<p align="center"></p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="80; url=">
</body> 
</html>
