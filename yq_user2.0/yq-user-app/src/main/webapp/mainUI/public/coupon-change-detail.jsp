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

<body> <!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->

<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-505493846'/></p>
     <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>


<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
   <!-- 会员中心左边栏 -->
<div class="member-aside">
  
  <!-- 报单币明细左边栏 -->
  <div class="point-info">
    <p class="title"><s:text name='Shopping_coupon_details'/></p>
     <%@ include file="/mainUI/common/gwjLeft.jsp" %>
  </div>
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-505493846'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-505493846'/></p>
        <p class="small-button-line"><a href="usermallorderscoreslog?secondThisState=${secondThisState}&thisState=${thisState}" class="widget-warning mr10"><s:text name='mallorderquery'/></a></p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.793443422'/></th>
                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.748079417'/></th>
                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1135007'/></th>
                <th><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.847550'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
               <tr>
                   <td>${data.userName}</td>
                   <td>${data.changeNum}</td>
                   <td>${data.nowNum}</td>
                   <td>
                     <c:choose>
                        <c:when test="${data.changeType==1001}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.985534181'/></c:when>
                        <c:when test="${data.changeType==1002}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.672663306'/>-${data.param}</c:when>
                        <c:when test="${data.changeType==1003}"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/>-${data.param}</c:when>
                        <c:when test="${data.changeType==1004}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1302859212'/>-${data.fromUser}</c:when>
                        <c:when test="${data.changeType==1005}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-1516479278'/>-${data.fromUser}</c:when>
                        <c:when test="${data.changeType==1006}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-1849971472'/>-${data.param}</c:when>
                        <c:when test="${data.changeType==1007}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.2110427632'/>-${data.param}</c:when>
                        <c:when test="${data.changeType==2001}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.672844281'/>-${data.param}</c:when>
                        <c:when test="${data.changeType==2002}"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/>-${data.param}</c:when>
                        <c:when test="${data.changeType==2003}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1302859212'/>-${data.fromUser}</c:when>
                        <c:when test="${data.changeType==2004}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.2110427632'/><s:text name='viewlinks.html.links.html.1159182'/>-${data.param}-${data.fromUser}</c:when>
                        <c:otherwise>${data.changeType}</c:otherwise>
                     </c:choose>
                   </td>
                   <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
               </tr>
               </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
  <aldtags:pageTag paraStr="status,1,secondThisState,${secondThisState},thisState,${thisState}"/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
      <!-- <s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-505493846'/> end -->
    </div>
  </div>
</div>
<!-- 购物券内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
