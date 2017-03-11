<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|积分理财充值</title>
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
        <!-- 充值 -->
        <div class="main-widget">
          <p class="widget-title-line">充值</p>
          <div class="widget-article">
            <form method="POST" name="Form" onsubmit="return checkdate()" action="vipgo?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
              <p class="widget-notice mt15"><b>请选择您要充值的金额：</b></p>
              <p class="select-line">
                <select class="widget-select mt10" name="cjpay">
                  <option selected="" value="0">==请选择收到的充值金额==</option>
                  <option value="100">100</option>
                  <option value="200">200</option>
                  <option value="300">300</option>
                  <option value="400">400</option>
                  <option value="500">500</option>
                  <option value="600">600</option>
                  <option value="700">700</option>
                  <option value="800">800</option>
                  <option value="900">900</option>
                  <option value="1000">1000</option>
                  <option value="1200">1200</option>
                  <option value="1500">1500</option>
                  <option value="1800">1800</option>
                  <option value="2000">2000</option>
                  <option value="2200">2200</option>
                  <option value="2500">2500</option>
                  <option value="3000">3000</option>
                  <option value="4000">4000</option>
                  <option value="5000">5000</option>
                  <option value="6000">6000</option>
                  <option value="7000">7000</option>
                  <option value="8000">8000</option>
                  <option value="9000">9000</option>
                  <option value="10000">1万</option>
                  <option value="12000">1万2千</option>
                  <option value="15000">1万5千</option>
                  <option value="18000">1万8千</option>
                  <option value="20000">2万</option>
                  <option value="30000">3万</option>
                  <option value="50000">5万</option>
                </select>
                <span class="widget-warning">**</span>
                <button type="submit" class="widget-button ml60">确定充值</button>
                <div class="clear"></div>
              </p>
              <p class="mt10 widget-notice">（注：每次充值最低100元，并以100元的整数递增,如200，300，400，同时需要加尾数）</p>
            </form>
          </div>
        </div>
        <!-- 充值 end -->
        <!-- 充值明细 大概是一页10行数据 -->
        <div class="main-widget mt15">
          <p class="widget-title">近期充值</p>
          <p class="small-button-line"><%-- <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="/vipgo?status=1&secondThisState=${secondThisState}&thisState=${thisState}" id="J_rechargeDetailMore">充值明细</a> --%></p>
          <div class="widget-table mt5 middle-size">
            <table border="0" cellspacing="0" cellpadding="0">
              <thead>
	              <tr>
	                <th>用户名</th>
	                <th>最近充值</th>
	                <th>累计充值</th>
	                <th>购买日期</th>
	                <th>充值时间</th>
	                <th>充值方式</th>
	                <th>愿购买者</th>
	                <th>操作员</th>
	                <th>IP地址</th>
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
           <p class="widget-pages">
  <aldtags:pageTag paraStr="status,${status},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
        </div>
        <!-- 充值明细 end -->
      </div>
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
