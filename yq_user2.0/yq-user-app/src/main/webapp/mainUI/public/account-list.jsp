<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.1302371267'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Account_manage'/> >><s:text name='The_same_account_management'/></p>
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
        <p class="widget-title-line"><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.1302371267'/></p>
        <p class="small-button-line">
          <!-- <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" id="J_accountList" data-url="userlistdetail?status=1"><s:text name='View_more'/></a> -->
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='reg.jsp.reg.jsp.734362'/></th>
                <th><s:text name='viewlinks.html.links.html.865732987'/></th>
                <th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.669584602'/></th>
                <th><s:text name='viewshop.html.shop.html.950947478'/></th>
                <th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.670122793'/></th>
                <th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.851482466'/></th>
                <th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.749527093'/></th>
                <th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.20777047'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
							<tr>
								<td><a href="/relogin?luserName=${data.username}">${data.username}</a><c:if test="${data.username==gcuser.username}"></font><b><font color="#FF00FF">(<s:text name='current'/>)</font></b></c:if></td>
								<td>${data.name}</td>
								<td>${data.sjb}</td>
								<td>${data.pay}</td>
								<td>${data.jyg}</td>
								<td>${data.jydb}</td>
								<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
								<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
								<td>${data.cxt}</td>
							</tr>
							</s:iterator>
            </tbody>
          </table>
        </div>
        <p class="widget-pages">
	<aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
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
