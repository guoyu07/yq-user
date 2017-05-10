<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>！');location.replace('mysl?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipdiyjygj.jsp.diyjygj.jsp.-791568500'/>！');location.replace('mysl?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='Systempurchasecannotberevoked'/>！');location.replace('mysl?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipqxqg.jsp.qxqg.jsp.1013019213'/>！');location.replace('mysl?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='The_current_release_of_the_points_to_buy_the_revocation'/></title>
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
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title"><s:text name='The_current_release_of_the_points_to_buy_the_revocation'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <form class="widget-form" method="POST" action="qxqg?status=1&qxid=${qxid}&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" onSubmit="return checkdate()">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><span class="text">${userName}</span></p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="pa3">
          </p>
          <p class="button-line mt10">
            <input type="submit" class="widget-button" value='<s:text name='vipbdreg.jsp.bdreg.jsp.-1719272165'/>' name="B1">
          </p>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.nm3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    return false;
  }
  return true;
}
</script>
</body>

</html>
