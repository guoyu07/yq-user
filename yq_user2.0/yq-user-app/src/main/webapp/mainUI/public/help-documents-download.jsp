<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|公司相关资料下载</title>
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
    <p class="breadcrumb-trail">帮助支持 >> 相关资料下载</p>
    <%@ include file="/mainUI/common/help.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 帮助支持内容内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- 公司相关资料 -->
      <div class="main-widget">
        <p class="widget-title-line">公司相关资料下载</p>
        <div class="widget-article">
          <p class="widget-notice"><a target="_blank" href="download/用户转让申请书.doc">《用户转让申请书》</a></p>
          <p class="widget-notice mt15"><a target="_blank" href="download/开通卖出申请书.docx">《开通卖出申请书》</a></p>
        </div>
      </div>
      <!-- 公司相关资料 end -->
    </div>
  </div>
</div>
<!-- 帮助支持内容内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
