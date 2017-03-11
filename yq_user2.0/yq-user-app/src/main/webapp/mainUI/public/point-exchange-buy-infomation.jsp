<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|积分交易市场求购信息</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body>
<div class="exchange-detail-table buy-info">
  <table>
    <caption>求购信息</caption>
    <thead>
      <tr>
        <td>出售数量</td>
        <td>单价</td>
        <td>交易额</td>
        <td>发布方</td>
        <td>操作</td>
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
       <c:if test="${data.mysl>0}"><a onClick="return confirm('提示：您确定了吗？')" target="main" href="wymc?id=${data.id}&sl=${data.mysl}&secondThisState=${secondThisState}&thisState=${thisState}">我要卖</a></c:if>
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
