<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币卖出明细详情内容</title>
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
      <p class="dialog-title">一币卖出明细详情</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>流水号</th>
                <th>卖出方（自己）</th>
                <th>求现金额</th>
                <th>发布时间</th>
                <th>交易状态</th>
                <th>操作</th>
                <th>操作状态</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
							<tr>
								<td>***${data.simplePayid}</td>
								<td>${data.payusername}</td>
								<td>${data.paynum9}元</td>
								<td><fmt:formatDate value="${data.paytime}" type="both"/></td>
								<td> <c:if test="${not empty data.zftime}">交易成功<c:if test="${data.tp==1}">（系统）</c:if> --对方--${data.dfuser}--<fmt:formatDate value="${data.zftime}" type="both"/></c:if>
								<c:if test="${empty data.zftime}">
             <c:if test="${data.ep==1}">${data.dfuser}--已下单，等待${data.dfuser}付款中...</c:if>
             <c:if test="${data.ep==2}">${data.dfuser}--已向您付款-${data.paynum9}元，等待您在<b><font color="#0000FF"><fmt:formatDate value="${data.rgdate}" type="both"/></font></b>前确认。。。</c:if>
             <c:if test="${data.ep!=1&&data.ep!=2}">等待认购中。。--<b><a onClick="return confirm('提示：您确定了吗？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000">撤销卖出</font></a></b></c:if>
              </c:if>
								</td>
								<td>
								<a onClick="return confirm('提示：您确定已收到认购方 ${data.dfuser}给打款 ${data.paynum9}了吗？ 确定后不可恢复！')" href="/mcepok?payId= ${data.payid}"><font color="#FF0000" size="2">
          <c:if test="${data.ep==2}"><input type="button" value="确认收到${data.paynum9}元款" name="B1" onclick=disabled=true style="font-size: 10pt; color: #0000FF; font-weight: bold">
          </c:if>
          </font>
					         	</a>
					         	</td>	
					          	<td><c:if test="${data.opstate==1}">订单被重置</c:if></td>
							</tr>
							</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
<aldtags:pageTag paraStr="status,1"/>
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
