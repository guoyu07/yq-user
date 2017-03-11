<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|公告详情</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> <!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->

<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">首页 >> 公告</p>
     <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
  <%--   <!-- 会员中心左边栏 -->
<div class="member-aside">
        <%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main"> --%>
        <div class="member-main-full">
      <!-- 公告详情 -->
      <div class="main-widget">
        <p class="widget-title-line">${dgag.ggbt}</p>
        <div class="widget-article">
         ${dgag.ggny}
        </div>
        <p class="button-line mt15 tc"><a href="javascript:history.go(-1);" class="widget-button">返回公告</a></p>
      </div>
      <!-- 公告详情 end -->
    </div>
  </div>
</div>
