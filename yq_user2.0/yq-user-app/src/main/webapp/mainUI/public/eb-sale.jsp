<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1713705348'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.834213896'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1543089961'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-817035023'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.2053058834='/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.165401067'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.939890499'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1027680370'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.2057159235'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='VIP_users_can_not_withdraw_cash'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='nosuremanytimesforclose'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='cannotcash'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==-1}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1862966729'/>！');location.replace('epmcjl?secondThisState=249&thisState=244');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.624662580'/>|<s:text name='Sell_a_dollar'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> <!-- 通用头部 -->
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
      <!-- <s:text name='One_dollar_note'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='One_dollar_note'/></p>
        <div class="widget-article">
          <p class="widget-tips"><s:text name='A_minimum_of_100_dollars'/></p>
          <p class="widget-tips widget-warning mt15"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.476105277'/></p>
        </div>
      </div>
      <!-- <s:text name='One_dollar_note'/> end -->
      <!-- 当前卖出一币的账户信息 -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='Confirm_current_account_information'/></p>
        <from class="widget-form">
          <p class="item mt15">
            <label class="title"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.931750201'/>：</label><span class="text">${gcuser.name}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg2.jsp.reg2.jsp.775723385'/>：</label><span class="text">${gcuser.simpleCall}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.799099710'/>：</label><span class="text">${gcuser.bank}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1141649'/>：</label><span class="text">${gcuser.card}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='vipuserpay.jsp.userpay.jsp.24185845'/>：</label><span class="text">${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}<s:text name='vipuserpay.jsp.userpay.jsp.837885'/></span>
          </p>
        </from>
      </div>
      <!-- 当前卖出一币的账户信息 end -->
      <!-- 一币卖出表单 -->
      <div class="main-widget mt15">
        <form class="widget-form mt15" method="POST" name="Form" id="Form" onSubmit="return checkdate1()" action="userpay?status=1">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><span class="text User-name">${userName}</span></p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-586037884'/>：</label>
            <select class="widget-select Dollar-amount" name="txpay">
              <option selected value="0">=<s:text name='Choose_a_dollar_to_sell_quantity'/>=</option>
              <option value="100">100</option>
              <option value="200">200</option>
              <option value="500">500</option>
              <option value="1000">1000</option>
              <option value="2000">2000</option>
              <option value="5000">5000</option>
              <option value="10000">10000</option>
              <option value="20000">20000</option>
              <option value="30000">30000</option>
            </select>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input name="pa3" type="password" />
          </p>
          <p class="button-line mt15 tc">
            <button class="widget-button" type="submit" id="btn" onClick='return confirm("<s:text name='vipuserpay.jsp.userpay.jsp.-1517150275a'/>")'><s:text name='Sell_out'/></button>
          </p>
        </form>
        <p class="widget-tips widget-warning mt15"><s:text name='_please_check_the_following_information'/><a href="login2j?inputUrl=login2j.jsp"><b><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.472164400'/></b></a>，<s:text name='Sell_again!_If_you_do_not_seriously_check,_resulting_in_the_payment_is_not_successful,_the_pen_will_be_frozen,_the_application_will_be_charged_20%_yuan_fee_thaw!'/></p>
      </div>
      <!-- 一币卖出表单 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
/*验证交互*/
function checkdate() {
  if (Form.txpay.value == 0) {
    alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-861806777'/>!");
    return false;
  }
  if (!chkinteger(Form.txpay.value)) {
    alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.431301541'/>!');
    document.Form.txpay.focus;
    return false;
  }

  function chkinteger(checkStr) {
    var checkOK = "0123456789";
    var allValid = true;
    for (i = 0; i < checkStr.length; i++) {
      ch = checkStr.charAt(i);
      if (checkOK.indexOf(ch) == -1) {
        allValid = false;
        break;
      }
      if ((ch == '+' || ch == '-') && i > 0) {
        allValid = false;
        break;
      }
    }
    return (allValid);
  }


  if (Form.txpay.value > ${gcuser.pay}) {
	  <c:if test="${transferType==1}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977'/>"); </c:if> <c:if test="${transferType==2}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977a'/>"); </c:if>     return false;   
  }
  if (Form.txpay.value < 100) {
    alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1837041227'/>!");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=3", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
  });
  return false;
}

function checkdate1() {
  if (Form.ybcodeid.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");
    Form.ybcodeid.focus();
    return false;
  }
  return true;
}
</script>
</body>

</html>
