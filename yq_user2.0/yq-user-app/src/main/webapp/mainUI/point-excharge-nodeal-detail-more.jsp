<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|未成交积分交易明细详情</title>
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
        <p class="dialog-title">未成交积分交易明细详情</p>
        <!-- 图纸为一页13条数据 -->
        <div class="dialog-wrap-border main-widget">
          <div class="dialog-table">
            <table border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr>
                  <th>用户名</th>
                  <th>卖出数量</th>
                  <th>买入数量</th>
                  <th>剩余数量</th>
                  <th>挂牌时间</th>
                  <th>单价</th>
                  <th>交易额</th>
                  <th>状态</th>
                  <th>对方</th>
                  <th>成交时间</th>
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
