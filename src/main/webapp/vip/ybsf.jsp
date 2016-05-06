<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script src="/scripts/sms.js"></script>
<script>
function rst(n){
if(n!=""){
document.getElementById('pay10').value=(n*0.02).toFixed(0);
document.getElementById('ybpay').value=(n*1.02).toFixed(0);
}else{
document.getElementById('pay10').value="";
document.getElementById('ybpay').value="";
}
}


function Check()
{
	if ( Form.user.value==""){
		alert ("提示：用户名不能为空!！");
		Form.user.focus();
		return false;
	}
	var uName=document.Form.user.value;
	var data= null;
	$.post("yb?username="+uName,data, function(response) {
		if(response.erroCodeNum==0){//注册成功
			alert('用户名：'+uName+'，一币余额为：'+response.yb);
		}else{
			alert('用户名：'+uName+'，不存在，请重新写入！');
		}
		return true;
	});
}

function checkdate()  {
  	
	//$("#btn").attr("disabled","disabled");
	//var data = $("#Form").serialize();
	//$.post("sms.asp", data, function(data) {
	//	$("#btn").removeAttr("disabled");
	//	if (data != "success") { alert("手机验证码发送失败"); return false; }
	//	alert("手机验证码发送成功");
	//});
	return false;
}  

function checkdate1()  {  
	  if (Form.shpa.value=="") {      alert("请填入商户二级密码!");  Form.shpa.focus();      return false;    }
	  if (Form.sfpay.value=="") {     alert("请填入消费金额!");  Form.sfpay.focus();      return false;    }
	  if (Form.user.value=="") {     alert("请填入您的用户名!");  Form.user.focus();      return false;    }
	  if (Form.pa01.value=="") {      alert("请填入您的登录密码!");  Form.pa01.focus();      return false;    }
	  if (Form.pa02.value=="") {      alert("请填入您的二级密码!");  Form.pa02.focus();      return false;    }
  //if (Form.sfcode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.sfcode.focus();   return false;    }
  	  var data = $("#Form").serialize();
  	  alert(data);
	  $.post("ybsf?status=1", data, function(response) {
			alert(response);		     
		    var responseMsg = response;
			if(responseMsg.erroCodeNum==0){//注册成功
				alert('支付操作成功！');
				location.replace('ybsf');
				return false;
			}else if(responseMsg.erroCodeNum==1){
				alert('非商户用户名，请联系管理员！');
				return false;
			}else if(responseMsg.erroCodeNum==2){
				alert('输入的商户二级密码不正确，请检查输入是否正确！');
				return false;
			}else if(responseMsg.erroCodeNum==3){
				alert('订单信息有误，请重新提交！');
				return false;
			}else if(responseMsg.erroCodeNum==4){
				alert('输入的用户名不存在，请检查输入是否正确！');
				return false;
			}else if(responseMsg.erroCodeNum==5){
				alert('输入的登录密码不正确，请检查输入是否正确！');
				return false;
			}else if(responseMsg.erroCodeNum==6){
				alert('输入的二级密码不正确，请检查输入是否正确！');
				return false;
			}else if(responseMsg.erroCodeNum==7){
				alert('您的一币余额不足，请检查输入是否正确！');
				return false;
			}else if(responseMsg.erroCodeNum==8){
				alert('您好，手机验证码不正确，请重新输入！');
				return false;
			}
		});
  return false;
} 
</script>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="post" action="" id="Form" name="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	　<p><font size="6" color="#FF0000">${gcuser.name}</font></p>
	<table border="0" id="table1" height="326" width="560">
		<tr>
			<td width="214" align="right" height="25">消费项目：</td>
			<td width="336" align="left"><font color="#0000FF"><b>${gcuser.name}</b></font></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25">商户用户名：</td>
			<td width="336" align="left" height="18"><font color="#008000"><b>${gcuser.username}</b></font><input type="hidden" name="sh" size="20" value="${gcuser.username}" readonly></td>
			</tr>
		<tr>
			<td width="214" align="right" height="25">二级密码：</td>
			<td width="336" align="left" height="23"><font color="#008000"><input type="password" name="shpa" size="20"></font></td>
			</tr>
		<tr>
			<td width="214" align="right" height="25">消费金额：</td>
			<td width="336" align="left"><input type="text" name="sfpay" onKeyUp="value=value.replace(/[^\d]/g,'');rst(this.value)" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25">服务费(2%)：</td>
			<td width="336" align="left"><input id="pay10" type="text" name="pay10" size="20" style="color: #0000FF" readonly><input type="hidden" name="remark" size="5" value="12" readonly></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25">合计一币：</td>
			<td width="336" align="left"><b><font color="#FF0000"><input id="ybpay" type="text" name="ybpay" size="15" style="font-family: 宋体; color: #FF0000; font-weight: bold" readonly></font></b></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25">用户名：</td>
			<td width="336" align="left" height="25"><b><font color="#0000FF"><input type="text" name="user" size="20"><input type="button" onClick="Check()" value="检测一币余额" name="B3"></font></b></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25">登录密码：</td>
			<td width="336" align="left" height="25"><input type="password" name="pa01" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25">二级密码：</td>
			<td width="336" align="left" height="25"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa02" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right">手机验证码：</td>
			<td width="333" align="left"><input name="sfcode" size="10"><input id="btn" type="button" onClick="checkdate()" value="获取验证码" name="B2"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="57"><p align="center">　</td>
			<td width="336" align="right" height="57"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定支付" name="B1" onClick="return confirm('提示：您确定支付了吗？')" style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p>请不要使用它人账户进行操作，一经发现3倍罚款！</p>
	</div>
</form>