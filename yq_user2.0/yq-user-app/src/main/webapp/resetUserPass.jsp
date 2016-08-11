<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="/images/jquery.min.js"></script>
<script src="/scripts/sms.js"></script>
</head>
<script language="JavaScript"> 
function CheckIfEnglish( str )
{  
if(/[a-z]/.test(str)&&/[0-9]/.test(str)){
return true;
}else{
return false;
}
}
function checkdate()  {

  if (Form.name.value=="") {      alert("请输入姓名！");Form.name.focus();      return false;    }
  if (Form.newPassWord1.value=="") {      alert("请填入您的新登录密码！");  Form.newPassWord1.focus();      return false;    } 
  if (!CheckIfEnglish(Form.newPassWord1.value)) {      alert("您的新登录密码不符合规范，必须小写英文字母+数字！");  Form.newPassWord1.focus();      return false;    } 
  if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {  alert("提示：您的登录密码最少6位数，最大18位数！");  Form.newPassWord1.focus();  return false;  } 
  if (Form.newPassWord1.value != Form.newPassWord2.value) {      alert("两次输入新登录密码不同！"); Form.newPassWord1.focus();     return false;    } 
    $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms2?op=13", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
		settime($("#btn"));
		alert("手机验证码发送成功");
	});
	return true;
}  
function checkdate1()  {  
  if (Form.smsCode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.smsCode.focus();   return false;    }
  var data = $("#Form").serialize();

  $.post("/resetPasswod?status=7", data, function(response) {
		if(response.erroCodeNum==0){//重置成功
			alert('重置成功，请重新登录！');
		    location.replace('../index.jsp?id='+Form.toUserName.value);
		}else if(response.erroCodeNum==1){
			alert('用户不存在');
			return;
		}else if(response.erroCodeNum==2){
			alert('您填入的手机验证码不正确！');
			return;
		}else if(response.erroCodeNum==3){
			alert("您填入的登录密码与您所登记的不相符！");
			return;
		}else if(response.erroCodeNum==4){
			alert('您填入的原二级密码与您所登记的不相符，请重新输入！');
			return;
		}else if(response.erroCodeNum==5){
			alert('新二级密码不能与原二级密码相同，请重新输入！');
			return;
		}else if(response.erroCodeNum==6){
			alert('您填入的身份证号码与您所登记的不相符！');
			return;
		}else if(response.erroCodeNum==7){
			alert('您填入的姓名与您所登记的不相符！');
			return;
		}else{
			alert('发生了错误.['+response.erroCodeNum+']');
			return;
		}
	});
  return true;
}
</script>
<body topmargin="0">
<form action="" name="Form" id="Form" onSubmit="return false" method="post">
	<input type="hidden" name="targetdate" size="8">
			<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p>　</p>
	<p><b><font color="#FF0000">重置您的登录密码！</font></b></p>
	<table border="0" id="table1" height="405" width="666">
		<tr>
			<td width="260" align="right">用户名：</td>
			<td width="396" align="left"><input type="text" name="toUserName" size="20" value="${user.username}" readonly></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000">新登录密码：</font></td>
			<td width="396" align="left"><input type="password" name="newPassWord1" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000">确认登录密码：</font></td>
			<td width="396" align="left"><input type="password" name="newPassWord2" size="20" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="260" align="right">联系手机：</td>
			<td width="396" align="left">${user.call}</td>
		</tr> 
		<tr>
			<td width="260" align="right">手机验证码：</td>
			<td width="396" align="left"><input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')">
			<input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></td>
		</tr> 
		<tr>
			<td width="260" align="right" height="28"><p align="center">　</td>
			<td width="396" align="right" height="28"><span style="font-size: 9pt"><font size="1"><input type="submit" value="提交更新资料" name="B1" onClick="checkdate1();" style="font-family: 楷体_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	<p><font color="#FF00FF">这是一个重置登录密码的界面！</font></p>
	<p><font color="#FF00FF">通过手机验证码进行重置登录密码！</font></p></div>
</form>
<script type="text/javascript">
btnStatus($("#btn"));
</script>