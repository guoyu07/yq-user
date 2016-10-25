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
function checkdate(s)  {

  var languege = s;
  if (Form.name.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='reg.jsp.reg.jsp.734362'/>！");Form.name.focus();      return false;    }
  if (Form.newPassWord1.value=="") {      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1740598616'/>！");  Form.newPassWord1.focus();      return false;    } 
  if (!CheckIfEnglish(Form.newPassWord1.value)) {      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-627569921'/>！");  Form.newPassWord1.focus();      return false;    } 
  if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {  alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-525641962'/>！");  Form.newPassWord1.focus();  return false;  }
  if (Form.newPassWord1.value != Form.newPassWord2.value) {      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.856129909'/>！"); Form.newPassWord1.focus();     return false;    } 
  if (Form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  Form.inputCall.focus();  return false;  }
    $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms2?op=13&status=8", data, function(response) {
		if(response.erroCodeNum==2){
			alert('<s:text name='Enter_phone_number_error'/>！');
			$("#btn").attr("disabled",false);
			Form.inputCall.focus();  return false;
			
		}
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>"); return false; }
		settime($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
		alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
	});
	return true;
}  
function checkNumber()  { 
	if (Form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  Form.inputCall.focus();  return false;  }
	var data = $("#Form").serialize();
	$.post("/checkUserParam?status=8",data, function(response) {
		if(response.erroCodeNum==1){
			alert('<s:text name='dones.not.exist.username'/>！');
			return false;
		}
		if(response.erroCodeNum==2){
			alert('<s:text name='Enter_phone_number_error'/>！');
			Form.inputCall.focus();  return false;
		}
	});

}
function checkdate1()  {  
  if (Form.smsCode.value=="") {   alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
  var data = $("#Form").serialize();

  $.post("/resetPasswod?status=7", data, function(response) {
		if(response.erroCodeNum==0){//重置<s:text name='reg1.jsp.reg1.jsp.799375'/>
			alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.1543820152'/>！');
		    location.replace('../index.jsp?id='+Form.toUserName.value);
		}else if(response.erroCodeNum==1){
			alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-1597545170'/>');
			return;
		}else if(response.erroCodeNum==2){
			alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-1020311822'/>!');
			return;
		}else if(response.erroCodeNum==3){
			alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.806188307'/>!");
			return;
		}else if(response.erroCodeNum==4){
			alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.436948753'/>!");
			return;
		}else{
			alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-745085746'/>.['+response.erroCodeNum+']');
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
	<p><b><font color="#FF0000"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1499362834'/>！</font></b></p>
	<table border="0" id="table1" height="405" width="666">
		<tr>
			<td width="260" align="right"><s:text name='reg.jsp.reg.jsp.29623262'/>：</td>
			<td width="396" align="left"><input type="text" name="toUserName" size="20" value="${user.username}" readonly></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-800902043'/>：</font></td>
			<td width="396" align="left"><input type="password" name="newPassWord1" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="260" align="right"><font color="#FF0000"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1750523051'/>：</font></td>
			<td width="396" align="left"><input type="password" name="newPassWord2" size="20" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="260" align="right"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1050407'/><s:text name='reg.jsp.reg.jsp.806479'/>：</td>
			<td width="396" align="left"><span class="tispsfz">${user.call}</span></td>
		</tr> 
		<tr>
			<td width="260" align="right"><s:text name='enter.phone.number'/>：</td><!-- onblur="checkNumber()" -->
			<td width="396" align="left"><input type="text" id="inputCall" name="inputCall" size="20" tabindex="18" ></input></td>
		</tr> 
		<tr>
			<td width="260" align="right"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</td>
			<td width="396" align="left"><input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')">
			<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
			<input id="btn" type="button" onclick="checkdate('<s:text name="#SESSION_LOCALE"/>')" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2"></td>
		</tr> 
		<tr>
			<td width="260" align="right" height="28"><p align="center">　</td>
			<td width="396" align="right" height="28"><span style="font-size: 9pt"><font size="1"><input type="submit" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1610418685'/>" name="B1" onClick="checkdate1();" style="font-family: <s:text name='sfz_eng.html.sfz_eng.html.857276'/>_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	<p><font color="#FF00FF"><s:text name='resetUserPass.jsp.resetUserPass.jsp.81135556'/>！</font></p>
	<p><font color="#FF00FF"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1451452169'/>！</font></p></div>
</form>
<script type="text/javascript">
btnStatus($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
</script>
