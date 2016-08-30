<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<title></title>
</head>
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
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.cjpay.value==0) {      alert("<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.1478585129'/>!");      return false;    } 
   return true;  }  
 </script>
<body  text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
　</DIV>　</DIV>
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
<DIV style="DISPLAY: none" class=Location><s:text name='vipvipgo.jsp.vipgo.jsp.-1860602679'/></SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con></DIV>
<b><font color="#008000" size="5" face="<s:text name='sfz_eng.html.sfz_eng.html.857276'/>_GB2312"><s:text name='vipvipgo.jsp.vipgo.jsp.-559823802'/>：</font></b> </font><font color="#FF0000" size="4">${userName}</font></span></p>
  	<div align="center">
  <table width="100%" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="69">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="972"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="vipgo?status=1">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="89%" border=0 cellSpacing=1 height="47">
  <TBODY>
    <TR class=content> 
      <TD width="239" bgColor=#ffffff align="right" height="45">
		<b>
		<font face="Tahoma" style="font-size: 11pt"><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.1478585129'/>：</font></b></TD>
      <TD width="278" bgColor=#ffffff height="45">  
              <p align="center">  
              <select size="1" name="cjpay">
				<option selected value="0">==<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.-255407690'/>==</option>
				<option value="100">100</option>
				<option value="200">200</option>
				<option value="300">300</option>
				<option value="400">400</option>
				<option value="500">500</option>
				<option value="600">600</option>
				<option value="700">700</option>
				<option value="800">800</option>
				<option value="900">900</option>
				<option value="1000">1000</option>
				<option value="1200">1200</option>
				<option value="1500">1500</option>
				<option value="1800">1800</option>
				<option value="2000">2000</option>
				<option value="2200">2200</option>
				<option value="2500">2500</option>
				<option value="3000">3000</option>
				<option value="4000">4000</option>
				<option value="5000">5000</option>
				<option value="6000">6000</option>
				<option value="7000">7000</option>
				<option value="8000">8000</option>
				<option value="9000">9000</option>
				<option value="10000">1万</option>
				<option value="12000">1<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.19218840'/></option>
				<option value="15000">1<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.19218933'/></option>
				<option value="18000">1<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.19219026'/></option>
				<option value="20000">2万</option>
				<option value="30000">3万</option>
				<option value="50000">5万</option>
				</select><b><font color="#FF0000" size="3"> 
				**</font></TD>
      <TD width="140" bgColor=#ffffff height="45">  
              
                      <b>
              <INPUT class=normalButton type=submit value="<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.-379325335'/>" name=submit2 style="font-size: 11pt"></TD>
      <TD width="196" bgColor=#ffffff height="45">  
              
                      <p align="center"><b><font size="3" color="#008000">
						<a href="login2j?inputUrl=login6j.jsp"><font color="#008000"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></font></a></font></b></TD>
    </TR>
  </TBODY>
</TABLE>
		<p align="center"><font color="#FF0000" size="2"><b>（<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1634195660'/>）</b></font></div>
</form>
    </td>
    </tr>
  </table>
  	</div>
  <p style="margin-top: 0; margin-bottom: 0">
						<iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" src="cjjl" border="0" frameborder="0">
						</iframe>
						</div></div>
</body>
</html>
