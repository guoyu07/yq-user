<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('请您联系您地区的VIP服务中心，谢谢！');location.replace('/vipup');</script></c:if>

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币交易市场详情</title>
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
      <p class="dialog-title">一币交易市场详情</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>流水号</th>
                <th>卖出方</th>
                <th>信用星</th>
                <th>求现金额</th>
                <th>认购后可获一币</th>
                <th>认购后可获利</th>
                <th>卖出时间</th>
                <th>交易状态</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              	<s:iterator var="data" value="dataList">
				<tr>
					<td>${data.payid}</td>
					<td>${data.payusername}</td>
					<td>${data.cxt}</td>
					<td>${data.paynum9}</td>
					<td> ${data.paynum}</td>
					<td>${data.paynum-data.paynum9}</td>
					<td>${data.paytime}</td>
					<td> <c:if test="${data.payusername==userName}"><b><a onClick="return confirm('提示：您确定了吗？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000">撤销卖出</font></a></b></c:if><c:if test="${data.payusername!=userName}">等待认购中。。。</c:if></td>
					<td><a onClick="return confirm('提示：对方使用的收款方式是“${data.paybank}”您确定认购了吗？')" href="epmy?ep=${data.payid}"><font color="#FF0000" size="2">我要认购</font></a></td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
  <aldtags:pageTag paraStr="status,${status}"/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
function jump(lb) {
  location.replace('datepay?lb=' + lb);
  return;
};
</script>
</body>

</html>
