<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('非商户用户名，请联系管理员！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
<script type="text/javascript" src="/images/jquery.min.js"></script>
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
  	
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?toUserName="+Form.user.value, data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
		alert("手机验证码发送成功");
	});
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
	  $.post("ybsf?status=1", data, function(response) {
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
				<div class="content-box1">
					<div class="content-title">
						<span>${gcuser.name}</span>
					</div>
					<div class="content-form">				 
						<p class="f-tk c-g">消费项目：<span class="c-r">${gcuser.name}</span></p>
						<p class="z-b" style="padding-left:70px;">商户用户名：：<b class="c-r">${gcuser.username}</b></p>
						<form class="form form4 e6b" method="post" action="" id="Form" name="Form" onSubmit="return checkdate1()">
							<p><label class="c-r">商户用户名：</label>${gcuser.username}<input type="hidden" name="sh" size="20" value="${gcuser.username}" readonly></p>
							<p><label>二级密码：</label><input type="password" name="shpa" size="20"></p>
							<p><label>消费金额：</label><input style="width:100px;" type="text" name="sfpay" onKeyUp="value=value.replace(/[^\d]/g,'');rst(this.value)" size="20"></p>
                            <p><label>服务费(2%)：</label><input id="pay10" type="text" name="pay10" size="20" readonly><input type="hidden" name="remark" size="5" value="12" readonly></p>
                            <p><label>合计一币：</label><input id="ybpay" type="text" name="ybpay" size="15" readonly></p>
                            <p><label>用户名：</label><input type="text" name="user" size="20"><input type="button" onClick="Check()" value="检测一币余额" name="B3"></p>
                            <p><label>登录密码：</label><input type="password" name="pa01" size="20"></p>
                            <p><label>二级密码：</label><input type="password" name="pa02" size="20" maxlength="20"></p>
                            <p><label>手机验证码：</label><input name="sfcode" size="10"><input id="btn" type="button" onClick="checkdate()" value="获取验证码" name="B2"></p>
							<p><label></label><button class="but1" type=submit  name=submit2  onClick="return confirm('提示：您确定支付了吗？')">确定支付</button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>