<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymy.jsp.gpjymy.jsp.624662580'/>|<s:text name='Integrated_recharge_remittance_confirmation'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> 
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='Gold_coin_management'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
   <div class="member-main-full">
      <!-- <s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.855113397'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.855113397'/></p>
        <div class="widget-article">
          <p><s:text name='viewindex2.jsp.index2.jsp.803273677'/>！</p>
          <p class="mt10"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-836674711'/>:
            ${cz01}<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-836674711a'/>:${qq}<a target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=613697152&amp;site=qq&amp;menu=yes"><s:text name='viewservice.jsp.service.jsp.488997268'/></a>
          </p>
          <p class="widget-warning mt10"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-1381859196'/>。</p>
          <br>
          <p><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1839200756'/>
<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1316609687'/>
          </p>
        </div>
      </div>
      <!-- <s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.855113397'/> end -->
      <!-- <s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.853151501'/> -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.853151501'/></p>
        <div class="widget-article">
          <p class="f30"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1536312008'/></p>
          <p class="widget-tips mt15">（<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1634195660'/>）</p>
          <p class="widget-tips mt10"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.578779497'/></p>
          <p class="widget-warning f30 tc mt20"><a href="/bank?dq=${gcuser.dqu}"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.578779497a'/></a></p>
        </div>
      </div>
      <!-- <s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.853151501'/> end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
