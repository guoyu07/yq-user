<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|积分交易市场</title>
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

<link rel="stylesheet" href="css/point-exchange-market.css"> 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">财富中心 >> 积分理财</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
	  <div class="member-aside">
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <!-- 积分交易市场 -->
    <div class="member-main">
      <div class="main-widget">
        <p class="widget-title">积分交易市场</p>
        <div class="point-exchange">
          <div class="exchange-price-now">
            <p class="title">当前交易价是</p>
            <p class="price">${fcxt.jygj}</p>
          </div>
          <div class="exchange-price-info">
            <a href="/mcsl?secondThisState=${secondThisState}&thisState=${thisState}" class="exchange-btn btn-sale">我要卖出</a>
            <div class="exchange-price">
              <table class="exchange-price-table" align="center" border="0" cellspacing="0" cellpadding="0">
                <thead>
                  <tr>
                    <th>开盘价</th>
                    <th>最高价</th>
                    <th>最低价</th>
                    <th>现价</th>
                    <th>交易范围</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                   	<td>${fcxt.zdj}</td>
					<td><fmt:formatNumber type="number" value="${fcxt.zgj+0.03}" maxFractionDigits="2"/></td>
					<td>${fcxt.zdj}</td>
					<td>${fcxt.jygj}</td>
					<td><fmt:formatNumber type="number" value="${fcxt.zgj+0.03}" maxFractionDigits="2"/>/${fcxt.zdj}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <a href="/mysl?secondThisState=${secondThisState}&thisState=${thisState}" class="exchange-btn btn-buy">我要买入</a>
          </div>
          <p class="warning-tips"><span>友情提醒：</span>根据市场情况，电子积分单价会稳步上涨，到一定时候拆分</p>
          <div class="exchange-detail">
            <!-- 出售信息表格 图纸是13条数据 用户名在后端输出的时候就做了限制 超过10位会显示为8位+... -->
            <div class="table-wrap">
              <iframe name="I1" width="100%" height="400" align="center" border="0" frameborder="0" src="/gpjymc?secondThisState=${secondThisState}&thisState=${thisState}" scrolling="no"></iframe>
            </div>
            <!-- 出售信息表格 end -->
            <!-- 求购信息表格 图纸是13条数据 -->
            <div class="table-wrap ml30">
              <iframe name="I2" width="100%" height="400" align="center" border="0" frameborder="0" src="/gpjymy?secondThisState=${secondThisState}&thisState=${thisState}" scrolling="no"></iframe>
            </div>
            <!-- 求购信息表格 end -->
          </div>
        </div>
      </div>
    </div>
    <!-- 积分交易市场 end -->
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
