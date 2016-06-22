<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您的一币余额不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('手机验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('参数不完整！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('报名成功！');location.replace('baby');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	
	<script language="JavaScript">
	 function checkdate()  {
	  if (Form.babyName.value=="") {      alert("请填入宝宝姓名!");  Form.babyName.focus();      return false;    }
	  if (Form.babyAge.value=="") {      alert("请填入宝宝年龄!");  Form.babyAge.focus();      return false;    }
	  if (Form.dadyName.value=="") {      alert("请填入爸爸姓名!");  Form.dadyName.focus();      return false;    }
	  if (Form.dadyAge.value=="") {      alert("请填入爸爸年龄!");  Form.dadyAge.focus();      return false;    }
	  if (Form.dadyCall.value=="") {      alert("请填入爸爸联系方式!");  Form.dadyCall.focus();      return false;    }
	  if (Form.momName.value=="") {      alert("请填入妈妈姓名!");  Form.momName.focus();      return false;    }
	  if (Form.momAge.value=="") {      alert("请填入妈妈年龄!");  Form.momAge.focus();      return false;    }
	  if (Form.momCall.value=="") {      alert("请填入妈妈联系方式!");  Form.momCall.focus();      return false;    }
	  if (Form.address.value=="") {      alert("请填入详细的地址!");  Form.address.focus();      return false;    }
	  if (Form.details.value=="") {      alert("请填入宝宝的描述!");  Form.details.focus();      return false;    }
	  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");    Form.pa3.focus();  return false;    }
	  
	  $("#btn").attr("disabled","disabled");
		var data = $("#Form").serialize();
		$.post("/sms?op=12", data, function(response) {
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
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/xfgl.jsp"%>
			</div>
			<div class="z-l" >
				<div class="content-box1" >
					<div class="content-title">
						<span>未来领袖青少年口才训练营报名（需要消费23800一币）</span>
					</div>
					<div class="content-txt">
						<form class="form form3" style="height:463px;" action="?st=1" method="post" onSubmit="return checkdate1()" name="Form" id="Form">
							<p><label>用户名：</label>${userName}</p>
							<p><label>宝宝姓名：</label><input type="text" name="babyName" value="${babyName}"></p>
							<p><label>宝宝年龄：</label><input type="text"  name="babyAge" value="${babyAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label>宝宝性别：</label><select name="babySex"><option value="男" <c:if test="${babySex=='男'}">selected</c:if>>男</option><option value="女" <c:if test="${babySex=='女'}">selected</c:if> >女</option></select></p>
							<p><label>爸爸姓名：</label><input type="text" name="dadyName" value="${dadyName}"></p>
							<p><label>爸爸年龄：</label><input type="text"  name="dadyAge" value="${dadyAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label>联系方式：</label><input type="text"  name="dadyCall" value="${dadyCall}" /></p>
							<p><label>妈妈姓名：</label><input type="text" name="momName" value="${momName}"></p>
							<p><label>妈妈年龄：</label><input type="text"  name="momAge"  value="${momAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label>联系方式：</label><input type="text"  name="momCall"  value="${momCall}" /></p>
							<p><label>地址：</label><input type="text" name="address" value="${address}"></p>
							<p><label>宝宝描述：</label><textarea rows="5" name="details" cols="30" value="${details}"></textarea>100字以内</p>
							<p><label>二级密码：</label><input type="password" name="pa3"></p>
							<p><label>手机验证码：</label><input type="text" name="smsCode"><input id="btn" type="button" onClick="checkdate()" value="获取验证码" name="B2"></p>
							<p><label></label><button class="but1" type="submit">确定</button></p>
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