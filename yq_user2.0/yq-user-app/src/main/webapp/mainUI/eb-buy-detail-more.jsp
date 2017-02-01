<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币认购明细详情</title>
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
      <p class="dialog-title">一币认购明细详情</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>流水号</th>
                <th>认购方（自己）</th>
                <th>认购一币数量</th>
                <th>认购时间</th>
                <th>卖出方</th>
                <th>交易状态</th>
                <th>操作</th>
                <th>操作状态</th>
              </tr>
            </thead>
            <tbody>
               <s:iterator var="data" value="dataList">
				<tr>
				<td>***${data.simplePayid}</td>
				<td>${data.dfuser}</td>
				<td>${data.paynum}</td>
				<td><fmt:formatDate value="${data.rgdate}" type="both"/></td>
				<td> ${data.payusername}</td>
				<td> 
				<c:if test="${not empty zftime}">
                                                               交易成功-卖出方${data.payusername}已确认。
          </c:if>
          <c:if test="${empty zftime}">
                <c:if test="${data.ep==1}"><font color="#FF00FF">您已下单，等待您在</font><font color="#0000FF"><b>${data.rgdate}</b></font><font color="#FF00FF">前付款，<b><a target="_blank" href="fbbank?fb=${data.payid}"><font color="#008000">点击查看卖出方收款账号！</font></a></b></font></c:if>                                                
                <c:if test="${data.ep==2}">${data.dfuser}--已付款，等待卖出方${data.payusername}的确认中。。。</c:if>
          </c:if>
	          	</td>
      						<td><a onClick="return confirm('提示：您确定已向发布方 ${data.payusername} 打款 ${data.paynum9}元了吗？')" href="myepok?ep=${data.payid}"><font color="#FF0000" size="2">
        						<c:if test="${data.ep==1}">已打款${data.paynum9}元，通知卖出方确认。</c:if></font></a>
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
