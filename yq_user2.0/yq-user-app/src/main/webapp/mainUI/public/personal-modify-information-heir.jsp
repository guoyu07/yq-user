<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|继承人资料</title>
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
      <!-- 公司相关资料 -->
      <div class="main-widget">
        <p class="widget-title-line">公司相关资料</p>
        <div class="widget-article">
          <p class="widget-notice"><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc">《平台用户名转让申请书》</a></p>
        </div>
      </div>
      <!-- 公司相关资料 end -->
      <!-- 继承人资料 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">继承人资料</p>
        <p class="small-button-line"><a href="userga" class="widget-button-small">修改个人资料</a></p>
        <form class="widget-form" method="post" action="" name="Form" id="Form" onSubmit="return false">
          <p class="widget-notice widget-warning mt15">继承人一经填写将不能自行修改，请谨慎填写！</p>
          <p class="item mt15">
            <label class="title">继承人姓名：</label>
            <input type="text" maxlength="32" name="jcname" value="${gcuser.jcname}" <c:if test="${not empty gcuser.jcname}">readonly</c:if> />
          </p>
          <p class="item">
            <label class="title">继承人身份证号码：</label>
            <input type="text" maxlength="19" name="jcuserid" value="${gcuser.jcuserid}" <c:if test="${not empty gcuser.jcuserid}">readonly</c:if>/>
          </p>
          <p class="button-line mt15">
            <button type="submit" class="widget-button" onClick="checkdate();">确定增加</button>
          </p>
        </form>
      </div>
      <!-- 继承人资料 end -->
    </div>
  </div>
</div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {

  if (Form.jcname.value == "") {
    alert("请填入继承人姓名!");
    Form.jcname.focus();
    return false;
  }
  if (Form.jcname.value.length < 2) {
    alert("继承人姓名至少为2个汉字!");
    Form.jcname.focus();
    return false;
  }
  if (Form.jcname.value.length > 8) {
    alert("继承人姓名至多为4个汉字!");
    Form.jcname.focus();
    return false;
  }
  if (Form.jcuserid.value == "") {
    alert("请填入继承人的身份证号码!");
    Form.jcuserid.focus();
    return false;
  }
  if (Form.jcuserid.value.length < 18) {
    alert("继承人身份证号码至少为18位数!");
    Form.jcuserid.focus();
    return false;
  }
  if (Form.jcuserid.value.length > 18) {
    alert("继承人身份证号码至多为18位数!");
    Form.jcuserid.focus();
    return false;
  }

  var data = $("#Form").serialize();
  $.post("updateuserjc?status=1", data, function(response) {
    if (response.erroCodeNum == 0) { //注册成功
      alert('继承人添加成功！');
      return false;
    } else if (response.erroCodeNum == 1) {
      alert('已经填写过，不能修改');
      return false;
    } else {
      alert('发生了错误.[' + response.erroCodeNum + ']');
      return false;
    }
  });
  return true;
}
</script>
<script>
function openwindow2(url) {
  window.open(url, 'new', 'toolbar=no,scrollbars=yes,width=800,height=850');
}
</script>
</body>

</html>
