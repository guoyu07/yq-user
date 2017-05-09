<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2086525283'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2053458535'/>0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2011642676'/>100！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.1881640416'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.1910864213'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.859836633'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('YB<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.655686'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-104104076'/>！');location.replace('datepay?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title><s:text name='Member_center'/>|<s:text name='Dollar_donation'/></title>
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
      <!-- 一笔捐助区 -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2003028320'/></p>
        <form class="widget-form" id="J_ebContributionForm" name="Form" method="POST" onSubmit="return checkdate()" action="ybPresent?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
          <div class="form-content eb-content">
            <p class="item">
              <label class="title"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.778584440'/>：</label>
              <input type="text" name="jzpay"  class="Donor-area-count"/>
            </p>
            <p class="item">
              <label class="title"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1306168857'/>：</label>
              <input type="password" name="pa" size="20" class="Donor-area-password"/>
            </p>
            <p class="item">
              <label class="title"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1603016952'/>：</label>
              <input type="password" name="pa3" size="20"/>
            </p>
            <p class="button-line mt15 tc">
              <button class="widget-button" type="submit" name="submit2" onClick='return confirm("<s:text name='vipepjysc.jsp.epjysc.jsp.1991539691'/>")'><s:text name='Donor_consent'/></button>
            </p>
          </div>
        </form>
      </div>
      <!-- 一笔捐助区 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript">
function checkdate() {
  if (Form.jzpay.value == "") {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1060233581'/>!");
    return false;
  }
  if (Form.jzpay.value < 99) {
    alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.387731406'/>100!");
    return false;
  }
  if (Form.jzpay.value > ${gcuser.pay}) {
    alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.387731406'/>"+${gcuser.pay});
    return false;
  }
  if (Form.pa3.value == "") {
    alert("<s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.-1396482625'/>!");
    return false;
  }
  if (Form.password.value == "") {
    alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1099634530'/>!");
    return false;
  }
  if (!chkinteger(Form.jzpay.value)) {
    alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1582955249'/>!');
    document.Form.jzpay.focus;
    return (false);
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
  return true;
}
</script>
</body>

</html>
