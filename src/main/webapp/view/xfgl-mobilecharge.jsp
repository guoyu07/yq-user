<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，今天的名额已用完，请于明天再试，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，测试期间同一姓名及证件号30天内仅提供一次充值!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，一币不足110，暂时不能充值，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您好，您输入的二级密码不正确，请重新输入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您好，您输入的手机验证码不正确，请重新输入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('充值话费失败！稍后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('手机话费-"${call}"-正在入账，请您耐心等待！');location.replace('datepay');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	
	<script language="JavaScript">
	 function checkdate()  {
	  if (Form.call.value=="") {      alert("请填入您的手机号码!");  Form.call.focus();      return false;    }
	  if (Form.call2.value=="") {      alert("请再次填入您的手机号码!");  Form.call2.focus();      return false;    }
	  if (Form.call.value.length<11) {      alert("手机号码至少为11位数!"); Form.call.focus();     return false;    }
	  if (Form.call.value.length>11) {      alert("手机号码至多为11位数!"); Form.call.focus();     return false;    }
	  if (Form.call2.value.length<11) {      alert("手机号码至少为11位数!"); Form.call2.focus();     return false;    }
	  if (Form.call2.value.length>11) {      alert("手机号码至多为11位数!"); Form.call2.focus();     return false;    }
	  if (Form.call.value != Form.call2.value) {      alert("两次输入的手机号码不同,请重新输入!"); Form.call.focus();    return false;    }
	  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");    Form.pa3.focus();  return false;    }
	  
	  $("#btn").attr("disabled","disabled");
		var data = $("#Form").serialize();
		$.post("/sms?op=9", data, function(response) {
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
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/xfgl.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>话费充值</span>
					</div>
					<div class="content-form">
						<form class="form form3" style="height:463px;" action="?status=1" method="post" onSubmit="return checkdate1()" name="Form" id="Form">
							<p><label class="c-r">用户名：</label>${userName}</p>
							<p><label class="c-r">要充值的手机号：</label><input type="text" name="call"  size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')" /></p>
							<p><label>确认充值号码：</label><input type="text"  name="call2"  size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')" /></p>
							<p><label>充值金额：</label>100</p>
							<p><label>服务费(10%)：</label>10</p>
							<p><label>合计一币：</label>110</p>
							<p><label>二级密码：</label><input type="password" name="pa3"></p>
							<p><label>手机验证码：</label><input type="text" name="smsCode"><input id="btn" type="button" onClick="checkdate()" value="获取验证码" name="B2"></p>
							<p><label></label><button class="but1" type="submit">确定充值</button></p>
					</form>
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