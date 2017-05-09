<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1151284962'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='viewjflc.jsp.jflc.jsp.951062035'/></p>
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
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/></p>
        <p class="small-button-line">
          <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" id="J_pointExchangeNodealDetail" data-url="/gpjydesuccess?status=2"><s:text name='Not_done_in_detail'/></a>
          <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" id="J_pointExchangeDealDetail" data-url="/gpjyOfDeal"><s:text name='Has_been_traded_in_detail'/></a>
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.656571075'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.619069972'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.20195982'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.934923'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.755936'/></th>
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
        <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> end -->
      </div>
      <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> end -->
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  </body>

  </html>
