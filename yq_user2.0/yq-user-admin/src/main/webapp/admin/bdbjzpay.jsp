<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('不能转给自己！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('转账金额不能小于0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('转出用户名报单币不能大于剩余报单币 ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('接收的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('转出用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('操作密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！转账成功！');location.replace('bdbjzpay');</script></c:if>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jcname.value=="") {      alert("请写入转出用户名!");      return false;    } 
  if (Form.jzpay.value<5000) {      alert("转账的金额必须大于5000!");      return false;    } 
  if (Form.syuser.value=="") {      alert("请填写接收用户名!");      return false;    }
  if (Form.jcname.value==Form.syuser.value) {      alert("不能转给自己!");      return false;    }
  if (Form.oppass.value=="") {      alert("操作密码不能为空!");  Form.oppass.focus;   return false;    }
  if (Form.remark.value=="") {      alert("请选择备注!");  Form.oppass.focus;   return false;    }
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

                      <b>
						　<p align="center" style="margin-top: 0; margin-bottom: 0">
	　</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	　</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF">
	<font size="6" color="#008000">报单币转账</font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	　</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">　</p>
						<table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="bdbjzpay?status=1">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
    <tr>

                      <b>
      <TD width="169" bgColor=#ffffff align="right" height="45">
		<b>
		<font face="Tahoma" color="#FF00FF" style="font-size: 11pt">转出用户名：</font></b></TD>
      <TD width="274" bgColor=#ffffff height="45">  
              <font color="#FF0000" size="3"> &nbsp;<input type="text" name="jcname" size="15"> **</font></TD>
    </tr>
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
				<option value="500000">--50万--</option>
				</select> **</font></TD>
    </TR>
    <TR class=content> 
      <TD align=middle bgColor=#ffffff width="169" height="41"><b><p align="right">
		<font face="Tahoma" style="font-size: 11pt">接收用户名：</font></TD>
      <TD align=middle bgColor=#ffffff width="274" height="41"><p align="left">&nbsp;<input type="text" name="syuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </TR>
     <TR class=content> 
      <TD align=middle bgColor=#ffffff width="169" height="41"><b><p align="right">
		<font face="Tahoma" style="font-size: 11pt">操作密码：</font></TD>
      <TD align=middle bgColor=#ffffff width="274" height="41"><p align="left">&nbsp;<input type="text" name="oppass" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </TR>
     <TR class=content> 
      <TD align=middle bgColor=#ffffff width="169" height="41"><b><p align="right">
		<font face="Tahoma" style="font-size: 11pt">备注：</font></TD>
      <TD align=middle bgColor=#ffffff width="274" height="41"><p align="left">&nbsp;
      <select style="width:130px;" id="remark" name="remark" >
      <option value="转错">转错</option>
      <option value="VIP充值错误转回">VIP充值错误转回</option>
      <option value="宿舍押金">宿舍押金</option>
      </select><!-- <input type="text" name="remark" size="15" maxlength="10"> <font color="#FF0000" size="3">*不超过10字。*</font>--></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=2 align=middle bgColor=#ffffff width="439" height="32"> 
              <p style="margin-top: 0; margin-bottom: 0"> 
              <INPUT class=normalButton type=submit value="确 定 转 账" name=submit2 style="font-size: 11pt" onClick="return confirm('提示：您确定了吗？')" ></TD>
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