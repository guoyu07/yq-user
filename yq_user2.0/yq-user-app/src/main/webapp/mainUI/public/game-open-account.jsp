<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.476428411'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1060799146'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1541818965'/>！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.624662580'/>|<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewyjcx.jsp.yjcx.jsp.627723500'/> >> <s:text name='Activate_user'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->
<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
  <%--  <%@ include file="/mainUI/common/userLeft.jsp" %> --%>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <%@ include file="/mainUI/common/gameservice.jsp" %>
  <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/></p>
        <p class="small-button-line">
          <a class="widget-warning" href="javascript:history.back();"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></a>
        </p>
        <form class="widget-form" method="POST" action="bdreg?secondThisState=${secondThisState}&thisState=${thisState}" name="Form" onSubmit="return checkdate()">
          <input type="hidden" name="status" value="${status}">
          <p class="item">
            <label class="title"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.473018246'/>：</label><b class="widget-warning"><input type="hidden" name="up" readonly value="${myup}">${myup}</b></p>
          <p class="item">
            <label class="title"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1763852615'/>：</label>
            <input type="text" name="bduser" value="${bdid}" /><span class="text"> <s:text name='vipsgreg.jsp.sgreg.jsp.1036238299'/></span></p>
          <p class="item">
            <label class="title"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1123565209'/>：</label>
            <select class="widget-select" name="cjpay">
              <option selected value="0">==<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.35003772'/>==</option>
              <option value="10000">1<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
              <option value="20000">2<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
              <option value="50000">5<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
              <option value="1000">1<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
              <option value="2000">2<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
              <option value="5000">5<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
            </select>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1306168857'/>：</label>
            <input type="password" name="pa1j" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1603016952'/>：</label>
            <input type="password" name="pa2j" />
          </p>
          <p class="widget-notice mt15"><s:text name='The_fee_will_be_from_your'/>(<span class="widget-warning">${userName}</span>)<s:text name='A_coin_or_currency_account_deduction_declaration'/></p>
          <p class="button-line mt15">
            <button type="submit" class="widget-button"><s:text name='submit'/></button>
          </p>
        </form>
      </div>
      <!-- <s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.bduser.value == "") {
    alert("<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.-982824489'/>!");
    return false;
  }
  if (Form.cjpay.value == 0) {
    alert("<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1811747578'/>！");
    return false;
  }
  if (Form.pa1j.value == "") {
    alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1099634530'/>！");
    return false;
  }
  if (Form.pa2j.value == "") {
    alert("<s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.-1396482625'/>！");
    return false;
  }
  return true;
}
</script>
</body>

</html>
