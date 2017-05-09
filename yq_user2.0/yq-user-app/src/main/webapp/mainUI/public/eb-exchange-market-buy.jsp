<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.1236241067'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.1091369424'/>！');location.replace('vipup?my=${userName}&secondThisState=251&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，您还没达到D套餐，暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！');location.replace('vipup?my=${userName}&secondThisState=251&thisState=244');</script></c:if>

<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.-2082084233'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您好，您的积分数量不足，（认购一币作为诚信金），暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！');location.replace('vipup?my=${userName}&secondThisState=251&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.121840279'/>！');location.href='epjysc?secondThisState=253&thisState=244';</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='vipepmy.jsp.epmy.jsp.-1308925165'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='auditedis'/>！');history.go(-1);</script></c:if>


<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.624662580'/>|<s:text name='Dollar_subscription'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
   <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
    <div class="dialog-widget">
      <p class="dialog-title"><s:text name='Dollar_subscription'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget customer-service-center">
        <form class="widget-form" method="POST" action="epmy?ep=${ep}&status=1&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" onSubmit="return checkdate()">
          <p class="widget-notice mt15 ml10"><s:text name='vipwymy.jsp.wymy.jsp.-1234597066'/><b class="widget-warning" id="sec"></b><s:text name='vipwymy.jsp.wymy.jsp.-1234597066a'/>！</p>
          <p class="widget-tips mt15 ml10"><s:text name='vipepmy.jsp.epmy.jsp.768179352'/>“<b class="widget-warning"><s:text name='vipepmy.jsp.epmy.jsp.768179352a'/></b>”<s:text name='vipepmy.jsp.epmy.jsp.768179352b'/><b class="widget-warning">${txpay.payusername}</b><s:text name='vipepmy.jsp.epmy.jsp.768179352c'/><b class="widget-warning"><c:choose><c:when test="${txpay.paynum<900}" >${txpay.paynum*0.85}</c:when><c:otherwise>${txpay.paynum*0.90}</c:otherwise></c:choose><s:text name='yuan'/></b><s:text name='At_the_same_time,_the_login_platform_point_"money-_ Finance"_under_"subscription_details"_to_view_the_status_of_the_transaction_- _Publisher'/><b class="widget-warning">${txpay.payusername}</b><s:text name='vipepmy.jsp.epmy.jsp.768179352e'/><c:choose><c:when test="${txpay.paynum<900}" >${txpay.paynum*0.85}</c:when><c:otherwise>${txpay.paynum*0.90}</c:otherwise></c:choose><s:text name='vipepmy.jsp.epmy.jsp.768179352f'/>！</p>
          <p class="item mt15">
            <label class="title"><s:text name='Receiving_method_of_the_issuer'/>：</label><span class="text widget-warning">${txpay.paybank}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='Subscriber'/>：</label><span class="text">${userName}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='vipgpjymc.jsp.gpjymc.jsp.21392295'/>：</label><span class="text">${txpay.payusername}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='vipepmy.jsp.epmy.jsp.-1710734480'/>：</label><span class="text"><b class="widget-warning">${txpay.paynum}</b><s:text name='A_coin_(will be added to your "dollar - balance")'/></span></p>
          <p class="item">
            <label class="title"><s:text name='Subscriber_will_pay'/>：</label><span class="text"><b class="widget-warning"><c:choose><c:when test="${txpay.paynum<900}" >${txpay.paynum*0.85}</c:when><c:otherwise>${txpay.paynum*0.90}</c:otherwise></c:choose></b><s:text name='yuan'/></span></p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="epnm3" />
          </p>
          <p class="button-line mt15">
            <input type="submit" class="widget-button" value="<s:text name='vipepmy.jsp.epmy.jsp.941836283'/>" name="B1" />
          </p>
          <p class="widget-tips mt30 ml10 tc"><s:text name='viewindex2.jsp.index2.jsp.803273677'/>！</p>
          <p class="widget-tips mt10 ml10 tc"><s:text name='vipepmy.jsp.epmy.jsp.-1069342756'/>:<b class="widget-warning"><s:text name="vipepmy.jsp.epmy.jsp.643357742">QQ：${qq}</s:text></b>
            <a class="contact-qq" target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:613697152:41" alt="<s:text name='viewservice.jsp.service.jsp.488997268'/>" title="<s:text name='viewservice.jsp.service.jsp.488997268'/>"></a>
          </p>
          <p class="widget-tips widget-warning mt15 ml10 tc"><s:text name='Various_departments_service_center_personnel_division_of_order,_please_do_not_repeat_to_add_friends,_not_to_each_customer_service_at_the_same_time_to_consult_the_same_question,_thank_you_for_your_cooperation'/></p>
          <p class="button-line mt15 tc"><a class="widget-button-small" style="text-decoration: none" onclick="return confirm('<s:text name="Tip:_are_you_sure_you_want_to_cancel_this_transaction?"/>"')" href="epjysc?secondThisState=${secondThisState}&thisState=${thisState}"><s:text name='vipepmy.jsp.epmy.jsp.-246306007a'/></a></p>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.epnm3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    return false;
  }
  return true;
}
</script>
<script>
var secs = 60; //6为倒计时秒数
for (i = 0; i <= secs; i++) {
  window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
  if (num == secs) {
    alert('<s:text name='vipepmy.jsp.epmy.jsp.1346915146'/>！');
    location.replace('epmy');
  } else {
    printnr = secs - num;
    document.getElementById('sec').innerHTML = printnr;
  }
}
</script>
</body>

</html>
