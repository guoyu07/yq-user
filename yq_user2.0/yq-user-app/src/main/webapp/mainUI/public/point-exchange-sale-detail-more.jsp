<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|当前卖出明细详情</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title">当前卖出明细详情</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>卖出</th>
                <th>剩余</th>
                <th>挂牌时间</th>
                <th>当前价格</th>
                <th>修改价格</th>
                <th>操作</th>
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
                   <td><a href="/diyjygj?sgid=${data.id}">修改价格</a></td>
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
