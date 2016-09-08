<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-871299322'/></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
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
<DIV class="top_bg cBlue">
　</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j?inputUrl=login2j.jsp" style="text-decoration: none"><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></A> </LI>
  <LI><A><s:text name='viewlinks.html.links.html.627723500'/></A> 
  </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.1097687684'/></A> 
  </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.860074668'/></A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1119407294'/></A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location><s:text name='vipgcbftj.jsp.gcbftj.jsp.-1860602679'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-871299322'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center">
		<strong>
		<font color="#000000" face="<s:text name='sfz_eng.html.sfz_eng.html.857276'/>" size="5"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-871299322'/></font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7"><br> 
<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="110" align="center" height="23" bgcolor="#FBFAEC"><b><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/></b></td>
          <td width="120" align="center" height="23" bgcolor="#FBFAEC"><font face="Arial" color="#000000"><strong style="font-weight: 400"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1089491839'/>）</strong></font></td>
          <td width="95" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.868743081'/></font></td>
          <td width="165" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1100547719'/></font></td>
          <td width="120" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000"><s:text name='vipepmyjl.jsp.epmyjl.jsp.21178581'/></font></td>
          <td width="450" align="center" height="23" bgcolor="#FBFAEC"><s:text name='vipepmyjl.jsp.epmyjl.jsp.625799226'/></td>
          <td width="250" align="center" height="23" bgcolor="#FBFAEC"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></td>
          </tr>
         <s:iterator var="data" value="dataList">
          <tr> 
          <td height="28" width="110" align="center"><b>***${data.simplePayid}</b></td>
          <td height="28" width="120" align="center"><p><font color="#000000">${data.dfuser}</font></td>
          <td valign="middle" align="center" width="95"><font color="#FF0000">${data.paynum}</font></td>
          <td valign="middle" align="center" width="165"><font color="#000000">${data.rgdate}</font></td>
          <td valign="middle" align="center" width="120">${data.payusername}</td>
          <td valign="middle" align="center" width="450">
          <c:if test="${not empty zftime}">
          <s:text name='vipepmyjl.jsp.epmyjl.jsp.691355938'/>:${data.payusername}。
          </c:if>
          <c:if test="${empty zftime}">
                <c:if test="${data.ep==1}"><font color="#FF00FF"><s:text name='vipepmyjl.jsp.epmyjl.jsp.-2134021130'/></font><font color="#0000FF"><b>${data.rgdate}</b></font><font color="#FF00FF"><s:text name='vipepmyjl.jsp.epmyjl.jsp.-2134021130a'/>，<b><a target="_blank" href="fbbank?fb=${data.payid}"><font color="#008000"><s:text name='vipepmyjl.jsp.epmyjl.jsp.-2134021130b'/>！</font></a></b></font></c:if>                                                
                <c:if test="${data.ep==2}">${data.dfuser}--<s:text name='vipepmyjl.jsp.epmyjl.jsp.-1073667942'/>${data.payusername}。。。</c:if>
          </c:if>
          </td>
          <td valign="middle" align="center" width="250"><a onClick="return confirm('<s:text name='vipepmyjl.jsp.epmyjl.jsp.-1689415574'/>')" href="myepok?ep=${data.payid}"><font color="#FF0000" size="2">
            <c:if test="${data.ep==1}"><s:text name='vipepmyjl.jsp.epmyjl.jsp.314771621'/>${data.paynum9}<s:text name='yuan'/>。</c:if></font></a></td>
          </tr>
         </s:iterator>
            </table> 
</div> <aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='vipepjysc.jsp.epjysc.jsp.1091246016'/></font></a><font color="#FF6600" style="font-size: 12pt; font-weight: 700">---<a href="epjysc"><font color="#0000FF"><s:text name='vipepjysc.jsp.epjysc.jsp.1091246016a'/></font></a>---<a href="epmcjl"><font color="#008000"><s:text name='vipepjysc.jsp.epjysc.jsp.1091246016b'/></font></a></font></p>
<p align="center"></p>
<p align="center"></p>
</body> 
</html>
