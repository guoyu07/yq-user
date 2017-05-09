<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1635825042'/>！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Business_management_system'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='Merchant_management'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
 <%--    <!-- 会员中心左边栏 -->
<div class="member-aside">
   <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <%@ include file="/mainUI/common/persionalinfo.jsp" %>
  <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
</div>
<!-- 会员中心左边栏 end -->
 --%>
    <div class="member-main-full">
      <!-- <s:text name='Business_management_system'/> -->
      <div class="main-widget mt15">
        <p class="widget-title-line">${gcuser.name}</p>
        <form class="widget-form" method="post" action="" id="Form" name="Form" onSubmit="return checkdate1()">
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.871323142'/>：</label><span class="text widget-warning">${gcuser.name}</span>
<!--             <input type="hidden" name="userName" value="${gcuser.username}" readonly>
 -->          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-535714675'/>：</label><span class="text widget-warning">${gcuser.username}<input type="hidden" name="sh" value="william123" readonly/></span>
            <input type="hidden" name="userName" value="${gcuser.username}" readonly>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="shpa">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.871278941'/>：</label>
            <input type="text" name="sfpay" onKeyUp="value=value.replace(/[^\d]/g,'');rst(this.value)"/>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.26044037'/>(2%)：</label>
            <input id="pay10" type="text" name="pay10" readonly>
            <input type="hidden" name="remark" value="12" readonly>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.675858010'/>：</label>
            <input id="ybpay" type="text" name="ybpay" readonly>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>
            <input type="text" name="user">
            <input type="button" class="widget-button-small" onClick="Check()" value="<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1725871048'/>" name="B3" style="cursor: pointer">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>：</label>
            <input type="password" name="pa01">
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="pa02" maxlength="20">
          </p>
          <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
            <input name="sfcode">
            <input id="btn" type="button" class="widget-button-small" onClick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2" style="cursor: pointer">
          </p>
          <p class="button-line mt15">
            <button type="submit" class="widget-button" name="submit2" onClick='return confirm("<s:text name='vipybsf.jsp.ybsf.jsp.1092946978a'/>")'><s:text name='vipybsf.jsp.ybsf.jsp.1092946978'/></button>
          </p>
        </form>
      </div>
      <!-- <s:text name='Business_management_system'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="javascript" src="/scripts/myarea.js"></script>
<script language="JavaScript">
function rst(n) {
  if (n != "") {
    document.getElementById('pay10').value = (n * 0.02).toFixed(0);
    document.getElementById('ybpay').value = (n * 1.02).toFixed(0);
  } else {
    document.getElementById('pay10').value = "";
    document.getElementById('ybpay').value = "";
  }
}


function Check() {
  if (Form.user.value == "") {
    alert("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
    Form.user.focus();
    return false;
  }
  var uName = document.Form.user.value;
  var data = null;
  $.post("yb?username=" + uName, data, function(response) {
    if (response.erroCodeNum == 0) {
      alert('<s:text name='yibi'/><s:text name='balance'/>:' + response.yb);
    } else {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1777679097'/>！');
    }
    return true;
  });
}

function checkdate() {
  if (Form.shpa.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-781315880'/>!");
    Form.shpa.focus();
    return false;
  }
  if (Form.sfpay.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1672844946'/>!");
    Form.sfpay.focus();
    return false;
  }
  if (Form.user.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.751820177'/>!");
    Form.user.focus();
    return false;
  }
  if (Form.pa01.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1841070946'/>!");
    Form.pa01.focus();
    return false;
  }
  if (Form.pa02.value == "") {
    alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1544222851'/>!");
    Form.pa02.focus();
    return false;
  }
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=11&toUserName=" + Form.user.value, data, function(response) {
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
  if (Form.shpa.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-781315880'/>!");
    Form.shpa.focus();
    return false;
  }
  if (Form.sfpay.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1672844946'/>!");
    Form.sfpay.focus();
    return false;
  }
  if (Form.user.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.751820177'/>!");
    Form.user.focus();
    return false;
  }
  if (Form.pa01.value == "") {
    alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1841070946'/>!");
    Form.pa01.focus();
    return false;
  }
  if (Form.pa02.value == "") {
    alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1544222851'/>!");
    Form.pa02.focus();
    return false;
  }
  //if (Form.sfcode.value=="") {   alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");  Form.sfcode.focus();   return false;    }
  var data = $("#Form").serialize();
  $.post("ybsf?status=1&secondThisState=${secondThisState}&thisState=${thisState}", data, function(response) {
    var responseMsg = response;
    if (responseMsg.erroCodeNum == 0) { //支付成功成功
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.801114631'/>！');
      delCookie("secondsremained");
      window.location.reload('ybsf?secondThisState=${secondThisState}&thisState=${thisState}');
      return false;
    } else if (responseMsg.erroCodeNum == 1) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1635825042'/>！');
      return false;
    } else if (responseMsg.erroCodeNum == 2) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1519470525'/>！');
      return false;
    } else if (responseMsg.erroCodeNum == 3) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.274591465'/>！');
      return false;
    } else if (responseMsg.erroCodeNum == 4) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-155027371'/>！');
      return false;
    } else if (responseMsg.erroCodeNum == 5) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1103003435'/>！');
      return false;
    } else if (responseMsg.erroCodeNum == 6) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.2037393748'/>！');
      return false;
    } else if (responseMsg.erroCodeNum == 7) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1747166923'/>！');
      return false;
    } else if (responseMsg.erroCodeNum == 8) {
      alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.2053058834'/>！');
      return false;
    }
  });
  return false;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');
</script>
</body>

</html>
