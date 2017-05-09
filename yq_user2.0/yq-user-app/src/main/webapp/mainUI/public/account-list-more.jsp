<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.624662580'/>|<s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.1302371267'/></title>
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
      <p class="dialog-title"><s:text name='Accounts_with_the_same_list_for_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
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
								<td><%-- <a href="/relogin?luserName=${data.username}"> --%>${data.username}<!-- </a> --><c:if test="${data.username==gcuser.username}"></font><b><font color="#FF00FF">(<s:text name='current'/>)</font></b></c:if></td>
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
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="status,1,thisState,${thisState},secondThisState,${secondThisState}"/>
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
