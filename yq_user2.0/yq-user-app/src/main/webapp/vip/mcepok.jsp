<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-712205750'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-2080179417'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-51880318'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-1011373655'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-373366424'/>！');location.replace('epmcjl');</script></c:if>

<script type="text/javascript" src="/images/jquery.min.js"></script>
<script src="/scripts/sms.js"></script>
<script language="JavaScript"> 
function checkdate()  {
  if (Form.password3.value=="") {      alert("<s:text name='vipmcepok.jsp.mcepok.jsp.1544222851'/>!");  Form.password3.focus();      return false;    }
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=4", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='vipmcepok.jsp.mcepok.jsp.1886666017'/>"); return false; }
		settime($("#btn"));
		alert("<s:text name='vipmcepok.jsp.mcepok.jsp.1886721436'/>");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.smsCode.value=="") {   alert("<s:text name='vipmcepok.jsp.mcepok.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
  return true;
} 
</script>
<body topmargin="0">
<form method="POST" action="mcepok?status=1&payId=${payId}" id="Form" name="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p>　</p>
	<p><b><font color="#FF0000"><s:text name='vipmcepok.jsp.mcepok.jsp.-1370693726'/>！</font></b></p>
	<table border="0" id="table1" height="316" width="666">
		<tr>
			<td width="253" align="right"><s:text name='vipmcepok.jsp.mcepok.jsp.29623262'/>：</td>
			<td width="403" align="left" colspan="2">${txpay.payusername}<input type="hidden" name="user" size="10" value="${txpay.payusername}" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipmcepok.jsp.mcepok.jsp.734362'/>：</td>
			<td width="403" align="left" colspan="2">${txpay.payname}<input type="hidden" name="remark" size="8" value="5" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipmcepok.jsp.mcepok.jsp.799485150'/>：</td>
			<td width="403" align="left" colspan="2">${txpay.paybank}</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipmcepok.jsp.mcepok.jsp.799409753'/>：</td>
			<td width="403" align="left" colspan="2">${txpay.paycard}</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipmcepok.jsp.mcepok.jsp.724813892'/>：</td>
			<td width="403" align="left" colspan="2">${txpay.paynum9}</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipmcepok.jsp.mcepok.jsp.630954966'/>：</td>
			<td width="403" align="left" colspan="2"><input type="password" name="password3" size="20"></td>
		</tr>
		<tr>
			<td width="253" align="right" height="24"><s:text name='vipmcepok.jsp.mcepok.jsp.1010247606'/>：</td>
			<td width="403" align="left" colspan="2" height="24">${gcuser.simpleCall}</td>
		</tr>
		<tr>
			<td width="253" align="right" height="44"><s:text name='vipmcepok.jsp.mcepok.jsp.-1704827075'/>：</td>
			<td width="78" align="right" height="44"><p align="left"><input type="text" name="smsCode" size="10"></td>
			<td width="321" align="right" height="44"><p align="left"><input id="btn" type="button" onclick="checkdate()" value="<s:text name='vipmcepok.jsp.mcepok.jsp.1753968781'/>" name="B2"></td>
		</tr>
		<tr>
			<td width="253" align="right" height="46"><p align="center">　</td>
			<td width="403" align="right" height="46" colspan="2"><span style="font-size: 9pt"><font size="1"><input type="submit" value="<s:text name='vipmcepok.jsp.mcepok.jsp.-2106428585'/>" name="B1" style="font-family: 楷体_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
btnStatus($("#btn"));
</script>
