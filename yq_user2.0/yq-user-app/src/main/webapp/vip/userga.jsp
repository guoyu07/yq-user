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

  if (Form.name.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-153330493'/>！");Form.name.focus();      return false;    }
  if (Form.newPassWord1.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.1740598616'/>！");  Form.newPassWord1.focus();      return false;    } 
  if (Form.secondPassword.value=="") {      alert("<s:text name='vipuserga.jsp.userga.jsp.1544222851'/>！");  Form.secondPassword.focus();      return false;    } 
  if (!CheckIfEnglish(Form.newPassWord1.value)) {      alert("<s:text name='vipuserga.jsp.userga.jsp.-627569921'/>！");  Form.newPassWord1.focus();      return false;    } 
  if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {  alert("<s:text name='vipupuser.jsp.upuser.jsp.-525641962'/>！");  Form.newPassWord1.focus();  return false;  } 
  if (Form.newPassWord1.value != Form.newPassWord2.value) {      alert("<s:text name='vipupuser.jsp.upuser.jsp.856129909'/>！"); Form.newPassWord1.focus();     return false;    } 
  if (Form.idCard.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.-1745964948'/>！");  Form.idCard.focus();      return false;    }
  if (Form.provinceName.value==0) {      alert("<s:text name='vipuserga.jsp.userga.jsp.-145275757'/>!");      return false;    } 
  if (Form.cityName.value==0) {      alert("<s:text name='vipuserga.jsp.userga.jsp.-145519509'/>!");      return false;    }
  if (Form.areaName.value==0) {      alert("<s:text name='vipuserga.jsp.userga.jsp.-145527167'/>!");      return false;    } 
  if (Form.bank.value=="") {      alert("<s:text name='vipuserga.jsp.userga.jsp.1996388245'/>！");  Form.bank.focus();      return false;    } 
  if (Form.card.value=="") {      alert("<s:text name='vipuserga.jsp.userga.jsp.1712677638'/>！");  Form.card.focus();      return false;    } 
	return true;
}  
function checkdate1()  {  
 // if (Form.smsCode.value=="") {   alert("<s:text name='vipupuser.jsp.upuser.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
  if(!checkdate()){
	  return;
  }
  var data = $("#Form").serialize();
  $.post("userga?status=1", data, function(response) {
		if(response.erroCodeNum==0){//注册成功
			alert('<s:text name='vipupuser.jsp.upuser.jsp.606198600'/>！');
		    location.replace('../index.jsp?id='+Form.userName.value);
		}else if(response.erroCodeNum==1){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.-1597545170'/>');
			return;
		}else if(response.erroCodeNum==2){
			alert('<s:text name='vipupuser.jsp.upuser.jsp.39306141'/>！');
			return;
		}else if(response.erroCodeNum==3){
			alert('<s:text name='vipuserga.jsp.userga.jsp.-869667680'/>！');
			return;
		}else if(response.erroCodeNum==4){
			alert('<s:text name='vipuserga.jsp.userga.jsp.698939873'/>！');
			return;
		}else{
			alert('<s:text name='vipupuser.jsp.upuser.jsp.-745085746'/>.['+response.erroCodeNum+']');
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
	document.getElementById("cityName").options[0] = new Option('==<s:text name='vipuserga.jsp.userga.jsp.-145519509'/>==','0');
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
	document.getElementById("areaName").options[0] = new Option('==<s:text name='vipuserga.jsp.userga.jsp.-145527167'/>==','0');
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
	<p><b><font color="#FF0000" size="5"><s:text name='vipuserga.jsp.userga.jsp.472164400'/></font></b></p>
	<table border="0" id="table1" height="445" width="666" cellspacing="1">
		<tr>
			<td width="253" align="right"><s:text name='vipupuser.jsp.upuser.jsp.29623262'/>：</td>
			<td width="406" align="left">${gcuser.username}<input type="hidden" name="userName" size="20" value="${gcuser.username}" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right"><font color="#FF0000"><s:text name='vipupuser.jsp.upuser.jsp.-800902043'/>：</font></td>
			<td width="406" align="left"><input type="password" name="newPassWord1" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="253" align="right"><font color="#FF0000"><s:text name='vipupuser.jsp.upuser.jsp.1750523051'/>：</font></td>
			<td width="406" align="left"><input type="password" name="newPassWord2" size="20" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipuserga.jsp.userga.jsp.734362'/>：</td>
			<td width="406" align="left">${gcuser.name}</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipuserga.jsp.userga.jsp.799485150'/>：</td>
			<td width="406" align="left">
			<select size="1" name="bank">
			<option selected value="${gcuser.bank}">${gcuser.bank}</option>	
			<option value="<s:text name='vipuserga.jsp.userga.jsp.-453899062'/>"></option>
			<option value="<s:text name='vipuserga.jsp.userga.jsp.1781968004'/>"></option>	
			<option value="<s:text name='vipuserga.jsp.userga.jsp.691148048'/>"></option>	
			<option value="<s:text name='vipuserga.jsp.userga.jsp.1019445992'/>"></option>			
			</select>
			</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipuserga.jsp.userga.jsp.799409753'/>：</td>
			<td width="406" align="left"><input type="text" name="card" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="19" value="${gcuser.card}" /></td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipupuser.jsp.upuser.jsp.1010247606'/>：</td>
			<td width="406" align="left">${gcuser.call}</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipupuser.jsp.upuser.jsp.1050407'/>QQ：</td>
			<td width="406" align="left">${gcuser.qq}</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipuserga.jsp.userga.jsp.1768474821'/>：</td>
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
			<td width="253" align="right"><s:text name='vipuserga.jsp.userga.jsp.-1875608565'/>：</td>
			<td width="406" align="left"><input type="password" name="secondPassword" size="20" /></td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipupuser.jsp.upuser.jsp.-386556444'/>：</td>
			<td width="406" align="left"><font color="#0000FF"><input type="text" name="idCard" size="20" maxlength="19" /></font>${gcuser.userid}</td>
		</tr>
		<tr>
			<td width="253" align="right"><s:text name='vipupuser.jsp.upuser.jsp.-1704827075'/>：</td>
			<td width="406" align="left"><input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"><input id="btn" type="button" onclick="checkdate()" value="<s:text name='vipupuser.jsp.upuser.jsp.1753968781'/>" name="B2" /></td>
		</tr>
		<tr>
			<td width="253" align="right" height="42"><p align="center">　</td>
			<td width="406" align="right" height="42"><span style="font-size: 9pt"><font size="1"><input type="submit" value="<s:text name='vipuserga.jsp.userga.jsp.1384157160'/>" name="B1" style="font-family: 楷体_GB2312; font-size: 12pt; font-weight: bold; float:left" onClick="checkdate1();"></font></span></td>
		</tr>
		</table>
	<p><b><font color="#FF0000"><s:text name='vipuserga.jsp.userga.jsp.-2064239147'/>！</font></b></div>
</form>
<table border="0" width="100%" id="table1" height="33" cellspacing="1" bgcolor="#FFFFFF">
	<tr>
		<td width="20"></td>
		<% //TODO 此处需要翻译 %>
		<td><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc" style="text-decoration: none; font-weight:700">积分游戏平台用户名转让申请书</a></td>
		<td><a target="_blank" href="http://bf.zgyce.com/公司三阶段相关培训资料.zip" style="text-decoration: none; font-weight:700">公司三阶段相关培训资料</a></td>
	</tr>
</table>
<p align="center" style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="35%" width="100%" border="0" frameborder="0" src="updateuserjc"></iframe></p>
</body>
</html>
