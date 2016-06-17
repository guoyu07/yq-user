<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('vip用户才能玩这个功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('不能转给自己！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('只能转给自己团队的并已进入双区的玩家！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('转账金额不能小于0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('转出用户名报单币不能大于剩余报单币 ');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('接收的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<html>
<head>
<title></title>
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jcname.value=="") {      alert("请写入转出用户名!");      return false;    } 
  if (Form.jzpay.value<5000) {      alert("转账的金额必须大于5000!");      return false;    } 
  if (Form.syuser.value=="") {      alert("请填写接收用户名!");      return false;    }
  if (Form.jcname.value==Form.syuser.value) {      alert("不能转给自己!");      return false;    }
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (!chkinteger(Form.jzpay.value)){
	alert('转账金额只能为整字!');
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
<div align="center">
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"><span style="background-color: #FFFFFF"><font size="6" color="#008000">报单币转账</font></span></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<table width="533" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="533"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="bdbzz?status=1">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center"><TABLE width="495" border=0 cellSpacing=1 height="209">
  <TBODY>
    <tr>
      <TD width="185" bgColor=#ffffff align="right" height="39"><b><font face="Tahoma" color="#FF00FF" style="font-size: 11pt">转出用户名：</font></b></TD>
      <TD width="297" bgColor=#ffffff height="39"><font color="#FF0000" size="3"> &nbsp;<input type="text" name="jcname" size="15" value="${userName}" readonly> **</font></TD>
    </tr>
    <TR class=content> 
      <TD width="185" bgColor=#ffffff align="right" height="37"><b><font style="font-size: 11pt"><font face="Tahoma">转账数量</font>：</font></b></TD>
      <TD width="297" bgColor=#ffffff height="37"><font color="#FF0000">&nbsp;</font><font color="#FF0000" size="3"><select size="1" name="jzpay">
		<option selected value="10000">--1万--</option>
		<option value="20000">--2万--</option>
		<option value="30000">--3万--</option>
		<option value="50000">--5万--</option>
		</select> ** </font><font color="#008000" size="2">剩余：</font><b><font color="#0000FF" size="2">${sybdb}</font></b></TD>
    </TR>
    <tr>
      <TD align=middle bgColor=#ffffff width="185" height="39"><b><p align="right"><font face="Tahoma" style="font-size: 11pt">接收用户名：</font></TD>
      <TD align=middle bgColor=#ffffff width="297" height="39"><p align="left">&nbsp;<input type="text" name="syuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </tr>
    <TR class=content> 
      <TD align=middle bgColor=#ffffff width="185" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt">二级密码：</font></TD>
      <TD align=middle bgColor=#ffffff width="297" height="38"><p align="left">&nbsp;<input type="password" name="pa3" size="20"></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=2 align=middle bgColor=#ffffff width="487" height="48"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="确 定 转 账" name=submit2 style="font-size: 11pt" onClick="return confirm('提示：您确定了吗？')" ></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
</div>
</body>
</html>
