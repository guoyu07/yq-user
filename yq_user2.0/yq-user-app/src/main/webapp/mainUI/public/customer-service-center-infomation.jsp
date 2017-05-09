<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.642434221'/>QQ：613697151"></c:set>
<c:set var="cz02" value="<s:text name='viewindex2.jsp.index2.jsp.37800384'/>"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-950517773'/>"></c:set>
<c:set var="cms" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.475493810'/>"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.643357742'/>QQ：613697152"></c:set>
<c:set var="cz02" value="<s:text name='viewindex2.jsp.index2.jsp.37800384'/>"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-950517773'/>"></c:set>
<c:set var="cms" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.475493810'/>"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='Service_Centre'/></title>
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

<div class="container">
  <!-- 首页内容 -->
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <div class="main-widget customer-service-center">
        <p class="widget-title-line"><s:text name='About_service_center'/></p>
        <div class="widget-article">
          <p><s:text name='viewindex2.jsp.index2.jsp.803273677'/>！</p>
          <p><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-836674711'/>：
            <span style="color: #0078ff;">${gcuserup.qq}<a class="contact-qq ml10" target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=1790863642&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1790863642:41" alt="<s:text name='viewservice.jsp.service.jsp.488997268'/>" title="<s:text name='viewservice.jsp.service.jsp.488997268'/>"></a></span></p>
          <p class="widget-warning mt10"><s:text name='Various_departments_service_center_personnel_division_of_order,_please_do_not_repeat_to_add_friends,_not_to_each_customer_service_at_the_same_time_to_consult_the_same_question,_thank_you_for_your_cooperation'/>。</p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title"><s:text name='Service_Center'/>${gcuserup.vipuser}<s:text name='Special_collection_account'/></p>
        <div class="widget-form">
          <p class="item">
            <label class="title"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.24172470'/>：</label>
            <span class="text widget-warning">${gcuserup.vipuser}</span>
          </p>
          
            
		        <c:if test="${not empty gcuserup.vipgh}">
		        <p class="item">
				  <label class="title"><s:text name='reg.jsp.reg.jsp.-453899062'/>：</label>
            	  <span class="text">${gcuserup.vipgh}</span></p>
				</c:if>
				<c:if test="${not empty gcuserup.vipnh}">
				<p class="item">
					<label class="title"> <s:text name='reg.jsp.reg.jsp.1781968004'/>:</label>
	            	<span class="text">${gcuserup.vipnh}</span></p>
				</c:if>		
				<c:if test="${not empty gcuserup.vipjh}">
				<p class="item">
					<label class="title"><s:text name='reg.jsp.reg.jsp.691148048'/>:</label>
	            	<span class="text">${gcuserup.vipjh}</span></p>
				</c:if>
				<c:if test="${not empty gcuserup.vipzh}">
				<p class="item">
				<label class="title"><s:text name='reg.jsp.reg.jsp.1019445992'/>:</label>
	            	<span class="text">${gcuserup.vipzh}</span></p>
				</c:if>	
				<c:if test="${not empty gcuserup.vipcft}">
				<p class="item">
				<label class="title"> <s:text name='viewservice.jsp.service.jsp.35383524'/>:</label>
	            	<span class="text">${gcuserup.vipcft}</span></p>
				</c:if>		
				<c:if test="${not empty gcuserup.vipzfb}">
				<p class="item">
				<label class="title"><s:text name='viewservice.jsp.service.jsp.25541940'/>:</label>
	            	<span class="text">${gcuserup.vipzfb}</span></p>
				</c:if>

          <p class="widget-notice widget-warning mt10 pl10"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.80418316'/>：1000.22 5000.12</p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.873927308'/></p>
        <div class="widget-article">
          <p class="widget-notice"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-1213449939'/></p>
          <p class="widget-notice mt10"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.483236660'/></p>
          <p class="widget-notice mt10"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-2027014662'/></p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.855113397'/></p>
        <div class="widget-article">
          <p><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.974981784'/>！</p>
          <p class="widget-warning"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-925025214'/>：</p>
          <p class="widget-warning"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-107686232'/>：XXXXXX</p>
          <p><s:text name="viewzhgl-bank.jsp.zhgl-bank.jsp.-281897408"></s:text>！</p>
          <p><s:text name="viewzhgl-bank.jsp.zhgl-bank.jsp.-1965101196"></s:text><s:text name="viewzhgl-bank.jsp.zhgl-bank.jsp.1571346232"></s:text>！
          </p>
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
