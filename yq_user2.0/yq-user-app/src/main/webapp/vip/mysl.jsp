<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.2024869980'/> ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.-1321238879'/>！');location.replace('jztojb');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.-2099694066'/>！');location.replace('gpjy');</script></c:if>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.txpay.value=="") {      alert("<s:text name='vipmysl.jsp.mysl.jsp.-477498021'/>!");  Form.txpay.focus();     return false;    } 
  if (Form.txpay.value==0) {      alert("<s:text name='vipmysl.jsp.mysl.jsp.175650976'/>!");      return false;    }
  if (Form.txpay.value<1) {      alert("<s:text name='vipmysl.jsp.mysl.jsp.2087317176'/>");      return false;    }
  if (Form.txpay.value>2000) {      alert("<s:text name='vipmysl.jsp.mysl.jsp.1250924413'/>");      return false;    }
  if (Form.txpay.value>${zdjyg}) {      alert("<s:text name='vipmysl.jsp.mysl.jsp.150034015'/>${zdjyg}");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('<s:text name='vipmysl.jsp.mysl.jsp.-1758918826'/>!');
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
  if (Form.pa3.value=="") {      alert("<s:text name='vipepmy.jsp.epmy.jsp.-1989247238'/>!");  Form.pa3.focus();    return false;    } 
return true;  }  
</script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b><p><font color="#FF0000" face="隶书" style="font-size: 30pt"><s:text name='vipmysl.jsp.mysl.jsp.-1733445863'/></font></p>
        <table border="0" width="60%" id="table1" height="32" bgcolor="#FFEEEE">
        <tr>
		<td><s:text name='vipmysl.jsp.mysl.jsp.672800012'/>：<b><font color="#FF0000">
		<c:if test="${jygj<1}">0${jygj}</c:if><c:if test="${jygj>=1}">${jygj}</c:if>&nbsp; </font></b></td>
		</tr>
		</table>
<table width="60%" border="0" cellpadding="0" class="border" bgcolor="#800080">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="683"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="mysl?status=1">
      <div align="center"><TABLE width="94%" border=0 height="115" cellpadding="2" bgcolor="#FFFFFF">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="4" align="right" rowspan="3"><p align="center">　</TD>
    </TR>
    <TR class=content> 
      <TD width="214" bgColor=#ffffff align="right" height="27"><font style="font-size: 11pt; font-weight:700"><s:text name='vipdatepay.jsp.datepay.jsp.29623262'/>：</font></TD>
      <TD width="395" bgColor=#ffffff height="27"><font color="#FF0000"><b>${userName}</b></font></TD>
    </TR>
    <TR class=content> 
      <TD width="214" bgColor=#ffffff align="right" height="32"><font style="font-size: 10pt"><s:text name='vipmysl.jsp.mysl.jsp.619069972'/>：</font></TD>
      <TD width="395" bgColor=#ffffff height="32"><font size="3"> <span style="font-size: 11pt"><INPUT name="txpay" size=15></span></font><font color="#FF0000"><span style="font-size: 9pt"></span></font><font style="font-size: 9pt" color="#FF0000">** 最大可买入</font><font style="font-size: 9pt" color="#008000">${zdjyg}</font><font style="font-size: 9pt" color="#FF0000">个积分<input type="hidden" name="gj" size="5" value="${jygj}"></font></TD>
    </TR>
    <tr><b>
		<TD colSpan=2 align=middle bgColor=#ffffff width="233" height="29"><b><p align="right"><font style="font-size: 10pt"><s:text name='vipmcsl.jsp.mcsl.jsp.630954966'/>：</font></TD>
		<TD align=middle bgColor=#ffffff width="395" height="29"><p align="left"><input type="password" name="pa3" size="20"><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </tr>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="623" height="37"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="<s:text name='vipmysl.jsp.mysl.jsp.-380021763'/>" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
<p style="margin-top: 0; margin-bottom: 0">　</p>
<p style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" align="center" border="0" frameborder="0" src="sgqg" scrolling="no"></iframe></p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='vipdatepay.jsp.datepay.jsp.326654005'/></font></a></p>
<p style="margin-top: 0; margin-bottom: 0">　</div>
</body>
</html>
