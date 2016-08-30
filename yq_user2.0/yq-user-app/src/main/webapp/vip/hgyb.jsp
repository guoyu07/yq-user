<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viphgyb.jsp.hgyb.jsp.-61743447'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viphgyb.jsp.hgyb.jsp.833291759'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viphgyb.jsp.hgyb.jsp.1801089794'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viphgyb.jsp.hgyb.jsp.-1926563189'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viphgyb.jsp.hgyb.jsp.-495031333'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>location.href="http://yb.zgyce.com/admin/ybhg_pay.asp?gwid=${gwid}&CheckStates=5"</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viphgyb.jsp.hgyb.jsp.274591465'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viphgyb.jsp.hgyb.jsp.-1342869353'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>location.href="http://yb.zgyce.com/admin/ybhg_Modi.asp?gwbh=${gwid}"</script></c:if>
<html>
<head>
<title></title>
</head>
<script type="text/javascript" src="/images/jquery.min.js"></script>
<script type="text/ecmascript" src="/images/md5.js"></script>
<script src="/scripts/sms.js"></script>
<script language="JavaScript"> 
function checkdate()  {
  if (Form.pa3.value=="") {      alert("<s:text name='viphgyb.jsp.hgyb.jsp.1544222851'/>!");  Form.pa3.focus();      return false;    }
  	
    $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=7", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='viphgyb.jsp.hgyb.jsp.1886666017'/>"); return false; }
		settime($("#btn"));
		alert("<s:text name='viphgyb.jsp.hgyb.jsp.1886721436'/>");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.mcygcode.value=="") {   alert("<s:text name='viphgyb.jsp.hgyb.jsp.-352812950'/>");  Form.mcygcode.focus();   return false;    }
  return true;
} 
</script>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="hgybok" name="Form" id="Form">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	　<p>　</p>
	<p>　</p>
	<p><input type="hidden" name="ybsl" size="10" value="${ybsl}"><input type="hidden" name="fee" size="10" value="${fee}"><input type="hidden" name="gwuser" size="10" value="${gwuser}"><input type="hidden" name="gwid" size="10" value="${gwid}"><input type="hidden" name="gwno" size="10" value="${gwno}"></p>
	<table border="0" id="table1" height="289" width="620">
		<tr>
			<td width="210" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.29623262'/>：</td>
			<td width="400" align="left" colspan="2"><b><font color="#0000FF">${gwuser}</font></b><input type="hidden" name="user" size="10" value="${gwuser}" readonly></td>
			</tr>
		<tr>
			<td width="210" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.35034724'/>：</td>
			<td width="400" align="left" colspan="2"><font color="#008000">${gwno}</font><input type="hidden" name="remark" size="8" value="9" readonly></td>
			</tr>
		<tr>
			<td width="210" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.1086606367'/>：</td>
			<td width="400" align="left" colspan="2">${yb}</td>
		</tr>
		<tr>
			<td width="210" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.26044037'/>(2%)：</td>
			<td width="400" align="left" colspan="2">${fee}</td>
		</tr>
		<tr>
			<td width="210" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.675858010'/>：</td>
			<td width="400" align="left" colspan="2"><b><font color="#FF0000">${yb}</font></b></td>
		</tr>
		<tr>
			<td width="210" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.775723385'/>：</td>
			<td width="400" align="left" colspan="2">${gcuser.simpleCall}</td>
		</tr>
		<tr>
			<td width="210" align="right" height="26"><s:text name='viphgyb.jsp.hgyb.jsp.630954966'/>：</td>
			<td width="400" align="left" colspan="2" height="26"><span style="font-size: 9pt"><font size="1">
			<input type="password" name="pa3" size="15" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="210" align="right" height="35"><s:text name='viphgyb.jsp.hgyb.jsp.-1704827075'/>：</td>
			<td width="80" align="left" height="35">
			<input type="text" name="hgcode" size="10"></td>
			<td width="322" align="left" height="35"><input id="btn" type="button" onclick="checkdate()" value="<s:text name='viphgyb.jsp.hgyb.jsp.1753968781'/>" name="B2"></td>
		</tr>
		<tr>
			<td width="210" align="right" height="40"><p align="center">　</td>
			<td width="400" align="right" height="40" colspan="2">
			<p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="<s:text name='viphgyb.jsp.hgyb.jsp.-1071255236'/>" name="B1" onClick="{if(confirm('<s:text name='viphgyb.jsp.hgyb.jsp.-1071255236'/>?')){this.style.visibility='hidden';return true;}return false;}" style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p align="center">　
	<p align="center"><b><font size="5" face="楷体_GB2312" color="#0000FF"><a href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=${gwuser}" style="text-decoration: none"><font color="#0000FF"><s:text name='viphgyb.jsp.hgyb.jsp.-2145475150'/></font></a></font></b></div>
</form>
<script type="text/javascript">
btnStatus($("#btn"));
</script>
