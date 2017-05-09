<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewshop.html.shop.html.624662580'/>|<s:text name='Company_related_information_download'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> 
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='Help_support'/> >> <s:text name='Related_data_download'/></p>
    <%@ include file="/mainUI/common/help.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 帮助支持内容内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Company_related_information_download'/></p>
        <div class="widget-article">
          <p class="widget-notice"><a target="_blank" href="download/用户转让申请书.doc"><s:text name='Application_for_transfer_of_user'/></a></p>
          <p class="widget-notice mt15"><a target="_blank" href="download/开通卖出申请书.docx"><s:text name='Application_for_opening_and_selling'/></a></p>
        </div>
      </div>
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/> end -->
    </div>
  </div>
</div>
<!-- 帮助支持内容内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
