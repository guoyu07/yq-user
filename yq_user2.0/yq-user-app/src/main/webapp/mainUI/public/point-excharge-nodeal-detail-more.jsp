<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='Not_traded_details_of_transaction_details'/></title>
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
        <p class="dialog-title"><s:text name='Not_traded_details_of_transaction_details'/></p>
        <!-- 图纸为一页13条数据 -->
        <div class="dialog-wrap-border main-widget">
          <div class="dialog-table">
            <table border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr>
                  <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.656571075'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.619069972'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.648863855'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.784049096'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.20195982'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.934923'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.755936'/></th>
                  <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.768067666'/></th>
                </tr>
              </thead>
              <tbody>
               <s:iterator var="data" value="dataList">
				<tr>
					<td>${userName}</td>
					<td><c:if test="${data.mcsl>0}">-${data.mcsl}</c:if><c:if test="${data.mcsl<=0}">${data.mcsl}</c:if></td>
					<td>${data.mysl}</td>
					<td>${data.sysl}</td>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td><c:if test="${data.pay<1}">${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></td>
					<td>${data.jypay}</td>
					<td>${data.bz}</td>
					<td>${data.dfuser}</td>
					<td><fmt:formatDate value="${data.cgdate}" type="both"/></td>
				</tr>
				</s:iterator>
              </tbody>
            </table>
          </div>
          <!-- 会员中心翻页组件 -->
<p class="widget-pages">
<aldtags:pageTag paraStr="status,2"/>
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
