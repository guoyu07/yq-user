<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipdiyjygj.jsp.diyjygj.jsp.-791568500'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-949213936'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.624662580'/>|<s:text name='integral_sell'/></title>
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
  <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='integral_sell'/></p>
        <form class="widget-form" action="/wymc?status=1&id=${id}&secondThisState=${secondThisState}&thisState=${thisState}" method="POST" onSubmit="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')">
          <p class="item">
            <lable class="title"><s:text name='vipwymc.jsp.wymc.jsp.-1871713252'/>：</lable>
            <span class="text widget-warning">${gpjy.mysl}</span>
          </p>
          <p class="item">
            <lable class="title"><s:text name='vipwymc.jsp.wymc.jsp.1883427228'/></lable>
            <span class="text widget-warning">${gpjy.mysl}</span><s:text name='point'/>
          </p>
          <p class="item">
            <lable class="title"><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1002343016a'/>：</lable>
            <span class="text widget-warning"><c:if test="${gpjy.pay<1}">0${gpjy.pay}</c:if><c:if test="${gpjy.pay>=1}">${gpjy.pay}</c:if></span>
          </p>
          <p class="item">
            <lable class="title"><s:text name='Totalamount'/>：</lable>
            <span class="text widget-warning">${gpjy.jypay}</span>
          </p>
          <p class="item">
            <lable class="title"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-1122443397'/>：</lable>
           <%--  <span class="text widget-warning">${dqpay}</span> --%>
          </p>
          <p class="item">
            <lable class="title"><s:text name='Deduct_10%_commission_you_get'/>：</lable>
            <span class="text widget-warning">${dqpay}</span><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>
          </p>
          <p class="item">
            <lable class="title"><s:text name='vipwymc.jsp.wymc.jsp.-1140375188'/></lable>
            <span class="text widget-warning">${mc70}</span><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>
          </p>
          <p class="item">
            <lable class="title"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-817911047'/>：</lable>
            <span class="text widget-warning">${mc30}</span><s:text name='Gold'/>
          </p>
          <p class="item">
            <lable class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>:</lable>
            <input type="password" name="pa3" />
          </p>
          <p class="button-line mt15">
            <input type="submit" class="widget-button" value="<s:text name='vipepmy.jsp.epmy.jsp.941836283'/>" name="B1" />
          </p>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
