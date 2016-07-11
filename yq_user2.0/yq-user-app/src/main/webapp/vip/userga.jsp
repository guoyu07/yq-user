<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
</head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="javascript" src="/scripts/myarea.js"></script>
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
  if (Form.secondPassword.value=="") {      alert("请填入您的二级密码！");  Form.secondPassword.focus();      return false;    } 
  if (!CheckIfEnglish(Form.newPassWord1.value)) {      alert("您的新登录密码不符合规范，必须小写英文字母+数字！");  Form.newPassWord1.focus();      return false;    } 
  if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {  alert("提示：您的登录密码最少6位数，最大18位数！");  Form.newPassWord1.focus();  return false;  } 
  if (Form.newPassWord1.value != Form.newPassWord2.value) {      alert("两次输入新登录密码不同！"); Form.newPassWord1.focus();     return false;    } 
  if (Form.idCard.value=="") {      alert("请填入您的身份证号码！");  Form.idCard.focus();      return false;    }
  if (Form.provinceName.value==0) {      alert("请选择省份!");      return false;    } 
  if (Form.cityName.value==0) {      alert("请选择城市!");      return false;    }
  if (Form.areaName.value==0) {      alert("请选择地区!");      return false;    } 
  if (Form.bank.value=="") {      alert("请选择收款银行！");  Form.bank.focus();      return false;    } 
  if (Form.card.value=="") {      alert("请填入您的收款账号！");  Form.card.focus();      return false;    } 
	return true;
}  
function checkdate1()  {  
 // if (Form.smsCode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.smsCode.focus();   return false;    }
  if(!checkdate()){
	  return;
  }
  var data = $("#Form").serialize();
  $.post("userga?status=1", data, function(response) {
		if(response.erroCodeNum==0){//注册成功
			alert('更新资料成功，请重新登录！');
		    location.replace('../index.jsp?id='+Form.userName.value);
		}else if(response.erroCodeNum==1){
			alert('用户不存在');
			return;
		}else if(response.erroCodeNum==2){
			alert('您填入的手机验证码不正确！');
			return;
		}else if(response.erroCodeNum==3){
			alert('您填入的二级密码不正确！');
			return;
		}else if(response.erroCodeNum==4){
			alert('您填入的身份证号码不正确！');
			return;
		}else{
			alert('发生了错误.['+response.erroCodeNum+']');
			return;
		}
	});
  return true;
}
</script>
<script language="javascript" type="text/javascript">
<!--

function ChangeProvince(subid)
{

	document.getElementById("cityName").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("cityName").options[0] = new Option('==请选择城市==','0');
	for (i=0;i < subCity.length; i++)
	{
		if (subCity[i][1] == subid)
		{ 
			document.getElementById("cityName").options[document.getElementById("cityName").length] = new Option(subCity[i][0], subCity[i][2]);
		} 
	}
	ChangeCity(0)	////清空三级菜单
} 

function ChangeCity(subid)
{
	document.getElementById("areaName").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("areaName").options[0] = new Option('==请选择地区==','0');
	for (i=0;i < subArea.length; i++)
	{
		if (subArea[i][1] == subid)
		{ 
			document.getElementById("areaName").options[document.getElementById("areaName").length] = new Option(subArea[i][0], subArea[i][2]);
		} 
	}
} 

function AmendCity(ProvinceID,CityID,AreaID)
{
	ChangeProvince(ProvinceID);
	for(var i=1;i<document.getElementById("cityName").length;i++)
	{
		if (document.getElementById("cityName").options[i].value == CityID)
			{document.getElementById("cityName").options[i].selected=true;}
	}
	ChangeCity(CityID);
	for(var i=1;i<document.getElementById("areaName").length;i++)
	{
		if (document.getElementById("areaName").options[i].value == AreaID)
			{document.getElementById("areaName").options[i].selected=true;}
	}
}

//-->
</script>

<body bgcolor="#DDFFDD">
<form method="post" action="" name="Form" id="Form" onSubmit="return false">
	<input type="hidden" name="remark" size="5" value="2" readonly>
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p><b><font color="#FF0000" size="5">修改个人资料</font></b></p>
	<table border="0" id="table1" height="445" width="666" cellspacing="1">
		<tr>
			<td width="253" align="right">用户名：</td>
			<td width="406" align="left">${gcuser.username}<input type="hidden" name="userName" size="20" value="${gcuser.username}" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right"><font color="#FF0000">新登录密码：</font></td>
			<td width="406" align="left"><input type="password" name="newPassWord1" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="253" align="right"><font color="#FF0000">确认登录密码：</font></td>
			<td width="406" align="left"><input type="password" name="newPassWord2" size="20" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="253" align="right">姓名：</td>
			<td width="406" align="left">${gcuser.name}</td>
		</tr>
		<tr>
			<td width="253" align="right">收款银行：</td>
			<td width="406" align="left"><select size="1" name="bank">
			<option selected value="${gcuser.bank}">${gcuser.bank}</option>			
			<option value="工商银行">工商银行</option>
			<option value="农业银行">农业银行</option>
			<option value="建设银行">建设银行</option>
			<option value="中国银行">中国银行</option>
			</select></td>
		</tr>
		<tr>
			<td width="253" align="right">收款账号：</td>
			<td width="406" align="left"><input type="text" name="card" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="19" value="${gcuser.card}" /></td>
		</tr>
		<tr>
			<td width="253" align="right">联系手机：</td>
			<td width="406" align="left">${gcuser.call}</td>
		</tr>
		<tr>
			<td width="253" align="right">联系QQ：</td>
			<td width="406" align="left">${gcuser.qq}</td>
		</tr>
		<tr>
			<td width="253" align="right">开户行地址：</td>
			<td width="406" align="left"><select name="provinceName" OnChange="ChangeProvince(document.getElementById('provinceName').options[document.getElementById('provinceName').selectedIndex].value);" id="provinceName">
                      <option selected= "selected" value="${gcuser.addsheng}">${gcuser.addsheng}</option>

		<s:iterator var="data" value="provinceList">
		                      <option value="${data.b}">${data.b}</option>
		</s:iterator>

                    </select>
					 <select name="cityName" onChange="ChangeCity(document.getElementById('cityName').options[document.getElementById('cityName').selectedIndex].value);" id="cityName">
                      <option selected="selected" value="${gcuser.addshi}">${gcuser.addshi}</option>
                    </select>
					 <select name="areaName" onChange="ChangeArea(document.getElementById('areaName').options[document.getElementById('areaName').selectedIndex].value);" id="areaName">
                      <option selected="selected" value="${gcuser.addqu}">${gcuser.addqu}</option>
                    </select><font color="#FF0000"> </font>   
              </td>
		</tr>
		<tr>
			<td width="253" align="right">验证二级密码：</td>
			<td width="406" align="left"><input type="password" name="secondPassword" size="20" /></td>
		</tr>
		<tr>
			<td width="253" align="right">验证身份证号码：</td>
			<td width="406" align="left"><font color="#0000FF"><input type="text" name="idCard" size="20" maxlength="19" /></font>${gcuser.userid}</td>
		</tr>
		<tr>
			<td width="253" align="right">手机验证码：</td>
			<td width="406" align="left"><input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2" /></td>
		</tr>
		<tr>
			<td width="253" align="right" height="42"><p align="center">　</td>
			<td width="406" align="right" height="42"><span style="font-size: 9pt"><font size="1"><input type="submit" value="提交修改" name="B1" style="font-family: 楷体_GB2312; font-size: 12pt; font-weight: bold; float:left" onClick="checkdate1();"></font></span></td>
		</tr>
		</table>
	<p><b><font color="#FF0000">只需修改一个用户名，其它同名账户统一更新！</font></b></div>
</form>
<table border="0" width="100%" id="table1" height="33" cellspacing="1" bgcolor="#FFFFFF">
	<tr>
		<td width="20"></td>
		<td><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc" style="text-decoration: none; font-weight:700">积分游戏平台用户名转让申请书</a></td>
		<td><a target="_blank" href="http://bf.zgyce.com/公司三阶段相关培训资料.zip" style="text-decoration: none; font-weight:700">公司三阶段相关培训资料</a></td>
	</tr>
</table>
<p align="center" style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="35%" width="100%" border="0" frameborder="0" src="updateuserjc"></iframe></p>
</body>
</html>