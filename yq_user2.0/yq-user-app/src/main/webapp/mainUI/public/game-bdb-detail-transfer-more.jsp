<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.624662580'/>|<s:text name='Coin_change_list_declaration'/>|<s:text name='Transfer_log'/> <s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1135007'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title"><s:text name='Coin_change_list_declaration'/>|<s:text name='Transfer_log'/> <s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1135007'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646048'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646116'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1361215839'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.23899948'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21452281'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.24127308'/></th>
                <th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21679641'/></th>
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
					<td>${data.zaq}</td>
					<td>${data.zbq}</td>
					<td>${data.aq}</td>
					<td>${data.bq}</td>
					<td><fmt:formatDate value="${data.bfdate}" type="both"/></td>
					<td>${data.bz}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
  <aldtags:pageTag paraStr="status,1,type,${type}"/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
