<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('发布方出错，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('交易已完成！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('二级密码输入错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('手机验证码输入错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('该笔交易圆满成功！');location.replace('epmcjl');</script></c:if>

<script type="text/javascript" src="/images/jquery.min.js"></script>
<script src="/scripts/sms.js"></script>
<script language="JavaScript"> 
function checkdate()  {
  if (Form.password3.value=="") {      alert("请填入您的二级密码!");  Form.password3.focus();      return false;    }
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=4", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
		settime($("#btn"));
		alert("手机验证码发送成功");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.smsCode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.smsCode.focus();   return false;    }
  return true;
} 
</script>
<body topmargin="0">
<form method="POST" action="mcepok?status=1&payId=${payId}" id="Form" name="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p>　</p>
	<p><b><font color="#FF0000">您正在操作确认收款，请确认是否收到相关款项！</font></b></p>
	<table border="0" id="table1" height="316" width="666">
		<tr>
			<td width="253" align="right">用户名：</td>
			<td width="403" align="left" colspan="2">${txpay.payusername}<input type="hidden" name="user" size="10" value="${txpay.payusername}" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right">姓名：</td>
			<td width="403" align="left" colspan="2">${txpay.payname}<input type="hidden" name="remark" size="8" value="5" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right">收款银行：</td>
			<td width="403" align="left" colspan="2">${txpay.paybank}</td>
		</tr>
		<tr>
			<td width="253" align="right">收款账号：</td>
			<td width="403" align="left" colspan="2">${txpay.paycard}</td>
		</tr>
		<tr>
			<td width="253" align="right">实收金额：</td>
			<td width="403" align="left" colspan="2">${txpay.paynum*0.9}</td>
		</tr>
		<tr>
			<td width="253" align="right">二级密码：</td>
			<td width="403" align="left" colspan="2"><input type="password" name="password3" size="20"></td>
		</tr>
		<tr>
			<td width="253" align="right" height="24">联系手机：</td>
			<td width="403" align="left" colspan="2" height="24">${gcuser.simpleCall}</td>
		</tr>
		<tr>
			<td width="253" align="right" height="44">手机验证码：</td>
			<td width="78" align="right" height="44"><p align="left"><input type="text" name="smsCode" size="10"></td>
			<td width="321" align="right" height="44"><p align="left"><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></td>
		</tr>
		<tr>
			<td width="253" align="right" height="46"><p align="center">　</td>
			<td width="403" align="right" height="46" colspan="2"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确认收到款" name="B1" style="font-family: 楷体_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
btnStatus($("#btn"));
</script>