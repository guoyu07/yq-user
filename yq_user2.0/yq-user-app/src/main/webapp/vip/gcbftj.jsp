<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.1749444652'/></title>
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
  <LI><a target="main" href="login2j?fromId=1" style="text-decoration: none"><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></A> </LI>
  <LI><A><s:text name='viewlinks.html.links.html.627723500'/></A> 
  </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.1097687684'/></A> 
  </LI>
  <LI><A><s:text name='vipbdbdate.jsp.bdbdate.jsp.860074668'/></A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1119407294'/></A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location><s:text name='vipgcbf.jsp.gcbf.jsp.-1860602679'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.1749444652'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"><p align="center"><font color="#000000" size="3"><strong><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.1749444652'/></strong></font></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="56">
            <tr> 
          <td width="158" align="center" height="28" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400"><s:text name='reg.jsp.reg.jsp.29623262'/></strong></font></td>
          <td width="152" align="center" height="28" bgcolor="#FFE1FF"><font color="#FF0000"><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.-439906297'/></font></td>
          <td width="143" align="center" height="28" bgcolor="#FFE1FF"><p><font face="Arial" color="#000000"><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.850616742'/></font></td>
          <td width="154" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.813238533'/></font></td>
          <td width="163" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.775680731'/></font></td>
          <td width="178" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.657552666'/></font></td>
          <td width="232" align="center" height="28" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></font></td>
          </tr>
        <s:iterator var="data" value="dataList">
          <tr> 
          <td height="29" width="158" align="center"><p><font color="#000000">${gcuser.username}</font></td>
          <td valign="middle" align="center" width="152"><font color="#FF0000">${data.sygc}</font></td>
          <td valign="middle" align="left" width="143"><p align="center"><c:if test="${fhpay<1}">0</c:if><c:if test="${fhpay>=1}">${fhpay}</c:if></td>
          <td valign="middle" align="center" width="154"><font color="#000000">${data.syfh}</font></td>
          <td valign="middle" align="center" width="163"><font color="#FF0000">${data.ljfhtj}</font></td>
          <td valign="middle" align="center" width="178"><p><font color="#000000">${data.abdate}</font></td>
          <td valign="middle" align="center" width="232">${data.bz}</td>
          </tr>
          </s:iterator>
      </table> 
</div>
<aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
</body> 
</html>
