<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.624662580'/>|<s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> 
<!-- 通用头部 -->
<div class="header" id="J_header">
  <%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
     <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
     <div class="member-main-full">
      <!-- <s:text name='Buy_gold_coin_card_rules'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></p>
        <div class="widget-article">
          <p class="widget-tips"><s:text name='Your_dollar_surplus'/><b class="widget-warning">${pay}</b></p>
        </div>
      </div>
      <!-- <s:text name='Buy_gold_coin_card_rules'/> end -->
      <!-- <s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/> -->
      <div class="main-widget mt10">
        <div class="widget-article">
          <form class="widget-form" method="POST" action="jztojb?status=2&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" onSubmit="return checkdate()">
            <p class="item">
              <label class="title"><s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.408193998'/>：</label><span class="text">
              	<c:if test="${gmmj==1}">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</c:if>
               	<c:if test="${gmmj==5}">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</c:if>
                <c:if test="${gmmj==10}">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</c:if>
                <c:if test="${gmmj==30}">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</c:if>
                <c:if test="${gmmj==50}">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</c:if>
               <c:if test="${gmmj==100}">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</c:if>
              </span></p>
            <p class="widget-notice mt15"><b><s:text name='Please_choose_the_quantity_to_be_purchased:'/></b></p>
            <p class="select-line">
              <select class="widget-select" name="gmsl">
                <option value="0" selected="">==<s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.-145398058'/>==</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
              </select>
              <span class="widget-warning">**</span>
              <button type="submit" class="widget-button ml60"><s:text name='Determine_purchase'/></button>
              <!-- 下一个页面是 eb-gold-buy-confirm.html -->
            </p>
            <input type="hidden" name="mj" size="5" value="${gmmj}0" readonly="">
          </form>
        </div>
      </div>
      <!-- <s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/> end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
/*验证交互*/
  function checkdate() {
    if (Form.gmsl.value == 0) {
      alert("<s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.2026567304'/>!");
      return false;
    }
    return true;
  }
</script>
</body>

</html>
