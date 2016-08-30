<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<title><s:text name='vipgpjy.jsp.gpjy.jsp.-459609056'/></title>
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
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j?inputUrl=login2j.asp" style="text-decoration: none"><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></A> </LI>
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
<DIV style="DISPLAY: none" class=Location><s:text name='vipgcbf.jsp.gcbf.jsp.-1860602679'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><s:text name='vipgpjy.jsp.gpjy.jsp.-459609056'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"><p align="center"><strong><font size="3" color="#000000"><s:text name='vipgpjy.jsp.gpjy.jsp.-459609056'/></font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="143" align="center" height="28" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400"><s:text name='reg.jsp.reg.jsp.29623262'/></strong></font></td>
          <td width="80" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"> <strong style="font-weight: 400"><s:text name='viewjflc-details.jsp.jflc-details.jsp.656571075'/></strong></font></td>
          <td width="78" align="center" height="28" bgcolor="#FFE1FF"><font color="#FF0000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.619069972'/></font></td>
          <td width="87" align="center" height="28" bgcolor="#FFE1FF"><p><font face="Arial" color="#000000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.648863855'/></font></td>
          <td width="150" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.784049096'/></font></td>
          <td width="52" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/></font></td>
          <td width="66" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.20195982'/></font></td>
          <td width="266" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.934923'/></font></td>
          <td width="140" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.755936'/></font></td>
          <td width="189" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewjflc-details.jsp.jflc-details.jsp.768067666'/></font></td>
          </tr>
         <s:iterator var="data" value="dataList">
          <tr> 
          <td height="23" width="143" align="center"><p><font color="#000000">${userName}</font></td>
          <td valign="middle" width="80" align="center"><p><font color="#000000">
          <c:if test="${data.mcsl>0}">-${data.mcsl}</c:if><c:if test="${data.mcsl<=0}">${data.mcsl}</c:if></font></td>
          <td valign="middle" align="center" width="78"><font color="#FF0000">${data.mysl}</font></td>
          <td valign="middle" align="left" width="87"><p align="center">${data.sysl}</td>
          <td valign="middle" align="center" width="150"><font color="#000000">${data.abdate}</font></td>
          <td valign="middle" align="center" width="52"><font color="#0000FF">
          <c:if test="${data.pay<1}">0${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></font></td>
          <td valign="middle" align="center" width="66"><font color="#FF0000">${data.jypay}</font></td>
          <td valign="middle" align="center" width="266"><p><font color="#000000">${data.bz}</font></td>
          <td valign="middle" align="center" width="140">${data.dfuser}</td>
          <td valign="middle" align="center" width="189"><font color="#000000">${data.cgdate}</font></td>
          </tr>
         </s:iterator>
            </table> 
</div><aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
</body> 
</html>
