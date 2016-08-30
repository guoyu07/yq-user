<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title><s:text name='vipbdbdate.jsp.bdbdate.jsp.-267246894'/></title>
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
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle><s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1143349315'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> <p align="center"><font color="#000000" face="<s:text name='sfz_eng.html.sfz_eng.html.857276'/>" size="5"><strong><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1143349315'/></strong></font></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="123" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400"><s:text name='reg.jsp.reg.jsp.29623262'/></strong></font></td>
              <td width="90" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000"> <strong style="font-weight: 400"><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646048'/></strong></font></td>
              <td width="90" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646116'/></font></td>
              <td width="100" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/>报单币</font></td>
              <td width="80" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.23899948'/></font></td>
              <td width="80" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21452281'/></font></td>
              <td width="80" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.24127308'/></font></td>
              <td width="80" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21679641'/></font></td>
              <td width="172" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></font></td>
              <td width="421" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
              <td height="31" width="123" align="center"> <p><font color="#000000">${userName}</font></td>
              <td valign="middle" width="84" align="center"> <p><font color="#FF0000">${data.sy}</font></td>
              <td valign="middle" align="left" width="84"><p align="center"><c:if test="${data.jc<0}">-${data.jc}</c:if><c:if test="${data.jc>0}">${data.jc}</c:if></td>
              <td valign="middle" align="center" width="101"><font color="#000000">${data.sybdb}</font></td>
              <td valign="middle" align="center" width="101"><font color="#000000">${data.zaq}</font></td>
              <td valign="middle" align="center" width="101"><font color="#000000">${data.zbq}</font></td>
              <td valign="middle" align="center" width="101"><font color="#000000">${data.aq}</font></td>
              <td valign="middle" align="center" width="101"><font color="#000000">${data.bq}</font></td>
              <td valign="middle" align="center" width="172"><font color="#000000">${data.bfdate}</font></td>
              <td valign="middle" align="center" width="421"><font color="#000000">${data.bz}</font></td>
              </tr>
              </s:iterator>
            </table> 
</div> <aldtags:pageTag/>
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
</body> 
</html>
