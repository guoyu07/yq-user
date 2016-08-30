<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-125850672'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-271901504'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.386612509'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('VIP<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-1681297541'/>50000！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-1612326297'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.246684949'/>！');location.replace('datepay');</script></c:if>
<html>
<head>
<title></title>
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
function checkdate()  {  
	  if (Form.jzpay.value=="") {      alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1060233581'/>!");      return false;    } 
	  if (Form.jzpay.value<99) {      alert("<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-1705620723'/>100!");      return false;    } 
	  if (Form.jzpay.value>50000) {      alert("<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.898485515'/>!");      return false;    } 
	  if (Form.jzpay.value>${gcuser.pay})    {   alert("<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.2136440982'/>${gcuser.pay}");      return false;    } 
	  if (Form.jzuser.value=="") {      alert("<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.1569959089'/>!");      return false;    }
	  if (Form.jzuser.value=="${gcuser.username}") {      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>!");      return false;    }
	  if (Form.pa3.value=="") {      alert("<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-1989247238'/>!");      return false;    } 
	  if (!chkinteger(Form.jzpay.value)){
		alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1582955249'/>!');
		document.Form.jzpay.focus;
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
return true;  }  
</script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">　</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">　</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF">
	<font size="6" color="#008000"><s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-1396688147'/> </font><font color="#FF0000" size="6">${userName}</font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">　</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">　</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"><s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-117868307'/>：<font color="#FF0000">${gcuser.pay}</font></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">　</p><table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="vipjzpay?status=1">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
    <TR class=content>
      <TD width="172" bgColor=#ffffff align="right" height="45"><b><font style="font-size: 11pt"><font face="Tahoma"><s:text name='vipvipjzpay.jsp.vipjzpay.jsp.138160222'/></font>：</font></b></TD>
      <TD width="271" bgColor=#ffffff height="45"><font color="#FF0000" size="3"> &nbsp;<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="jzpay" size="15" maxlength="10"> **</font></TD>
    </TR>
    <TR class=content>
      <TD align=middle bgColor=#ffffff width="172" height="33"><b><p align="right"><font style="font-size: 11pt"><font face="Tahoma"><s:text name='vipvipjzpay.jsp.vipjzpay.jsp.-2066860854'/></font>：</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="33"><p align="left">&nbsp;<input type="text" name="jzuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </TR>
    <tr>
		<b>
      <TD align=middle bgColor=#ffffff width="172" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt"><s:text name='reg.jsp.reg.jsp.630954966'/>：</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="38"><p align="left">&nbsp;<input type="password" name="pa3" size="20"></TD>
    	</tr>
	<tr>
		<b>
      <TD align=middle bgColor=#ffffff width="172" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt"><s:text name='vipvipjzpay.jsp.vipjzpay.jsp.907419290'/>：</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="38"><p align="left">&nbsp;<input type="password" name="dlpa" size="20"></TD>
    	</tr>
		<b>
    <TR class=content>
      <TD colSpan=2 align=middle bgColor=#ffffff width="439" height="40"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.537856614a'/>" name=submit2 style="font-size: 11pt" onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')" ></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
	<p style="margin-top: 0; margin-bottom: 0">　</p>
	<p style="margin-top: 0; margin-bottom: 0">
</div>
</body>
</html>
