<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common${SESSION_LOCALE}.css" />
	<script type="text/javascript" src="/images/jquery.min.js"></script>
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

  if (Form.name.value=="") {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-153330493'/>！");Form.name.focus();      return false;    }
  if(Form.newPassWord1.value != "" || Form.newPassWord2.value != ""){
	  if (Form.newPassWord1.value != Form.newPassWord2.value) {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.856129909'/>！"); Form.newPassWord1.focus();     return false;    }
	  if (!CheckIfEnglish(Form.newPassWord1.value)) {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-627569921'/>！");  Form.newPassWord1.focus();      return false;    } 
	  if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {  alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-525641962'/>！");  Form.newPassWord1.focus();  return false;  } 
  }
  if(Form.newSecondPassword1.value != "" || Form.newSecondPassword2.value != ""){
	  if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-947047850'/>！"); Form.newPassWord1.focus();     return false;    }
	  if (!CheckIfEnglish(Form.newSecondPassword1.value)) {		alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1932694410'/>！");Form.newSecondPassword1.focus();return false;}
	  if (Form.newSecondPassword1.value.length < 10) {		alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.908634376'/>!");Form.newSecondPassword1.focus();return false;}
	  if (Form.newSecondPassword1.value.length > 20) {		alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.653975038'/>!");Form.newSecondPassword1.focus();return false;}
  }
  if (Form.bank.value=="") {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1996388245'/>！");  Form.bank.focus();      return false;    } 
  if (Form.card.value=="") {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1712677638'/>！");  Form.card.focus();      return false;    } 
  if (Form.provinceName.value==0) {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-145275757'/>!");      return false;    } 
  if (Form.cityName.value==0) {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-145519509'/>!");      return false;    }
  if (Form.areaName.value==0) {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-145527167'/>!");      return false;    } 
  if (Form.areaCode.value=="") {      alert("<s:text name='emptyinternationalareacode'/>!");      return false;    } 
  if (Form.secondPassword.value=="") {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1544222851'/>！");  Form.secondPassword.focus();      return false;    }
  if (Form.idCard.value=="") {      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1745964948'/>！");  Form.idCard.focus();      return false;    }
 
	return true;
}  

function sendMsg(){
	if(!checkdate()){
		  return;
	}
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=1", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1886666017'/>"); return false; }
		settime($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
		alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1886721436'/>");
	});
}
function checkdate1()  {  
  if (Form.smsCode.value=="") {   alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
  if(!checkdate()){
	  return;
  }
  var data = $("#Form").serialize();
  $.post("userga?status=2", data, function(response) {
		if(response.erroCodeNum==0){//更新成功
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.606198600'/>！');
		    location.replace('../index.jsp?id='+Form.userName.value);
		}else if(response.erroCodeNum==1){
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1597545170'/>');
			return;
		}else if(response.erroCodeNum==2){
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.39306141'/>！');
			return;
		}else if(response.erroCodeNum==3){
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-869667680'/>！');
			return;
		}else if(response.erroCodeNum==4){
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.698939873'/>！');
			return;
		}else if(response.erroCodeNum==5){
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.856129909'/>！');
			return;
		}else if(response.erroCodeNum==6){
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-947047850'/>！');
			return;
		}else{
			alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-745085746'/>.['+response.erroCodeNum+']');
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
	document.getElementById("cityName").options[0] = new Option('==<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-145519509'/>==','0');
	for (i=0;i < subCity.length; i++)
	{
		if (subCity[i][1] == subid)
		{ 
			document.getElementById("cityName").options[document.getElementById("cityName").length] = new Option(subCity[i][0], subCity[i][2]);
		} 
	}
	ChangeCity(0)	
} 

function ChangeCity(subid)
{
	document.getElementById("areaName").length = 0; 
	var subid=subid;
	var i;
	document.getElementById("areaName").options[0] = new Option('==<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-145527167'/>==','0');
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
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1 new5-box">
					<div class="content-title">
						<span><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.472164400'/></span>
						<p class="r-link">
							<a href="#" class="hover"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.616632997'/></a>|
							<a href="updateuserjc"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.709350807'/></a>
						</p>
					</div>
					<div class="content-form new6-box">				 
						<form class="form" method="post" action="" name="Form" id="Form" onSubmit="return false">
							<input type="hidden" name="remark" size="5" value="2" readonly>
							<input type="hidden" name="targetdate" size="8">
							<input type="hidden" name="xmlmode" size="8">
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.29623262'/>：</label>${gcuser.username}<input type="hidden" name="userName" size="20" value="${gcuser.username}" readonly></p>
							<p><label style="color: red"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-800902043'/>：</label><input type="password" name="newPassWord1" size="20" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"></p>
							<p><label style="color: red"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1750523051'/>：</label><input type="password" name="newPassWord2" size="20" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"></p>
							<p><label style="color: red"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1097750138'/>：</label><input type="password" name="newSecondPassword1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"></p>
							<p><label style="color: red"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1453674956'/>：</label><input type="password" name="newSecondPassword2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"></p>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.734362'/>：</label>${gcuser.name}</p>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.799485150'/>：</label>
							<select size="1" name="bank">
							<option selected value="${gcuser.bank}">${gcuser.bank}</option>			
							<option value="<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-453899062'/>"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-453899062'/></option>
							<option value="<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1781968004'/>"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1781968004'/></option>
							<option value="<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.691148048'/>"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.691148048'/></option>
							<option value="<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1019445992'/>"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1019445992'/></option>
							<option value="<s:text name='bank_paypal'/>"><s:text name='bank_paypal'/></option>
							</select></p>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.799409753'/>：</label><input type="text" name="card" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="19" value="${gcuser.card}" /></p>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1010247606'/>：</label>
							${gcuser.call}<label><select  id="areaCode" name="areaCode">
							<option selected= "selected" value="${interRegionCode.region_code}">${interRegionCode.country_name}</option>
							   <s:iterator  var="data" value="areaCodeList">
									<option  value="${data.region_code}">${data.country_name}</option>
								</s:iterator>
							</select></label></p>
							<%-- <p><label><s:text name='International_area_code'/>：</label>
							</p> --%>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1050407'/>QQ：</label>${gcuser.qq}</p>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1768474821'/>：</label><span  style="width:600px; display: inline-block;margin-right:-600px;"><select name="provinceName" OnChange="ChangeProvince(document.getElementById('provinceName').options[document.getElementById('provinceName').selectedIndex].value);" id="provinceName">
                      		<option selected= "selected" value="${gcuser.addsheng}">${gcuser.addsheng}</option>
							<s:iterator var="data" value="provinceList">
							                      <option value="${data.b}">${data.b}</option>
							</s:iterator>
							<option value="国外">国外</option>
                    </select>
					 <select name="cityName" onChange="ChangeCity(document.getElementById('cityName').options[document.getElementById('cityName').selectedIndex].value);" id="cityName">
                      <option selected="selected" value="${gcuser.addshi}">${gcuser.addshi}</option>
                    </select>
					 <select name="areaName" onChange="ChangeArea(document.getElementById('areaName').options[document.getElementById('areaName').selectedIndex].value);" id="areaName">
                      <option selected="selected" value="${gcuser.addqu}">${gcuser.addqu}</option>
                    </select></span></p>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1875608565'/>：</label><input type="password" name="secondPassword" size="20" /></p>
							<p><label><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-386556444'/>：</label><input type="text" name="idCard" size="20" maxlength="19" /><span class="tispsfz">${gcuser.userid}</span></p>
							<p><label><s:text name='vipbdreg.jsp.bdreg.jsp.-1704827075'/>：</label><input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"><input class="btns" id="btn" type="button" onclick="sendMsg()" value="<s:text name='vipbdreg.jsp.bdreg.jsp.1753968781'/>" name="B2" /></p>
							<p style="color: red;"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-2064239147'/>！</p>
							<p><label></label><button class="but1" type="submit" value="<s:text name="vipuserga.jsp.userga.jsp.1384157160"></s:text>" name="B1" onClick="checkdate1();"><s:text name="vipuserga.jsp.userga.jsp.1384157160"></s:text></button></p>
					</form>
					</div>
					<div class="new5-right">
						<h3><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-948760164'/></h3>
						<p><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc">《积分游戏平台用户名转让申请书》</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
</script>
