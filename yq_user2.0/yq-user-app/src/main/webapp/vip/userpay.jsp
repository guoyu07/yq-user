<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.-1713705348'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.834213896'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.-1543089961'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.-817035023'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.2053058834'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.165401067'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.939890499'/>！');history.go(-1);</script></c:if>

<c:if test="${erroCodeNum==-1}"><script language=javascript>alert('<s:text name='vipuserpay.jsp.userpay.jsp.-1862966729'/>！');location.replace('epmcjl');</script></c:if>
<html>
<head>
<title></title>
</head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script src="/scripts/sms.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.txpay.value==0) {      alert("<s:text name='vipuserpay.jsp.userpay.jsp.-861806777'/>!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('<s:text name='vipuserpay.jsp.userpay.jsp.431301541'/>!');
	document.Form.txpay.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = true;
for (i=0; i<checkStr.length; i++) {
ch = checkStr.charAt(i);
if (checkOK.indexOf(ch) == -1) {
allValid = false;
break;
}
if ((ch == '+' || ch == '-') && i>0) {
allValid = false;
break;
}
}
return (allValid);
}
  if (Form.txpay.value> ${gcuser.pay} ) { <c:if test="${transferType==1}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977'/>!"); </c:if> <c:if test="${transferType==2}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977a'/>!"); </c:if>     return false;    }
  if (Form.txpay.value<100) {      alert("<s:text name='vipuserpay.jsp.userpay.jsp.-1837041227'/>!");      return false;    } 
  if (Form.pa3.value=="") {      alert("<s:text name='vipuserpay.jsp.userpay.jsp.-1989247238'/>!");      return false;    } 
	
   $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=3", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='vipupuser.jsp.upuser.jsp.1886666017'/>"); return false; }
		settime($("#btn"));
		alert("<s:text name='vipupuser.jsp.upuser.jsp.1886721436'/>");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.ybcodeid.value=="") {   alert("<s:text name='vipupuser.jsp.upuser.jsp.-352812950'/>");  Form.ybcodeid.focus();   return false;    }
  return true;
}
</script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0"><div align="center"><b>
     <p></p>
     <p></p>
	<p><font color="#008000" face="隶书" style="font-size: 30pt"><s:text name='vipuserpay.jsp.userpay.jsp.-1525418715'/></font></p>
	<table border="0" width="75%" id="table1" height="58" bgcolor="#FFEEEE">
	 <tr>
	 <td><b><s:text name='vipuserpay.jsp.userpay.jsp.-1678978204'/>！</td>
	 </tr>
	 <tr>
	 <td><s:text name='vipuserpay.jsp.userpay.jsp.-1783532947'/></td>
	 </tr>
	 </table>
	 <table width="75%" border="0" cellpadding="0" class="border" bgcolor="#800080">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="935">
    <form method="POST" align="center" name="Form" id="Form" onSubmit="return checkdate1()" action="userpay?status=1">
    <input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
    <div align="center"><TABLE width="100%" border=0 height="352" cellpadding="2" bgcolor="#FFFFFF">
    <TBODY>
    <TR class=content><TD bgColor=#ffffff width="27" align="right" rowspan="11"><p align="center">　</TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="30"><font style="font-size: 11pt; font-weight:700"><s:text name='vipupuser.jsp.upuser.jsp.29623262'/>：</font></TD>
    <TD width="571" bgColor=#ffffff height="30"><font color="#FF0000"><b>${userName}</b></font><input type="hidden" name="user" size="10" value="${userName}" readonly></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="33"><font style="font-size: 10pt"><s:text name='vipuserpay.jsp.userpay.jsp.-586037884'/>：</font></TD>
      <TD width="571" bgColor=#ffffff height="33"><font style="font-size: 9pt" color="#FF0000">
		<select size="1" name="txpay">
		<option selected value="0">=<s:text name='vipuserpay.jsp.userpay.jsp.1646927970'/>=</option>
		<option value="100">100</option>
		<option value="200">200</option>
		<option value="500">500</option>
		<c:if test="${transferType==1}">
		<option value="1000">1000</option>
		<option value="2000">2000</option>
		</c:if>
		</select> **</font><font style="font-size: 9pt"><s:text name="viewyblc-sales.jsp.yblc-sales.jsp.36915859a"></s:text>：</font><font style="font-size: 9pt; " color="#FF0000"><c:if test="${transferType==1}"><c:if test="${gcuser.pay<1}"> 0${gcuser.pay-gcuser.vippay} </c:if><c:if test="${gcuser.pay>=1}"> ${gcuser.pay-gcuser.vippay} </c:if></c:if><c:if test="${transferType==2}">${gcuser.pay}</c:if></font></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="28"><b>
     	<font style="font-size: 10pt; "><s:text name='vipuserpay.jsp.userpay.jsp.630954966'/>：</font></TD>
      <TD width="571" bgColor=#ffffff height="28"><b>
     	<font size="3"> <span style="font-size: 11pt"><INPUT name="pa3" size=15 type=password></span></font><font style="font-size: 9pt" color="#FF0000"> **</font><span style="font-size: 10pt"><input type="hidden" name="remark" size="8" value="4" readonly></span></TD>
    </TR><c:if test="${gcuser.ganew!=0}">
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="39"><b>
     	<font style="font-size: 10pt; "><s:text name='vipupuser.jsp.upuser.jsp.-1704827075'/>：</font></TD>
      <TD width="571" bgColor=#ffffff height="39"><input type="text" name="ybcodeid" size="15"><b><font style="font-size: 9pt" color="#FF0000"> **</font><input id="btn" type="button" onclick="checkdate()" value="<s:text name='vipupuser.jsp.upuser.jsp.1753968781'/>" name="B2"></b></TD>
    </TR></c:if>
    <TR class=content> 
		<TD width="897" bgColor=#ffffff align="right" height="30" colspan="2"><p align="left"><font size="2" color="#0000FF"><b><s:text name="vipuserpay.jsp.userpay.jsp.973134113"></s:text>！</font></TD>
    </TR>
    <TR class=content> 
		<TD width="317" bgColor=#ffffff align="right" height="29"><span style="font-size: 10pt">真实<s:text name='vipuserga.jsp.userga.jsp.734362'/>：</span></TD>
		<TD width="571" bgColor=#ffffff height="29"><font color="#800080">${gcuser.name}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="33"><b><span style="font-size: 10pt"><s:text name='vipuserpay.jsp.userpay.jsp.775723385'/>：</span></TD>
		<TD width="571" bgColor=#ffffff height="33"><b><font color="#800080">${gcuser.simpleCall}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="25"><span style="font-size: 10pt"><s:text name='vipuserpay.jsp.userpay.jsp.799099710'/>：</span></TD>
		<TD width="571" bgColor=#ffffff height="25"><font color="#800080">${gcuser.bank}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="27"><span style="font-size: 10pt"><s:text name='vipuserpay.jsp.userpay.jsp.1141649'/>：</span></TD>
		<TD width="571" bgColor=#ffffff height="27"><b><font color="#800080">${gcuser.card}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="24"><font size="2"><s:text name='vipuserpay.jsp.userpay.jsp.24185845'/>：</font></TD>
		<TD width="571" bgColor=#ffffff height="24"><font size="2">${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}<s:text name='vipuserpay.jsp.userpay.jsp.837885'/></font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="931" height="29"><p style="margin-top: 0; margin-bottom: 0"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="<s:text name='vipuserpay.jsp.userpay.jsp.-1517150275b'/>" name=submit2 style="font-size: 11pt" onClick="return confirm('<s:text name='vipuserpay.jsp.userpay.jsp.-1517150275a'/>？')"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
  <p style="margin-top: 0; margin-bottom: 0">　</p>
  <table border="1" width="75%" id="table2" style="border-collapse: collapse" bgcolor="#E6FFFF">
  <tr>
  <td><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt" color="#FF0000">发布卖出说明：</font></p><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt">一、最低100一币起就可以发布卖出，每次发布需等上一次处理（您确认收到款）了才可以发起第二次，发布成功后我们认购一币-方向您下单后2小时内打到您的<s:text name='vipuserga.jsp.userga.jsp.799409753'/>上！</font></p>
  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt" color="#800080"><s:text name='vipuserpay.jsp.userpay.jsp.840473127'/>10%。</font></p>
	</td>
	</tr>
	</table>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="5" color="#FF0000" face="楷体_GB2312"><s:text name='vipuserpay.jsp.userpay.jsp.-1886394640'/></font></p>
		<font size="3">
			  <table border="0" width="90%" id="table3">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						<s:text name='vipuserpay.jsp.userpay.jsp.1072980487'/><br>
						1、<s:text name='vipuserpay.jsp.userpay.jsp.1178622703'/>。<br>
						2、<s:text name='vipuserpay.jsp.userpay.jsp.1078412623'/>。<br>
						<s:text name='vipuserpay.jsp.userpay.jsp.203331168'/><br>
						1、<s:text name='vipuserpay.jsp.userpay.jsp.98672732'/>！<br>
						2、<s:text name='vipuserpay.jsp.userpay.jsp.-1363913732'/>。<br>
						3、<s:text name='vipuserpay.jsp.userpay.jsp.-507714535'/></font></b>。</td>
					</tr>
				</table>
	<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</font></div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"));
</script>
