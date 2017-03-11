<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|金币变化明细</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> 
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">财富中心 >> 金币管理</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- 积分交易明细 -->
      <div class="main-widget">
        <p class="widget-title-line">金币变化明细</p>
        <p class="small-button-line">
          <!-- <a href="eb-store-order-search.html" class="widget-warning mr10">点击这里进入商城订单号查询</a>
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
          </select> -->
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>金币收入</th>
                <th>金币支出</th>
                <th>剩余金币</th>
                <th>更新时间</th>
                <th>备注</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${gcuser.username}</td>
					<td>${data.jyjz}</td>
					<td><c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></td>
					<td>${data.jydb}</td>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td>${data.regid}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
  <aldtags:pageTag paraStr="lb,${lb},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
<!-- 会员中心翻页组件 end -->

        <!-- 积分交易明细 end -->
      </div>
      <!-- 积分交易明细 end -->
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  <script>
  function jump(lb) {
    location.replace('goldDeatil?lb=' + lb);
    return;
  };
  </script>
  </body>

  </html>
