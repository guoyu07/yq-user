<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|快速激活金币卡</title>
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
        <p class="dialog-title">快速激活金币卡</p>
        <!-- 图纸为一页13条数据 -->
        <div class="dialog-wrap-border main-widget">
          <form class="widget-form">
            <p class="item">
              <lable class="title">消费编号：</lable>
              <span class="text widget-warning">${id}</span>
            </p>
            <p class="item">
              <lable class="title">登录密码：</lable>
              <span class="text widget-warning">${pdpa}</span>
            </p>
            <p class="item">
              <lable class="title">防伪编号：</lable>
              <span class="text widget-warning">${fwid}</span>
            </p>
            <p class="item">
              <lable class="title">金币面值：</lable>
              <span class="text widget-warning">${ejbk.bf2}0</span>
            </p>
            <p class="button-line mt15">
              <a href="activedGoldCard?pdid=${id}&pdpa=${pdpa}&fwid=${fwid}&status=1&secondThisState=${secondThisState}&thisState=${thisState}"  class="widget-button">快速激活</a>
            </p>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
