<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，您转账一币不能小于零或超过100000，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('转账必须是100的倍整数如：100，200，300，400，500，1000，5000，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，不能转给自己，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('只能转给自己团队的并已进入双区的玩家！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('VIP玩家一币账户余额必须大于或等于50000！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您转账一币不能大于您剩余一币 ${gcuser.pay} ，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('转入的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！转账成功！');location.replace('datepay');</script></c:if>
<html>
<head>
<title></title>
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
function checkdate()  {  
	  if (Form.jzpay.value=="") {      alert("请填写您要转账的一币!");      return false;    } 
	  if (Form.jzpay.value<99) {      alert("转账的一币必须大于等于100!");      return false;    } 
	  if (Form.jzpay.value>50000) {      alert("每次转账的一币不能超过50000!");      return false;    } 
	  if (Form.jzpay.value>${gcuser.pay})    {   alert("您的转账一币不能超过您剩余的一币${gcuser.pay}");      return false;    } 
	  if (Form.jzuser.value=="") {      alert("请填写您要转入的用户名!");      return false;    }
	  if (Form.jzuser.value=="${gcuser.username}") {      alert("不能转给自己!");      return false;    }
	  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
	  if (!chkinteger(Form.jzpay.value)){
		alert('转账一币只能为整字!');
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
	<font size="6" color="#008000">您的用户名是 </font><font color="#FF0000" size="6">${userName}</font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">　</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">　</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">您的剩余一币为：<font color="#FF0000">${gcuser.pay}</font></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">　</p><table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="vipjzpay?status=1">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
    <TR class=content>
      <TD width="172" bgColor=#ffffff align="right" height="45"><b><font style="font-size: 11pt"><font face="Tahoma">请写入转账一币</font>：</font></b></TD>
      <TD width="271" bgColor=#ffffff height="45"><font color="#FF0000" size="3"> &nbsp;<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="jzpay" size="15" maxlength="10"> **</font></TD>
    </TR>
    <TR class=content>
      <TD align=middle bgColor=#ffffff width="172" height="33"><b><p align="right"><font style="font-size: 11pt"><font face="Tahoma">请写入接收用户名</font>：</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="33"><p align="left">&nbsp;<input type="text" name="jzuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </TR>
    <tr>
		<b>
      <TD align=middle bgColor=#ffffff width="172" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt">二级密码：</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="38"><p align="left">&nbsp;<input type="password" name="pa3" size="20"></TD>
    	</tr>
	<tr>
		<b>
      <TD align=middle bgColor=#ffffff width="172" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt">独立密码：</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="38"><p align="left">&nbsp;<input type="password" name="dlpa" size="20"></TD>
    	</tr>
		<b>
    <TR class=content>
      <TD colSpan=2 align=middle bgColor=#ffffff width="439" height="40"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="确 定 转 账" name=submit2 style="font-size: 11pt" onClick="return confirm('提示：您确定了吗？')" ></TD>
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