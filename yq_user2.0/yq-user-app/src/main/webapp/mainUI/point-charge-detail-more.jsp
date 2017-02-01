<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币变化明细详情</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${cxt}/css/common.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title">一币变化明细详情</p>
      <!-- 图纸为一页13条数据 -->
      <p class="small-button-line">
        <a href="store-order-search.html" class="widget-warning mr10">商城订单号查询</a>
        <select class="widget-select" id="lb" name="lb" onchange="jump(document.getElementById('lb').options[document.getElementById('lb').selectedIndex].value);">
          <option value="0" selected="">全部</option>
          <option value="1">推广奖</option>
          <option value="2">平衡奖</option>
          <option value="3">辅导奖</option>
          <option value="4">积分卖出</option>
          <option value="5">卖出 一币 </option>
          <option value="6">认购 一币 </option>
          <option value="7">同名互转</option>
          <option value="8">VIP转收</option>
          <option value="9">管理转收</option>
          <option value="10">管理增减</option>
          <option value="12">商品收入</option>
          <option value="13">一币 消费 </option>
          <option value="14">票务支出 </option>
          <option value="15">商户收入 </option>
          <option value="16">话费充值 </option>
          <option value="20">交易违规 </option>
        </select>
      </p>
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>一币收入</th>
                <th>一币支出</th>
                <th>金币收入</th>
                <th>金币支出</th>
                <th>剩余一币</th>
                <th>剩余金币</th>
                <th>更新时间</th>
                <th>备注</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${data.cjuser}</td>
					<td>${data.dqcj}</td>
					<td>${data.ljcj}</td>
					<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
					<td><fmt:formatDate value="${data.qldate}" type="both"/></td>
					<td>${data.cjfs}</td>
					<td>${data.bz}</td>
					<td>${data.cz}</td>
					<td>${data.ip}</td>
				</tr>
			   </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
		<p class="widget-pages">
				<aldtags:pageTag/>
		</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${cxt}/js/jquery.js"></script>
<script type="text/javascript" src="${cxt}/js/common.js"></script>
</body>

</html>
