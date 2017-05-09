<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Account_manage'/> >> <s:text name='The_same_account_management'/></p>
     <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='vipreg.jsp.reg.jsp.25579282'/></p>
        <div class="widget-form">
          <p class="widget-notice mt15 ml10"><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-1775315253'/>。</p>
          <p class="item mt15">
            <lable class="title"><s:text name='reg.jsp.reg.jsp.25579282'/>：</lable>
            <span class="text">${upName}<s:text name='mr_ms'/></span>
          </p>
          <p class="item">
            <lable class="title">QQ：</lable>
            <span class="text">${up.qq} <a target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=${up.qq}&amp;site=qq&amp;menu=yes"> <s:text name='viewservice.jsp.service.jsp.488997268'/></a></span>
          </p>
          <p class="item">
            <lable class="title"><s:text name='reg.jsp.reg.jsp.806479'/>：</lable>
            <span class="text">${up.call}</span>
          </p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/></p>
        <p class="small-button-line">
         <!--  <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="tgdowntgdowndetail?status=1"><s:text name='View_more'/></a> -->
        </p>
        <div class="widget-table mt5">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th>QQ/Email</th>
                <th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.851482466'/></th>
                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.989728617'/></th>
                <th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-738867994'/></th>
                <th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.660492955'/></th>
                <th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.667120382'/></th>
              </tr>
            </thead>
            <tbody>
 				<s:iterator var="data" value="dataList">
				<tr>
				<td>${data.username}</td>
				<td>
				<c:choose>
					<c:when test="${fn:contains(data.qq,'@')!=true}">
							<a target="_blank" href="https://wpa.qq.com/msgrd?v=3&uin=${data.qq}&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:${data.qq}:41" alt="<s:text name='viewservice.jsp.service.jsp.488997268'/>" title="<s:text name='viewservice.jsp.service.jsp.488997268'/>"></font></a><font size="2" color="#000000">${data.qq}</font>
					</c:when>
					<c:otherwise>
							<a target="_blank" href="mailto:${data.qq}"><font size="2"><img border="0" src="image/eamil.png" alt="<s:text name='sendemail'/>" title="<s:text name='sendemail'/>"></font></a><font size="2" color="#000000">${data.qq}</font>
					</c:otherwise>
				</c:choose>
				</td>
				<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
				<td>${data.cjtj}</td>
				<td><fmt:formatDate value="${data.gmdate}" type="both"/></td>
				<td><c:if test="${data.sjb==0}"><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-522793551'/></c:if><c:if test="${data.sjb!=0}">${data.sjb}<s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-522793551a'/></c:if></td>
				<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
				</tr>
			   </s:iterator>
            </tbody>
          </table>
        </div>
        <p class="widget-pages">
  <aldtags:pageTag paraStr="status,${status},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
        <!-- <s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/> end -->
      </div>
    </div>
  </div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
