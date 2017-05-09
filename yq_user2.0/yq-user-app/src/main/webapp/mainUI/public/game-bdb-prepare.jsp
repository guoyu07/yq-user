<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Reserve_currency_declaration_details_change'/></title>
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
  <!-- VIP中心左边栏 -->
  <%@ include file="/mainUI/common/vipleft.jsp" %>
  <!-- VIP中心左边栏  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='Reserve_currency_declaration_details_change'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Reserve_currency_declaration_details_change'/></p>
        <div class="widget-table full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.793443422'/></th>
                <th>改变后数量</th>
                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.847550'/></th>
                <th>被充值用户</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${data.username}</td>
					<td>${data.amount}</td>
					<td>${data.currentamount}</td>
					<td><fmt:formatDate value="${data.rechargedate}" type="both"/></td>
					<td>${data.operator}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="secondThisState,${secondThisState},thisState,${thisState}" />
</p>
<!-- 会员中心翻页组件 end -->

      </div>
      <!-- <s:text name='Reserve_currency_declaration_details_change'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
