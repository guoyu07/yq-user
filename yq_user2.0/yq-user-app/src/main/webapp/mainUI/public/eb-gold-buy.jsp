<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1616194221'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.670003458'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('手机验证码为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.39306141'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.200453681'/>！');location.href='datepay?secondThisState=${secondThisState}&thisState=${thisState}'</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='vipadmin_menu.jsp.admin_menu.jsp.618950045'/></p>
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
        <p class="widget-title-line"><s:text name='Buy_gold_coin_card_rules'/></p>
        <div class="widget-article">
          <p class="widget-tips"><s:text name='Press'/><span class="widget-warning"><s:text name='15-_a_coin_-_buy_10_gold_coins'/></span><s:text name='After_the_success_of_the_corresponding_gold_card'/>
            <br/><s:text name='To'/><span class="widget-warning"><s:text name='Gold_coin_management'/></span><s:text name='lower'/><a href="gmjh?secondThisState=251&thisState=244"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></a>！</p>
        </div>
      </div>
      <!-- <s:text name='Buy_gold_coin_card_rules'/> end -->
      <!-- <s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/> -->
      <div class="main-widget mt10">
        <div class="widget-article">
          <form method="POST" action="jztojb?status=1&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" onSubmit="return checkdate()">
            <p class="widget-notice mt15"><b><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1898581836'/>：</b></p>
            <p class="select-line">
              <select class="widget-select mt10" name="gmmj">
                <option value="0" selected="">==<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-697677804'/>==</option>
                <option value="1">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</option>
                <option value="5">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</option>
                <option value="10">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</option>
                <option value="30">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</option>
                <option value="50">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</option>
                <option value="100">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</option>
              </select>
              <span class="widget-warning">**</span>
              <button type="submit" class="widget-button ml60"><s:text name='Determine_purchase'/></button>
              <div class="clear"></div>
            </p>
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
  if (Form.gmmj.value == 0) {
    alert("<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.640107298'/>!");
    return false;
  }
  return true;
}
</script>
</body>

</html>
