<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewservice.jsp.service.jsp.724834337'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Support_help'/> >> <s:text name='viewservice.jsp.service.jsp.724834337'/></p>
     <%@ include file="/mainUI/common/help.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->


  <div class="container">
    <!-- 首页内容 -->
    <div class="member-content" id="J_memberContent">
          <div class="member-main-full">
        <div class="main-widget customer-service-center">
          <p class="widget-title-line"><s:text name='viewservice.jsp.service.jsp.724834337'/></p>
          <div class="widget-article">
            <p class="widget-notice"><s:text name='viewservice.jsp.service.jsp.858879560'/>： ${upuname}***</p>
          <%--   <p class="widget-notice mt5"><s:text name='viewservice.jsp.service.jsp.1003555'/>：${gcuserup.vipuser} </p>  --%>
            <p class="widget-notice"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1050407'/>QQ： ${gcuserup.qq}</p>
            <p class="widget-notice mt5"><s:text name='viewservice.jsp.service.jsp.1010407087'/>： ${gcuserup.call}</p>
            <%-- <c:if test="${not empty gcuserup.vipgh}">
			  <p class="widget-notice mt5"><s:text name='reg.jsp.reg.jsp.-453899062'/>:${gcuserup.vipgh}</p>
			</c:if>
			<c:if test="${not empty gcuserup.vipnh}">
			  <p class="widget-notice mt5"><s:text name='reg.jsp.reg.jsp.1781968004'/>:${gcuserup.vipnh}</p>
			</c:if>		
			<c:if test="${not empty gcuserup.vipjh}">
			  <p class="widget-notice mt5"><s:text name='reg.jsp.reg.jsp.691148048'/>:${gcuserup.vipjh}</p>
			</c:if>
			<c:if test="${not empty gcuserup.vipzh}">
			  <p class="widget-notice mt5"><s:text name='reg.jsp.reg.jsp.1019445992'/>:${gcuserup.vipzh}</p>
			</c:if>	
			<c:if test="${not empty gcuserup.vipcft}">
			  <p class="widget-notice mt5"><s:text name='viewservice.jsp.service.jsp.35383524'/>:${gcuserup.vipcft}</p>
			</c:if>		
			<c:if test="${not empty gcuserup.vipzfb}">
			  <p class="widget-notice mt5"><s:text name='viewservice.jsp.service.jsp.25541940'/>:${gcuserup.vipzfb}</p>
			</c:if>	 --%>			
			<%-- <p widget-notice mt5><s:text name='reg.jsp.reg.jsp.-1009112269'/>：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}<s:text name='vipuserpay.jsp.userpay.jsp.837885'/></p>
			 <p widget-notice mt5> <s:text name='viewservice.jsp.service.jsp.643086062'/>， <s:text name='viewservice.jsp.service.jsp.-1565630892'/></p>
             --%>
           <%--  <p class="widget-notice mt10"><s:text name='reg.jsp.reg.jsp.-1009112269'/>：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}</p> --%>
          </div>
        </div>
      </div>
      <!-- <s:text name='viewservice.jsp.service.jsp.724834337'/> end -->
    </div>
    <!-- 首页内容 end -->
  </div>
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
