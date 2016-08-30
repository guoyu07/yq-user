<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title><s:text name='vipdatepay.jsp.datepay.jsp.1846650039'/></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="<s:text name='vipdatepay.jsp.datepay.jsp.1257887'/>";
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
  <LI><A><s:text name='vipdatepay.jsp.datepay.jsp.616144510'/></A> </LI>
  <LI><A><s:text name='vipdatepay.jsp.datepay.jsp.627723500'/></A> 
  </LI>
  <LI><A><s:text name='vipdatepay.jsp.datepay.jsp.1097687684'/></A> 
  </LI>
  <LI><A><s:text name='vipdatepay.jsp.datepay.jsp.860074668'/></A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp"><s:text name='vipdatepay.jsp.datepay.jsp.1119407294'/></A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location><s:text name='vipdatepay.jsp.datepay.jsp.-1860602679'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title><c:if test="${lb==2}">[<s:text name='vipdatepay.jsp.datepay.jsp.1319015703'/>]</c:if><c:if test="${lb==3}">[<s:text name='SELL'/>]</c:if><s:text name='YBBHMX'/></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center"><c:if test=""></c:if>
		<font color="#000000" face="楷体" size="5"><strong><s:text name='vipdatepay.jsp.datepay.jsp.609391655'/></strong></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2"><br> 
<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="134" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><strong style="font-weight: 400"><s:text name='vipdatepay.jsp.datepay.jsp.29623262'/></strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000"> <strong style="font-weight: 400"><s:text name='vipdatepay.jsp.datepay.jsp.618817200'/></strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="Arial" color="#000000"><s:text name='vipdatepay.jsp.datepay.jsp.618817132'/></font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000"><s:text name='vipdatepay.jsp.datepay.jsp.1136018751'/></font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><s:text name='vipdatepay.jsp.datepay.jsp.1136018683'/></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='vipdatepay.jsp.datepay.jsp.648664593'/></font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF"><s:text name='vipdatepay.jsp.datepay.jsp.649202784'/></td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='vipdatepay.jsp.datepay.jsp.811035898'/></font></td>
              <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000"><s:text name='vipdatepay.jsp.datepay.jsp.734401'/></font></td>
              </tr>
             <s:iterator var="data" value="dataList">
              <tr> 
              <td height="31" width="134" align="center"> <p><font color="#000000">${gcuser.username}</font></td>
              <td valign="middle" width="133" align="center"> <p><font color="#FF0000">${data.syjz}</font></td>
              <td valign="middle" align="left" width="133"><p align="center"><c:if test="${data.jc>0}">-${data.jc}</c:if><c:if test="${data.jc<=0}">${data.jc}</c:if></td>
              <td valign="middle" align="center" width="120"> <font color="#FF0000">${data.jyjz}</font></td>
              <td valign="middle" align="center" width="118"><c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></td>
              <td valign="middle" align="center" width="118"><font color="#000000">${data.pay}</font></td>
              <td valign="middle" align="center" width="112">${data.jydb}</td>
              <td valign="middle" align="center" width="216"><font color="#000000">${data.abdate}</font></td>
              <td valign="middle" align="center" width="247"><font color="#000000">${data.regid}</font></td>
              </tr>
            </s:iterator>
            </table> 
</div> 
<aldtags:pageTag para1="lb" value1="${lb}"/>
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='vipdatepay.jsp.datepay.jsp.326654005'/></font></a></p>
</body> 
</html>
