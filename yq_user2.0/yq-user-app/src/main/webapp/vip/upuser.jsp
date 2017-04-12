<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>

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

  if (Form.name.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-153330493'/>！");Form.name.focus();      return false;    }
  if (Form.password.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.1764281287'/>！");  Form.password.focus();      return false;    } 
  if (Form.newPassWord1.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.1740598616'/>！");  Form.newPassWord1.focus();      return false;    } 
  if (Form.newPassWord1.value == Form.password.value) {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-1254134065'/>！"); Form.newPassWord1.focus();     return false;    }
  if (!CheckIfEnglish(Form.newPassWord1.value)) {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-627569921'/>！");  Form.newPassWord1.focus();      return false;    } 
  if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {  alert("<s:text name='vipupuser.jsp.upuser.jsp.-525641962'/>！");  Form.newPassWord1.focus();  return false;  } 
  if (Form.newPassWord1.value != Form.newPassWord2.value) {      alert("<s:text name='vipupuser.jsp.upuser.jsp.856129909'/>！"); Form.newPassWord1.focus();     return false;    } 
  if (Form.secondPassword.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.1467433192'/>！");  Form.secondPassword.focus();      return false;    } 
  if (Form.newSecondPassword1.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.1443750521'/>！");  Form.newSecondPassword1.focus();      return false;    }  
  if (Form.newSecondPassword1.value == Form.secondPassword.value) {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-440377455'/>！"); Form.newSecondPassword1.focus();     return false;    }
  if (!CheckIfEnglish(Form.newSecondPassword1.value)) {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-1791992834'/>！");  Form.newSecondPassword1.focus();      return false;    } 
  if (Form.newSecondPassword1.value.length > 18 || Form.newSecondPassword1.value.length < 10) {  alert("<s:text name='vipupuser.jsp.upuser.jsp.-976914480'/>！");  Form.newSecondPassword1.focus();  return false;  }
  if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-947047850'/>！"); Form.newSecondPassword2.focus();     return false;    } 
  if (Form.qq.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/>QQ！");Form.qq.focus();      return false;    }  
  if (Form.idCard.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-1745964948'/>！");  Form.idCard.focus();      return false;    }
  
    $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=0", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum==2999) { alert("发送过快！请歇息一会！"); return false; }
		if (response.erroCodeNum==2998) { alert("发送过快！请歇息一阵！"); return false; }
		if (response.erroCodeNum!=0) { alert("<s:text name='vipupuser.jsp.upuser.jsp.1886666017'/>"); return false; }
		settime($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
		alert("<s:text name='vipupuser.jsp.upuser.jsp.1886721436'/>");
	});
	return true;
}  
function checkdate1()  {  
  if (Form.smsCode.value=="") {   alert("<s:text name='vipupuser.jsp.upuser.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
  var data = $("#Form").serialize();

  $.post("updateuser?status=1", data, function(response) {
		if(response.erroCodeNum==0){//注册成功
			alert('<s:text name='vipupuser.jsp.upuser.jsp.606198600'/>！');
		    location.replace('../index.jsp?id='+Form.uuu.value);
		}else if(response.erroCodeNum==1){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.-1597545170'/>');
			return;
		}else if(response.erroCodeNum==2){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.39306141'/>！');
			return;
		}else if(response.erroCodeNum==3){
			alert("<s:text name='vipupuser.jsp.upuser.jsp.-232314341'/>！");
			return;
		}else if(response.erroCodeNum==4){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.-1979303873'/>！');
			return;
		}else if(response.erroCodeNum==5){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.748117169'/>！');
			return;
		}else if(response.erroCodeNum==6){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.1803174555'/>！');
			return;
		}else if(response.erroCodeNum==7){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.211039574'/>！');
			return;
		}else{
			alert('<s:text name='vipupuser.jsp.upuser.jsp.-745085746'/>.['+response.erroCodeNum+']');
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
	<p><b><font color="#FF0000"><s:text name='vipupuser.jsp.upuser.jsp.-2119058780'/>！</font></b></p>
	<table border="0" id="table1" height="405" width="666">
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.29623262'/>：</td>
			<td width="396" align="left"><input type="text" name="uuu" size="20" value="${user.username}" readonly></td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.-777219372'/>：</td>
			<td width="396" align="left"><input type="password" name="password" size="20"></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000"><s:text name='vipupuser.jsp.upuser.jsp.-800902043'/>：</font></td>
			<td width="396" align="left"><input type="password" name="newPassWord1" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000"><s:text name='vipupuser.jsp.upuser.jsp.1750523051'/>：</font></td>
			<td width="396" align="left"><input type="password" name="newPassWord2" size="20" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.-1074067467'/>：</td>
			<td width="396" align="left"><input type="password" name="secondPassword" size="20"></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000"><s:text name='vipupuser.jsp.upuser.jsp.-1097750138'/>：</font></td>
			<td width="396" align="left"><input type="password" name="newSecondPassword1" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"><input type="hidden" name="remark" size="5" value="1" readonly></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000"><s:text name='vipupuser.jsp.upuser.jsp.1453674956'/>：</font></td>
			<td width="396" align="left"><input type="password" name="newSecondPassword2" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.1010247606'/>：</td>
			<td width="396" align="left">${user.call}</td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.1050407'/>QQ：</td>
			<td width="396" align="left"><input type="text" name="qq" size="20" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="12" ></td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.-386556444'/>：</td>
			<td width="396" align="left"><font color="#0000FF"><input type="text" name="idCard" size="20" maxlength="19"></font>${user.userid}</td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.1213767183'/>：</td>
			<td width="396" align="left"><input type="text" name="name" size="20">${user.name}**</td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='vipupuser.jsp.upuser.jsp.-1704827075'/>：</td>
			<td width="396" align="left"><input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')">
			<input id="btn" type="button" onclick="checkdate()" value="<s:text name='vipupuser.jsp.upuser.jsp.1753968781'/>" name="B2"></td>
		</tr>
		<tr>
			<td width="260" align="right" height="28"><p align="center">　</td>
			<td width="396" align="right" height="28"><span style="font-size: 9pt"><font size="1"><input type="submit" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1610418685'/>" name="B1" onClick="checkdate1();" style="font-family: 楷体_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	<p><font color="#FF00FF"><s:text name='vipupuser.jsp.upuser.jsp.-564372223'/>！</font></p>
	<p><font color="#FF00FF"><s:text name='vipupuser.jsp.upuser.jsp.-2067483895'/>！</font></p></div>
</form>
<script type="text/javascript">
btnStatus($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
</script>
