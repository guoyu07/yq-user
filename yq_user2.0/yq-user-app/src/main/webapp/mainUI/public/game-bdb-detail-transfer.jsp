<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|报单币变化明细|转账日志</title>
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
    <p class="breadcrumb-trail">财富中心 >> 报单币明细</p>
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
    <p class="title">报单币明细</p>
    <%@ include file="/mainUI/common/bdb.jsp" %>
  </div>
  <!-- 报单币明细左边栏  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 报单币变化明细 -->
      <div class="main-widget">
        <p class="widget-title-line">转账日志</p>
        <p class="small-button-line">
         <%--  <a href="bdbdate?type=1&secondThisState=${secondThisState}&thisState=${thisState}" class="widget-warning mr10">查看报单币变化明细</a>
          <a href="javascript:void(0);" class="widget-button-small JQ_goDialog" data-url="/bdbdatezzdetail?status=1&type=0">查看更多</a> --%>
        </p>
        <div class="widget-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <%-- <thead>
              <tr>
                <th>用户名</th>
                <th>报单币收入</th>
                <th>剩余报单币</th>
                <th>更新时间</th>
                <th>备注</th>
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
                <th>用户名</th>
                <th>报单币收入</th>
                <th>报单币支出</th>
                <th>剩余报单币</th>
                <!-- <th>左总计</th>
                <th>右总计</th>
                <th>左结余</th>
                <th>右结余</th> -->
                <th>更新时间</th>
                <th>备注</th>
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
					<td>${data.bz}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
         <p class="widget-pages">
  <aldtags:pageTag paraStr="type,${type},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
      </div>
      <!-- 报单币变化明细 end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
