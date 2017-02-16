<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|积分交易明细</title>
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
    <p class="breadcrumb-trail">财富中心 >> 积分理财</p>
    <ul class="nav-secondary">
      <%@ include file="/mainUI/common/scendhead.jsp" %>
    </ul>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
        <%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 积分交易明细 -->
      <div class="main-widget">
        <p class="widget-title-line">积分交易明细</p>
        <p class="small-button-line">
          <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" id="J_pointExchangeNodealDetail" data-url="/gpjydesuccess?status=2">未成交详细</a>
          <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" id="J_pointExchangeDealDetail" data-url="/gpjyOfDeal">已成交详细</a>
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>卖出数量</th>
                <th>买入数量</th>
                <th>单价</th>
                <th>交易额</th>
                <th>状态</th>
                <th>对方</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${userName}</td>
					<td><c:if test="${data.mcsl>0}">-${data.mcsl}</c:if><c:if test="${data.mcsl<=0}">${data.mcsl}</c:if></td>
					<td>${data.mysl}</td>
					<%-- <td>${data.sysl}</td> --%>
					<%-- <td><fmt:formatDate value="${data.abdate}" type="both"/></td> --%>
					<td><c:if test="${data.pay<1}">${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></td>
					<td>${data.jypay}</td>
					<td>${data.bz}</td>
					<td>${data.dfuser}</td>
					<%-- <td><fmt:formatDate value="${data.cgdate}" type="both"/></td> --%>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 积分交易明细 end -->
      </div>
      <!-- 积分交易明细 end -->
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  </body>

  </html>
