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
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|话费充值（100）</title>
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
    <p class="breadcrumb-trail">消费管理 >> 话费充值（100）</p>
     <ul class="nav-secondary">
    	<%@ include file="/mainUI/common/xfgl.jsp" %>
    </ul>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 消费管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
  <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <div class="point-info">
    <p class="title">话费管理</p>
    <ul class="list">
      <%@ include file="/mainUI/common/xfgl2.jsp" %>
    </ul>
  </div>
  <!-- 账户概览 end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 话费充值（100） -->
      <div class="main-widget">
        <p class="widget-title-line">话费充值（100）</p>
        <form class="widget-form" action="?status=1" method="post" onSubmit="return checkdate1()" name="Form" id="Form">
          <p class="item">
            <label class="title">用户名：</label><span class="text widget-warning">${userName}</span>
          </p>
          <p class="item">
            <label class="title widget-warning">要充值的手机号：</label>
            <input type="text" name="call" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title">确认充值号码：</label>
            <input type="text" name="call2" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title">充值金额：</label><span class="text">100</span>
          </p>
          <p class="item">
            <label class="title">服务费(10%)：</label><span class="text">10</span></p>
          <p class="item">
            <label class="title">合计一币：</label><span class="text">110</span></p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="pa3" />
          </p>
          <p class="item">
            <label class="title">手机验证码：</label>
            <input type="text" name="smsCode" />
            <input class="widget-button-small" id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2" />
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit">确定充值</button>
          </p>
        </form>
      </div>
      <!-- 话费充值（100） end -->
    </div>
  </div>
</div>
</div>
<!-- 消费管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.call.value == "") {
    alert("请填入您的手机号码!");
    Form.call.focus();
    return false;
  }
  if (Form.call2.value == "") {
    alert("请再次填入您的手机号码!");
    Form.call2.focus();
    return false;
  }
  if (Form.call.value.length < 11) {
    alert("手机号码至少为11位数!");
    Form.call.focus();
    return false;
  }
  if (Form.call.value.length > 11) {
    alert("手机号码至多为11位数!");
    Form.call.focus();
    return false;
  }
  if (Form.call2.value.length < 11) {
    alert("手机号码至少为11位数!");
    Form.call2.focus();
    return false;
  }
  if (Form.call2.value.length > 11) {
    alert("手机号码至多为11位数!");
    Form.call2.focus();
    return false;
  }
  if (Form.call.value != Form.call2.value) {
    alert("两次输入的手机号码不同,请重新输入!");
    Form.call.focus();
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入请输入二级密码密码!");
    Form.pa3.focus();
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=9", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("手机验证码发送失败");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("手机验证码发送成功");
  });
  return false;
}

function checkdate1() {
  if (Form.smsCode.value == "") {
    alert("请先点击获取验证码，然后再填入您的手机收到的验证码");
    Form.smsCode.focus();
    return false;
  }
  return true;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');
</script>
</body>

</html>
