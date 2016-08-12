<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
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

  if (Form.name.value=="") {      alert("请输入姓名！");Form.name.focus();      return false;    }
  if(Form.newPassWord1.value != "" || Form.newPassWord2.value != ""){
	  if (Form.newPassWord1.value != Form.newPassWord2.value) {      alert("两次输入新登录密码不同！"); Form.newPassWord1.focus();     return false;    }
	  if (!CheckIfEnglish(Form.newPassWord1.value)) {      alert("您的新登录密码不符合规范，必须小写英文字母+数字！");  Form.newPassWord1.focus();      return false;    } 
	  if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {  alert("提示：您的登录密码最少6位数，最大18位数！");  Form.newPassWord1.focus();  return false;  } 
  }
  if(Form.newSecondPassword1.value != "" || Form.newSecondPassword2.value != ""){
	  if (!CheckIfEnglish(Form.newSecondPassword1.value)) {		alert("您的二级密码不符合规范，必须小写英文字母+数字！");Form.newSecondPassword1.focus();return false;}
	  if (Form.newSecondPassword1.value.length < 10) {		alert("二级密码至少为10位数!");Form.newSecondPassword1.focus();return false;}
	  if (Form.newSecondPassword1.value.length > 20) {		alert("二级密码至多为20位数!");Form.newSecondPassword1.focus();return false;}
	  if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {      alert("两次输入新二级密码不同！"); Form.newPassWord1.focus();     return false;    } 
  }
  if (Form.secondPassword.value=="") {      alert("请填入您的二级密码！");  Form.secondPassword.focus();      return false;    }
  if (Form.idCard.value=="") {      alert("请填入您的身份证号码！");  Form.idCard.focus();      return false;    }
  if (Form.provinceName.value==0) {      alert("请选择省份!");      return false;    } 
  if (Form.cityName.value==0) {      alert("请选择城市!");      return false;    }
  if (Form.areaName.value==0) {      alert("请选择地区!");      return false;    } 
  if (Form.bank.value=="") {      alert("请选择收款银行！");  Form.bank.focus();      return false;    } 
  if (Form.card.value=="") {      alert("请填入您的收款账号！");  Form.card.focus();      return false;    } 
  
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
		if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
		settime($("#btn"));
		alert("手机验证码发送成功");
	});
}
function checkdate1()  {  
  if (Form.smsCode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.smsCode.focus();   return false;    }
  if(!checkdate()){
	  return;
  }
  var data = $("#Form").serialize();
  $.post("userga?status=2", data, function(response) {
		if(response.erroCodeNum==0){//更新成功
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
		}else if(response.erroCodeNum==5){
			alert('两次输入新登录密码不同！');
			return;
		}else if(response.erroCodeNum==6){
			alert('两次输入新二级密码不同！');
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
	ChangeCity(0)	
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
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1 new5-box">
					<div class="content-title">
						<span>修改个人资料</span>
						<p class="r-link">
							<a href="#" class="hover">个人资料</a>|
							<a href="updateuserjc">继承人资料</a>
						</p>
					</div>
					<div class="content-form new6-box">				 
						<form class="form" method="post" action="" name="Form" id="Form" onSubmit="return false">
							<input type="hidden" name="remark" size="5" value="2" readonly>
							<input type="hidden" name="targetdate" size="8">
							<input type="hidden" name="xmlmode" size="8">
							<p><label>用户名：</label>${gcuser.username}<input type="hidden" name="userName" size="20" value="${gcuser.username}" readonly></p>
							<p><label style="color: red">新登录密码：</label><input type="password" name="newPassWord1" size="20" maxlength="18" value="null" onKeyUp="value=value.replace(/[\W]/g,'')"></p>
							<p><label style="color: red">确认登录密码：</label><input type="password" name="newPassWord2" size="20" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"></p>
							<p><label style="color: red">新二级密码：</label><input type="password" name="newSecondPassword1" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"></p>
							<p><label style="color: red">确认二级密码：</label><input type="password" name="newSecondPassword2" size="20" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="20"></p>
							<p><label>姓名：</label>${gcuser.name}</p>
							<p><label>收款银行：</label><select size="1" name="bank">
							<option selected value="${gcuser.bank}">${gcuser.bank}</option>			
							<option value="工商银行">工商银行</option>
							<option value="农业银行">农业银行</option>
							<option value="建设银行">建设银行</option>
							<option value="中国银行">中国银行</option>
							</select></p>
							<p><label>收款账号：</label><input type="text" name="card" onKeyUp="value=value.replace(/[^\d]/g,'')" size="20" maxlength="19" value="${gcuser.card}" /></p>
							<p><label>联系手机：</label>${gcuser.call}</p>
							<p><label>联系QQ：</label>${gcuser.qq}</p>
							<p><label>开户行地址：</label><span  style="width:600px; display: inline-block;margin-right:-600px;"><select name="provinceName" OnChange="ChangeProvince(document.getElementById('provinceName').options[document.getElementById('provinceName').selectedIndex].value);" id="provinceName">
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
                    </select></span></p>
							<p><label>验证二级密码：</label><input type="password" name="secondPassword" size="20" /></p>
							<p><label>验证身份证号码：</label><input type="text" name="idCard" size="20" maxlength="19" /><span class="tispsfz">${gcuser.userid}</span></p>
							<p><label>手机验证码：</label><input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"><input class="btns" id="btn" type="button" onclick="sendMsg()" value="获取验证码" name="B2" /></p>
							<p style="color: red;">只需修改一个用户名，其它同名账户统一更新！</p>
							<p><label></label><button class="but1" type="submit" value="提交修改" name="B1" onClick="checkdate1();">提 交 修 改</button></p>
					</form>
					</div>
					<div class="new5-right">
						<h3>公司相关资料</h3>
						<p><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc">《积分游戏平台用户名转让申请书》</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"));
</script>