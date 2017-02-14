<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|客服中心</title>
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
  <div class="container">
    <!-- 首页内容 -->
    <div class="member-content" id="J_memberContent">
      <!-- 会员中心左边栏 -->
      <div class="member-aside">
        <%@ include file="/mainUI/common/userLeft.jsp" %>
        <%@ include file="/mainUI/common/licaiLeft.jsp" %>
      </div>
      <!-- 会员中心左边栏 end -->
      <!-- 客服中心 -->
      <div class="member-main">
        <div class="main-widget customer-service-center">
          <p class="widget-title-line">客服中心</p>
          <div class="widget-article">
            <p class="widget-notice">团队服务中心编号： ${upuname}***</p>
            <p class="widget-notice mt5">称谓：${gcuserup.vipuser} </p> 
            <p class="widget-notice">联系QQ：
              <a class="contact-qq" target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=111111&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:111111:41" alt="点击这里发消息" title="点击这里发消息"></a>
            </p>
            <p class="widget-notice mt5">联系电话： ${gcuserup.call}</p>
            <c:if test="${not empty gcuserup.vipgh}">
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
			</c:if>				
			<%-- <p widget-notice mt5><s:text name='reg.jsp.reg.jsp.-1009112269'/>：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}<s:text name='vipuserpay.jsp.userpay.jsp.837885'/></p>
			 <p widget-notice mt5> <s:text name='viewservice.jsp.service.jsp.643086062'/>， <s:text name='viewservice.jsp.service.jsp.-1565630892'/></p>
             --%>
            <p class="widget-notice mt10">开户行所在地：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}</p>
            <p class="widget-tips mt10">有关业务问题可咨询，如您无法在一币市场进行收购一币的操作或您想省去在收一币中（打款，等待对方确认）的中间环节，就可以联系本团队服务中心快速购买。</p> 
          </div>
        </div>
      </div>
      <!-- 客服中心 end -->
    </div>
    <!-- 首页内容 end -->
  </div>
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/common.js"></script>
</body>

</html>
