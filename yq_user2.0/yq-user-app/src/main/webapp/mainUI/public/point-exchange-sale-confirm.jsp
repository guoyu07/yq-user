<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-949213936'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1341989901'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-498016988'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.440060053'/> 0.77 ！');history.go(-1);</script></c:if>

<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2045778169'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.115010359'/>！');history.go(-1);</script></c:if>


<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.-2099694066a'/>!');location.replace('gpjy?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.624662580'/>|<s:text name='Confirm_release'/></title>
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
        <%-- <%@ include file="/mainUI/common/userLeft.jsp" %> --%>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='Confirm_release_buy'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Re_confirm_whether_the_listing_sold'/></p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
            <p class="item">
              <label class="title"><s:text name='You_want_to_sell_the_number_of_points'/>：</label><span class="text">${txpay}</span>
            </p>
            <p class="item">
              <label class="title"><s:text name='Select_unit_price'/>：</label><span class="text">${jygj}</span>
            </p>
            <p class="mt10"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-1122443397'/>：</p>
            <p class="item mt10">
              <label class="title"><s:text name='Deduct_10%_commission_you_get'/>：</label><span class="text"><b class="widget-warning">${dqpay}</b></span>
            </p>
            <p class="item">
              <label class="title"><s:text name='vipwymc.jsp.wymc.jsp.-1140375188'/></label><span class="text"><b class="widget-warning">${mc65}</b></span>
            </p>
            <p class="item">
              <label class="title"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-817911047'/>：</label><span class="text"><b class="widget-warning">${mc30}</b></span>
            </p>
             <p class="item">
              <label class="title"><s:text name='vipwymc.jsp.wymc.jsp.-1140375188a'/></label><span class="text"><b class="widget-warning">${mc5}</b></span>
            </p>
            <p class="button-line mt15">
              <a href="/mcsl?status=2&txpay=${txpay}&jygj=${jygj}&secondThisState=${secondThisState}&thisState=${thisState}" class="widget-button"><s:text name='vipepmy.jsp.epmy.jsp.941836283'/></a>
            </p>
          </form>
          <p class="widget-warning mt15"><s:text name='vipmcsl2.jsp.mcsl2.jsp.21752002'/>！</p>
        </div>
      </div>
      <!-- <s:text name='Confirm_release_buy'/> end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
