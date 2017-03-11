<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|金币卡重置密码</title>
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
      <p class="breadcrumb-trail">财富中心 >> 金币管理</p>
      <ul class="nav-secondary">
       <%@ include file="/mainUI/common/scendhead.jsp" %>
      </ul>
    </div>
  </div>
  <!-- 会员中心导航模块 end -->
  <!-- 积分理财内容 -->
  <div class="container">
    <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
      <div class="dialog-widget">
        <p class="dialog-title">金币卡重置密码</p>
        <div class="dialog-wrap-border main-widget">
          <div class="widget-article">
            <p class="widget-notice">你好，你上次已查看过该消费编号<b class="widget-warning">${id}</b>的登录密码</p>
            <p class="widget-notice mt10">如果已经把密码给到客户手上，请不要随便重置密码。</p>
            <p class="widget-notice mt10">客户真的忘记了密码，我决定再次<a href="czpa?id=${id}&secondThisState=${secondThisState}&thisState=${thisState}" class="widget-button-small">重置密码</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
