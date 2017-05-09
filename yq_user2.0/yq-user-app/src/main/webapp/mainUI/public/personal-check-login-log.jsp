<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Log_entry_details'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Account_manage'/> >> <s:text name='Login_log'/></p>
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
      <!-- <s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.1302371267'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Log_entry_details'/></p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.667376878'/></th>
                <th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.-451364663'/></th>
                <th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.1119230520'/></th>
                <th>ip<s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.714256'/></th>
                <th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.928172778'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
							<tr>
								<td>${gcuser.username}</td>
								<td><fmt:formatDate value="${data.dldate}" type="both"/></td>
								<td><fmt:formatDate value="${data.tcdate}" type="both"/></td>
								<td>${data.dlip}</td>
								<td>${data.dlfs}</td>
							</tr>
							</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}" />
</p>
<!-- 会员中心翻页组件 end -->

        <!-- <s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.1302371267'/> end -->
      </div>
    </div>
  </div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
