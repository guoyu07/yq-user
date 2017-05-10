<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.624662580'/>|<s:text name='Confirm_release_buy'/></title>
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
       <div class="member-main-full">
      <!-- <s:text name='Confirm_release_buy'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Confirm_release_buy'/></p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=2&txpay=${txpay}&secondThisState=${secondThisState}&thisState=${thisState}">
            <p class="item">
              <label class="title"><s:text name='You_want_to_buy_the_number_of_points'/></label><span class="text">${txpay}</span>
            </p>
            <p class="item">
              <label class="title"><s:text name='Current_unit_price'/></label><span class="text">${jygj}</span>
            </p>
            <p class="item">
              <label class="title"><s:text name='Will_be_deducted_from_your_gold_account'/></label><span class="text"><b class="widget-warning">${needJf}</b><s:text name='Gold'/></span>
            </p>
            <p class="button-line mt15">
              <button type="submit" class="widget-button" onclick="bitch()"><s:text name='Definite_buying'/></button>
            </p>
          </form>
        </div>
      </div>
      <!-- <s:text name='Confirm_release_buy'/> end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
function bitch() {
  if (confirm("<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？")) {
    location.href = "/mysl?status=2&txpay=${txpay}&secondThisState=${secondThisState}&thisState=${thisState}";
  }
}
</script>
</body>

</html>
