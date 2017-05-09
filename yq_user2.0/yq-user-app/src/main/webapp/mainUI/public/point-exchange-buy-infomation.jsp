<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='Points_trading_market_information'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
 <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body>
<div class="exchange-detail-table buy-info">
  <table>
    <caption><s:text name='vipgpjymy.jsp.gpjymy.jsp.861017881'/></caption>
    <thead>
      <tr>
        <td><s:text name='vipgpjymy.jsp.gpjymy.jsp.861201610'/></td>
        <td><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/></td>
        <td><s:text name='viewjflc-details.jsp.jflc-details.jsp.20195982'/></td>
        <td><s:text name='vipgpjymc.jsp.gpjymc.jsp.21392295'/></td>
        <td><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></td>
      </tr>
    </thead>
    <tbody>
      <s:iterator var="data" value="dataList">
       <tr> 
        <td>${data.mysl}</td>
        <td><c:if test="${data.pay<1}">${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></td>
        <td>${data.jypay}</td>
        <td>
        <c:choose>
     <c:when test="${fn:length(data.username) > 8}">
      <c:out value="${fn:substring(data.username, 0, 8)}.." />
     </c:when>
     <c:otherwise>
      <c:out value="${data.username}" />
     </c:otherwise>
    </c:choose>
        </td>
        <td>
       <c:if test="${data.mysl>0}"><a onClick='return confirm("<s:text name='vipgpjymc.jsp.gpjymc.jsp.1526835300'/>")' target="main" href="wymc?id=${data.id}&sl=${data.mysl}&secondThisState=${secondThisState}&thisState=${thisState}"><s:text name='vipgpjymy.jsp.gpjymy.jsp.1046836541a'/></a></c:if>
        </td>
       </tr>
		</s:iterator> 
    </tbody>
  </table>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
