<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('不能转给自己！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('转账金额不能小于0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('转出用户名报单币不能大于剩余报单币 ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('接收的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('转出用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！转账成功！');location.replace('bdbpay?uid=${uid}');</script></c:if>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jzpay.value<5000) {      alert("转账的金额必须大于5000!");      return false;    } 
  if (Form.syuser.value=="") {      alert("请填写接收用户名!");      return false;    }
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

<table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="bdbpay?status=1&uid=${uid}">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
  <TR class=content> 
      <TD align=middle bgColor=#ffffff width="500" height="41"><b><p align="right">
		<font face="Tahoma" style="font-size: 11pt">接收用户名：</font><input type="hidden" name="syuser" size="15" value="${uid}"></TD>
		<TD width="274" bgColor=#ffffff height="45"> ${uid}(${gcuser.sybdb}) </TD>
    </TR>
    <TR class=content> 
      <TD width="169" bgColor=#ffffff align="right" height="45">
		<b>
		<font style="font-size: 11pt"><font face="Tahoma">转账金额</font>：</font></b></TD>
      <TD width="274" bgColor=#ffffff height="45">  
              <font color="#FF0000">&nbsp;</font><font color="#FF0000" size="3"><select size="1" name="jzpay">
				<option selected value="10000">--1万--</option>
				<option value="20000">--2万--</option>
				<option value="30000">--3万--</option>
				<option value="50000">--5万--</option>
				<option value="100000">--10万--</option>
				</select> **</font></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=2 align=middle bgColor=#ffffff width="439" height="32"> 
              <p style="margin-top: 0; margin-bottom: 0"> 
              <INPUT class=normalButton type=hidden value="确 定 转 账" name=submit2 style="font-size: 11pt" onClick="return confirm('提示：您确定了吗？')" ></TD>
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