<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您的一币余额不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('手机验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('参数不完整！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('报名成功！');location.replace('baby');</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|未来领袖青少年口才训练营</title>
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
    <p class="title">消费管理</p>
    <ul class="list">
    <%@ include file="/mainUI/common/xfgl2.jsp" %>
    </ul>
  </div>
  <!-- 账户概览 end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 未来领袖青少年口才训练营报名须知 -->
      <div class="main-widget">
        <p class="widget-title-line">未来领袖青少年口才训练营报名须知</p>
        <div class="widget-article">
          <p class="widget-notice">报名参加本训练营需要消费<b class="widget-warning">23800</b> 一币</p>
        </div>
      </div>
      <!-- 未来领袖青少年口才训练营报名须知 end -->
      <!-- 未来领袖青少年口才训练营报名 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">未来领袖青少年口才训练营报名表</p>
        <form class="widget-form" action="?st=1" method="post" onsubmit="return checkdate1()" name="Form" id="Form">
          <p class="item">
            <label class="title">用户名：</label>william123</p>
          <p class="item">
            <label class="title">宝宝姓名：</label>
            <input type="text" name="babyName" value="">
          </p>
          <p class="item">
            <label class="title">宝宝年龄：</label>
            <input type="text" name="babyAge" value="" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title">宝宝性别：</label>
            <select class="widget-select" name="babySex">
             <option value="男" <c:if test="${babySex=='男'}">selected</c:if>>男</option><option value="女" <c:if test="${babySex=='女'}">selected</c:if> >女</option>
            </select>
          </p>
          <p class="item">
            <label class="title">爸爸姓名：</label>
            <input type="text" name="dadyName" value="">
          </p>
          <p class="item">
            <label class="title">爸爸年龄：</label>
            <input type="text" name="dadyAge" value="" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title">联系方式：</label>
            <input type="text" name="dadyCall" value="">
          </p>
          <p class="item">
            <label class="title">妈妈姓名：</label>
            <input type="text" name="momName" value="">
          </p>
          <p class="item">
            <label class="title">妈妈年龄：</label>
            <input type="text" name="momAge" value="" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title">联系方式：</label>
            <input type="text" name="momCall" value="">
          </p>
          <p class="item">
            <label class="title">地址：</label>
            <input type="text" name="address" value="">
          </p>
          <p class="item-textarea">
            <label class="title">宝宝描述：</label>
            <textarea rows="5" name="details" cols="30" value="">100字以内</textarea>
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="pa3">
          </p>
          <p class="item">
            <label class="title">手机验证码：</label>
            <input type="text" name="smsCode">
            <input class="widget-button-small" id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2">
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit">确定</button>
          </p>
        </form>
      </div>
      <!-- 未来领袖青少年口才训练营报名 end -->
    </div>
  </div>
</div>
</div>
<!-- 消费管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.babyName.value == "") {
    alert("请填入宝宝姓名!");
    Form.babyName.focus();
    return false;
  }
  if (Form.babyAge.value == "") {
    alert("请填入宝宝年龄!");
    Form.babyAge.focus();
    return false;
  }
  if (Form.dadyName.value == "") {
    alert("请填入爸爸姓名!");
    Form.dadyName.focus();
    return false;
  }
  if (Form.dadyAge.value == "") {
    alert("请填入爸爸年龄!");
    Form.dadyAge.focus();
    return false;
  }
  if (Form.dadyCall.value == "") {
    alert("请填入爸爸联系方式!");
    Form.dadyCall.focus();
    return false;
  }
  if (Form.momName.value == "") {
    alert("请填入妈妈姓名!");
    Form.momName.focus();
    return false;
  }
  if (Form.momAge.value == "") {
    alert("请填入妈妈年龄!");
    Form.momAge.focus();
    return false;
  }
  if (Form.momCall.value == "") {
    alert("请填入妈妈联系方式!");
    Form.momCall.focus();
    return false;
  }
  if (Form.address.value == "") {
    alert("请填入详细的地址!");
    Form.address.focus();
    return false;
  }
  if (Form.details.value == "") {
    alert("请填入宝宝的描述!");
    Form.details.focus();
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码密码!");
    Form.pa3.focus();
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=12", data, function(response) {
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
