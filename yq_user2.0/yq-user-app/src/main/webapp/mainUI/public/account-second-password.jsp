<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>会员中心|二级密码找回</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> 
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->

<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">账户管理 >> 二级密码找回</p>
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- 二级密码找回 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">二级密码找回</p>
        <form class="widget-form" action="" name="Form" id="Form" onSubmit="return false" method="post">
          <p class="item mt15">
            <label class="title">用户名：</label>
            <input type="text" name="toUserName" value="${gcuser.username}" readonly/>
          </p>
          <p class="item">
            <label class="title">新二级密码：</label>
            <input type="password" name="newSecondPassword1" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"/>
          </p>
          <p class="item">
            <label class="title">确认二级密码：</label>
            <input type="password" name="newSecondPassword2" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"/>
          </p>
          <p class="item">
            <label class="title">联系手机：</label>
            <span class="text">${gcuser.call}</span>
          </p>
          <p class="item">
            <label class="title">输入手机号：</label>
            <input type="text" id="inputCall" name="inputCall" tabindex="18"/>
          </p>
          <p class="item">
            <label class="title">手机验证码：</label>
            <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')">
            <input class="widget-button-small" name="B2" id="btn" type="button" onclick="checkdate('#SESSION_LOCALE')" value="获取验证码"/>
          </p>
          <p class="button-line mt15">
            <button type="submit" name="B1" class="widget-button" onClick="checkdate1();">更新</button>
          </p>
        </form>
      </div>
      <!-- 二级密码找回 end -->
    </div>
  </div>
</div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function CheckIfEnglish(str) {
  if (/[a-z]/.test(str) && /[0-9]/.test(str)) {
    return true;
  } else {
    return false;
  }
}

function checkdate(s) {

  var languege = s;
  if (Form.newSecondPassword1.value == "") {
    alert("请填入您的新二级密码！");
    Form.newPassWord1.focus();
    return false;
  }
  if (!CheckIfEnglish(Form.newSecondPassword1.value)) {
    alert("您的新二级密码不符合规范，必须小写英文字母+数字！");
    Form.newPassWord1.focus();
    return false;
  }
  if (Form.newSecondPassword1.value.length > 18 || Form.newSecondPassword1.value.length < 6) {
    alert("提示：您的二级密码最少6位数，最大18位数！");
    Form.newPassWord1.focus();
    return false;
  }
  if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {
    alert("两次输入新二级密码不同！");
    Form.newPassWord1.focus();
    return false;
  }
  if (Form.inputCall.value == "") {
    alert("请填入您的手机号码！");
    Form.inputCall.focus();
    return false;
  }
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms2?op=18&status=8", data, function(response) {
    if (response.erroCodeNum == 2) {
      alert('输入的手机号与预留手机号不一致！');
      $("#btn").attr("disabled", false);
      Form.inputCall.focus();
      return false;

    }
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("手机验证码发送失败");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("手机验证码发送成功");
  });
  return true;
}

function checkNumber() {
  if (Form.inputCall.value == "") {
    alert("请填入您的手机号码！");
    Form.inputCall.focus();
    return false;
  }
  var data = $("#Form").serialize();
  $.post("/checkUserParam?status=8", data, function(response) {
    if (response.erroCodeNum == 1) {
      alert('用户名不存在，请检查是否正确！');
      return false;
    }
    if (response.erroCodeNum == 2) {
      alert('输入的手机号与预留手机号不一致！');
      Form.inputCall.focus();
      return false;
    }
  });

}

function checkdate1() {
	if (Form.name.value == "") {
	    alert("请输入姓名！");
	    Form.name.focus();
	    return false;
	  }
	  if (Form.newSecondPassword1.value == "") {
	    alert("请填入您的新二级密码！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (!CheckIfEnglish(Form.newSecondPassword1.value)) {
	    alert("您的新二级密码不符合规范，必须小写英文字母+数字！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (Form.newSecondPassword1.value.length > 18 || Form.newSecondPassword1.value.length < 6) {
	    alert("提示：您的二级密码最少6位数，最大18位数！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {
	    alert("两次输入新二级密码不同！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (Form.inputCall.value == "") {
	    alert("请填入您的手机号码！");
	    Form.inputCall.focus();
	    return false;
	  }
  if (Form.smsCode.value == "") {
    alert("请先点击获取验证码，然后再填入您的手机收到的验证码");
    Form.smsCode.focus();
    return false;
  }
  var data = $("#Form").serialize();

  $.post("/reSetSecondPass?status=7", data, function(response) {
    if (response.erroCodeNum == 0) { //重置成功
       delCookie("secondsremained");
      alert('重置成功，请重新登录！');
      location.replace('../index.jsp?id=' + Form.toUserName.value);
    } else if (response.erroCodeNum == 1) {
      alert('用户不存在');
      return;
    } else if (response.erroCodeNum == 2) {
      alert('验证码有误!');
      return;
    } else if (response.erroCodeNum == 3) {
      alert("有值为空!");
      return;
    } else if (response.erroCodeNum == 4) {
      alert("两次输入的密码不一致!");
      return;
    }else if(response.erroCodeNum == 5){
    	alert("自己只能给自己修改!");
        return;
    } else {
      alert('发生了错误.[' + response.erroCodeNum + ']');
      return;
    }
  });
  return true;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"),'#SESSION_LOCALE');
</script>
</body>

</html>
