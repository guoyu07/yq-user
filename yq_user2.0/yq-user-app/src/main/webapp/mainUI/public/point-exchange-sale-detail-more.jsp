<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewlogin2j.jsp.login2j.jsp.624662580'/>|<s:text name='Details_of_current_sale_details'/></title>
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
      <p class="dialog-title"><s:text name='Details_of_current_sale_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.784049096'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.747890431'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.635139184'/></th>
                <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
              </tr>
            </thead>
            <tbody>
             <s:iterator var="data" value="dataList">
			<tr>
				<td>${userName}</td>
				<td>${data.mcsl}</td>
				<td>${data.sysl}</td>
				<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
				<td>${data.pay}</td>
                   <td><a href="/diyjygj?sgid=${data.id}"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.635139184'/></a></td>
                   <td><!-- <c:if test="${data.newjy!=3}"><a href="qxyjg?qxid=${data.id}" style="text-decoration: none">撒销</a></c:if> --></td>
			</tr>
			</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
<aldtags:pageTag paraStr="status,4,thisState,${thisState},secondThisState,${secondThisState}"/>
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
