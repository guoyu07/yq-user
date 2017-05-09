<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='Coin_change_list_declaration'/>|<s:text name='Transfer_log'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='viewlinks.html.links.html.-1741306770a'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
  
  <!-- 报单币明细左边栏 -->
  <div class="point-info">
    <p class="title"><s:text name='viewlinks.html.links.html.-1741306770a'/></p>
    <%@ include file="/mainUI/common/bdb.jsp" %>
  </div>
  <!-- 报单币明细左边栏  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='Coin_change_list_declaration'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Transfer_log'/></p>
        <p class="small-button-line">
         <%--  <a href="bdbdate?type=1&secondThisState=${secondThisState}&thisState=${thisState}" class="widget-warning mr10"><s:text name='Check_the_coin_change_list_declaration'/></a>
          <a href="javascript:void(0);" class="widget-button-small JQ_goDialog" data-url="/bdbdatezzdetail?status=1&type=0"><s:text name='View_more'/></a> --%>
        </p>
        <div class="widget-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <%-- <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646048'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1361215839'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${userName}</td>
					<td>${data.sy}</td>
					<td><c:if test="${data.jc<0}">-${data.jc}</c:if><c:if test="${data.jc>0}">${data.jc}</c:if></td>
					<td><fmt:formatDate value="${data.bfdate}" type="both"/></td>
					<td>${data.bz}</td>
				</tr>
				</s:iterator>
            </tbody> --%>
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646048'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646116'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1361215839'/></th>
                <!-- <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.23899948'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21452281'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.24127308'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21679641'/></th> -->
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${userName}</td>
					<td>${data.sy}</td>
					<td><c:if test="${data.jc<0}">-${data.jc}</c:if><c:if test="${data.jc>0}">${data.jc}</c:if></td>
					<td>${data.sybdb}</td>
					<%-- <td>${data.zaq}</td>
					<td>${data.zbq}</td>
					<td>${data.aq}</td>
					<td>${data.bq}</td> --%>
					<td><fmt:formatDate value="${data.bfdate}" type="both"/></td>
					<td>${data.bz}
					<c:if test="${data.origintype==30023003 || data.origintype==3002 || data.origintype==3003}"><s:text name='Rechargeerrorreversa'/></c:if>
								<c:if test="${data.origintype==30043005 || data.origintype==3004 || data.origintype==3005}"><s:text name='deposit'/></c:if>
								<c:if test="${data.origintype==30003001 || data.origintype==3000 || data.origintype==3001}"><s:text name='wrongturn'/></c:if>
								<c:if test="${data.origintype==3008}"><s:text name='system'/></c:if></td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
         <p class="widget-pages">
  <aldtags:pageTag paraStr="type,${type},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
      </div>
      <!-- <s:text name='Coin_change_list_declaration'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
