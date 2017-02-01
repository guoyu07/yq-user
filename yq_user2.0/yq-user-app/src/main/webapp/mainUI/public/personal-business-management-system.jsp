<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('非商户用户名，请联系管理员！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|商务管理系统</title>
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
    <p class="breadcrumb-trail">账户管理 >> 同名账户管理</p>
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
   <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <%@ include file="/mainUI/common/persionalinfo.jsp" %>
  <!-- 账户概览  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 商务管理系统 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">${gcuser.name}</p>
        <form class="widget-form" method="post" action="" id="Form" name="Form" onSubmit="return checkdate1()">
          <p class="item">
            <label class="title">消费项目：</label><span class="text widget-warning">${gcuser.name}</span>
<!--             <input type="hidden" name="userName" value="${gcuser.username}" readonly>
 -->          </p>
          <p class="item">
            <label class="title">商户用户名：</label><span class="text widget-warning">${gcuser.username}<input type="hidden" name="sh" value="william123" readonly/></span>
            <input type="hidden" name="userName" value="${gcuser.username}" readonly>
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="shpa">
          </p>
          <p class="item">
            <label class="title">消费金额：</label>
            <input type="text" name="sfpay" onKeyUp="value=value.replace(/[^\d]/g,'');rst(this.value)"/>
          </p>
          <p class="item">
            <label class="title">服务费(2%)：</label>
            <input id="pay10" type="text" name="pay10" readonly>
            <input type="hidden" name="remark" value="12" readonly>
          </p>
          <p class="item">
            <label class="title">合计一币：</label>
            <input id="ybpay" type="text" name="ybpay" readonly>
          </p>
          <p class="item">
            <label class="title">用户名：</label>
            <input type="text" name="user">
            <input type="button" class="widget-button-small" onClick="Check()" value="检测一币余额" name="B3" style="cursor: pointer">
          </p>
          <p class="item">
            <label class="title">登录密码：</label>
            <input type="password" name="pa01">
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="pa02" maxlength="20">
          </p>
          <p class="item">
            <label class="title">手机验证码：</label>
            <input name="sfcode">
            <input id="btn" type="button" class="widget-button-small" onClick="checkdate()" value="获取验证码" name="B2" style="cursor: pointer">
          </p>
          <p class="button-line mt15">
            <button type="submit" class="widget-button" name="submit2" onClick="return confirm('提示：您确定支付了吗？')">确定支付</button>
          </p>
        </form>
      </div>
      <!-- 商务管理系统 end -->
    </div>
  </div>
</div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="javascript" src="/scripts/myarea.js"></script>
<script src="/scripts/areacode.js"></script>
<script language="JavaScript">
function rst(n) {
  if (n != "") {
    document.getElementById('pay10').value = (n * 0.02).toFixed(0);
    document.getElementById('ybpay').value = (n * 1.02).toFixed(0);
  } else {
    document.getElementById('pay10').value = "";
    document.getElementById('ybpay').value = "";
  }
}


function Check() {
  if (Form.user.value == "") {
    alert("提示：用户名不能为空!！");
    Form.user.focus();
    return false;
  }
  var uName = document.Form.user.value;
  var data = null;
  $.post("yb?username=" + uName, data, function(response) {
    if (response.erroCodeNum == 0) { //注册成功
      alert('用户名：'+uName+'，一币余额为：' + response.yb);
    } else {
      alert('用户名：'+uName+'，不存在，请重新写入！');
    }
    return true;
  });
}

function checkdate() {
  if (Form.shpa.value == "") {
    alert("请填入商户二级密码!");
    Form.shpa.focus();
    return false;
  }
  if (Form.sfpay.value == "") {
    alert("请填入消费金额!");
    Form.sfpay.focus();
    return false;
  }
  if (Form.user.value == "") {
    alert("请填入您的用户名!");
    Form.user.focus();
    return false;
  }
  if (Form.pa01.value == "") {
    alert("请填入您的登录密码!");
    Form.pa01.focus();
    return false;
  }
  if (Form.pa02.value == "") {
    alert("请填入您的二级密码!");
    Form.pa02.focus();
    return false;
  }
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=11&toUserName=" + Form.user.value, data, function(response) {
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
  if (Form.shpa.value == "") {
    alert("请填入商户二级密码!");
    Form.shpa.focus();
    return false;
  }
  if (Form.sfpay.value == "") {
    alert("请填入消费金额!");
    Form.sfpay.focus();
    return false;
  }
  if (Form.user.value == "") {
    alert("请填入您的用户名!");
    Form.user.focus();
    return false;
  }
  if (Form.pa01.value == "") {
    alert("请填入您的登录密码!");
    Form.pa01.focus();
    return false;
  }
  if (Form.pa02.value == "") {
    alert("请填入您的二级密码!");
    Form.pa02.focus();
    return false;
  }
  //if (Form.sfcode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.sfcode.focus();   return false;    }
  var data = $("#Form").serialize();
  $.post("ybsf?status=1", data, function(response) {
    var responseMsg = response;
    if (responseMsg.erroCodeNum == 0) { //注册成功
      alert('支付操作成功！');
      location.replace('ybsf');
      return false;
    } else if (responseMsg.erroCodeNum == 1) {
      alert('非商户用户名，请联系管理员！');
      return false;
    } else if (responseMsg.erroCodeNum == 2) {
      alert('输入的商户二级密码不正确，请检查输入是否正确！');
      return false;
    } else if (responseMsg.erroCodeNum == 3) {
      alert('订单信息有误，请重新提交！');
      return false;
    } else if (responseMsg.erroCodeNum == 4) {
      alert('输入的用户名不存在，请检查输入是否正确！');
      return false;
    } else if (responseMsg.erroCodeNum == 5) {
      alert('输入的登录密码不正确，请检查输入是否正确！');
      return false;
    } else if (responseMsg.erroCodeNum == 6) {
      alert('输入的二级密码不正确，请检查输入是否正确！');
      return false;
    } else if (responseMsg.erroCodeNum == 7) {
      alert('您的一币余额不足，请检查输入是否正确！');
      return false;
    } else if (responseMsg.erroCodeNum == 8) {
      alert('您好，手机验证码不正确，请重新输入！');
      return false;
    }
  });
  return false;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');
</script>
</body>

</html>
