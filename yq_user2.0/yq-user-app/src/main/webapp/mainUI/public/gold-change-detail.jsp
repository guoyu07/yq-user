<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Details_of_gold_coins'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='Gold_coin_management'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Details_of_gold_coins'/></p>
        <p class="small-button-line">
          <!-- <a href="eb-store-order-search.html" class="widget-warning mr10"><s:text name='Click_here_to_enter_the_mall_order_number_query'/></a>
          <select class="widget-select" id="lb" name="lb" onchange="jump(document.getElementById('lb').options[document.getElementById('lb').selectedIndex].value);">
            <option value="0" selected=""><s:text name='all'/></option>
            <option value="1"><s:text name='promotion_award'/></option>
            <option value="2"><s:text name='balance_award'/></option>
            <option value="3"><s:text name='counseling_award'/></option>
            <option value="4"><s:text name='integral_sell'/></option>
            <option value="5"><s:text name='Sell_a_coin'/> </option>
            <option value="6"><s:text name='Subscribe_for_a_dollar'/> </option>
            <option value="7"><s:text name='namesake_Huzhuan'/></option>
            <option value="8"><s:text name='VIP_transfer_income'/></option>
            <option value="9"><s:text name='management_transfer_income'/></option>
            <option value="10"><s:text name='changes_in_management'/></option>
            <option value="12"><s:text name='commodity_revenues'/></option>
            <option value="13"><s:text name='Dollar_consumption'/> </option>
            <option value="14"><s:text name='ticket_expenditure'/> </option>
            <option value="15"><s:text name='business_income'/> </option>
            <option value="16"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/> </option>
            <option value="20"><s:text name='Trading_violations'/> </option>
          </select> -->
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewlinks.html.links.html.1136018751'/></th>
                <th><s:text name='viewlinks.html.links.html.1136018683'/></th>
                <th><s:text name='viewlinks.html.links.html.649202784'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${gcuser.username}</td>
					<td>${data.jyjz}</td>
					<td><c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></td>
					<td>${data.jydb}</td>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td>${data.regid}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
  <aldtags:pageTag paraStr="lb,${lb},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
<!-- 会员中心翻页组件 end -->

        <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> end -->
      </div>
      <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> end -->
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  <script>
  function jump(lb) {
    location.replace('goldDeatil?lb=' + lb);
    return;
  };
  </script>
  </body>

  </html>
