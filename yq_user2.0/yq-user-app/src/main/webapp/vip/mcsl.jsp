<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-949213936'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-1341989901'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-498016988'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.440060053'/> 0.77 ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.908656802'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.2045778169'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.115010359'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-1038261267'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.809721657'/> ！');location.replace('gpjysc');</script></c:if>
<html>
<head>
<title></title>
</head>
</SCRIPT>
<script>
</script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript">
 function checkdate()  {  
  if (Form.jygj.value=="") {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.1510332280'/>!");  Form.jygj.focus();    return false;    } 
  if (Form.jygj.value<0.77) {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.440060053'/> 0.77 !");  Form.jygj.focus();    return false;    }
  if (Form.jygj.value>${fcxt.jygj}) {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.275910710'/>!");  Form.jygj.focus();    return false;    } 
    if (!chkinteger1(Form.jygj.value)){
	alert('<s:text name='vipmcsl.jsp.mcsl.jsp.2139966856'/>!');
	document.Form.jygj.focus;
	return (false);
 }
function chkinteger1(checkStr1)
{
var re=/^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
return re.test(checkStr1)
}
  if (Form.txpay.value=="") {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.1510493077'/>!");  Form.txpay.focus();    return false;    } 
  if (Form.txpay.value==0) {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.-1384480305'/>!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('<s:text name='vipmcsl.jsp.mcsl.jsp.1416619015'/>!');
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
  if (Form.txpay.value<10) {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.603950472'/>!");      return false;    }
  if (Form.txpay.value>1000) {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.-1527018673'/>!");      return false;    }
  if (Form.txpay.value>${gcuser.jyg}) {      alert("<s:text name='vipmcsl.jsp.mcsl.jsp.1086289612'/>!");      return false;    } 
  if (Form.pa3.value=="") {      alert("<s:text name='vipepmy.jsp.epmy.jsp.-1989247238'/>!");   Form.pa3.focus();   return false;    } 
  return true;  }  
 </script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b><p><font color="#008000" face="隶书" style="font-size: 30pt"><s:text name='vipmcsl.jsp.mcsl.jsp.1977784533'/></font></p>
			<table border="0" width="75%" id="table1" height="32" bgcolor="#FFEEEE">
			<tr>
			<td><s:text name='vipmcsl.jsp.mcsl.jsp.227454429'/>：<b><font color="#FF0000">
			<c:if test="${fcxt.jygj<1}">0${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></font></b></td>
			</tr>
			</table>
			<table width="75%" border="1" cellpadding="0" class="border" bgcolor="#800080">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="932"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="mcsl?status=1">
      <div align="center">
      <TABLE width="888" border=0 height="128" cellpadding="2" bgcolor="#FFFFFF">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="4" align="right" rowspan="4">
		<p align="center">　</TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="28"><font style="font-size: 11pt; font-weight:700"><s:text name='vipdatepay.jsp.datepay.jsp.29623262'/>：</font></TD>
      <TD width="527" bgColor=#ffffff height="28"><font color="#FF0000"><b>${userName}</b></font></TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="30">
		<span style="font-size: 10pt"><s:text name='vipmcsl.jsp.mcsl.jsp.-541138030'/>：</span></TD>
      <TD width="527" bgColor=#ffffff height="30">
		<!--webbot bot="Validation" s-display-name="<s:text name='vipmcsl.jsp.mcsl.jsp.-631127027'/>" s-data-type="Number" s-number-separators=",." i-maximum-length="4" --><input type="text" name="jygj" size="10" maxlength="4"><b><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="30"><font style="font-size: 10pt"><s:text name='vipmcsl.jsp.mcsl.jsp.656571075'/>：</font></TD>
      <TD width="527" bgColor=#ffffff height="30"><font size="3"> <span style="font-size: 11pt"><INPUT name="txpay" size=20 ></span></font><font style="font-size: 9pt" color="#FF0000"> ** 可<s:text name='vipsggpjy.jsp.sggpjy.jsp.682340'/>为：</font><font style="font-size: 9pt" color="#008000">${gcuser.jyg}</font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=2 align=middle bgColor=#ffffff width="347" height="29"><b><p align="right"><font style="font-size: 10pt"><s:text name='vipmcsl.jsp.mcsl.jsp.630954966'/>：</font></TD>
		<TD align=middle bgColor=#ffffff width="527" height="29"><p align="left"><input type="password" name="pa3" size="20"><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="880" height="29">
		<p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="<s:text name='vipmcsl.jsp.mcsl.jsp.-378816520'/>" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		<p style="margin-top: 0; margin-bottom: 0"><b><font size="2" color="#0000FF"><s:text name='vipmcsl.jsp.mcsl.jsp.-602511626'/>！</font></b></div>
</form>
    </td>
    </tr>
  </table>
	<p style="margin-top: 0; margin-bottom: 0">　</p>
	<p style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" align="center" border="0" frameborder="0" src="sggpjy" scrolling="no"></iframe></p>
    <p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='vipdatepay.jsp.datepay.jsp.326654005'/></font></a></p>
	<p align="center"></p>
	<p style="margin-top: 0; margin-bottom: 0">　</div>
</body>
</html>
