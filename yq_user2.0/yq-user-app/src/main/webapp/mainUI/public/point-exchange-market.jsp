<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewlogin3j.jsp.login3j.jsp.624662580'/>|<s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
 <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
 <%-- <link rel="stylesheet" href="${ctx}/css/point-exchange-market${SESSION_LOCALE}.css"> --%> 
</head>

<body> 
<!-- 通用头部 -->
 <%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->


<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='viewjflc.jsp.jflc.jsp.951062035'/></p>
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
        <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <!-- <s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/> -->
    <div class="member-main">
      <div class="main-widget">
        <p class="widget-title"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></p>
        <div class="point-exchange">
          <div class="exchange-price-now">
            <p class="title"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.1460814497'/></p>
            <p class="price">${fcxt.jygj}</p>
          </div>
          <div class="exchange-price-info">
            <a href="/mcsl?secondThisState=${secondThisState}&thisState=${thisState}" class="exchange-btn btn-sale"><s:text name='I_want_to_sell'/></a>
            <div class="exchange-price">
              <table class="exchange-price-table" align="center" border="0" cellspacing="0" cellpadding="0">
                <thead>
                  <tr>
                    <th><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.24334879'/></th>
                    <th><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.26588703'/></th>
                    <th><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.25989225'/></th>
                    <th><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.938311'/></th>
                    <th><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.625926272'/></th>
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
            <a href="/mysl?secondThisState=${secondThisState}&thisState=${thisState}" class="exchange-btn btn-buy"><s:text name='I_want_to_buy'/></a>
          </div>
          <p class="warning-tips"><span><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.1370943275'/></p>
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
    <!-- <s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/> end -->
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
