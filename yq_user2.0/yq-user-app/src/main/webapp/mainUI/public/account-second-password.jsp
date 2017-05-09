<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.624662580'/>|<s:text name='Two_password_recovery'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Account_manage'/> >> <s:text name='Two_password_recovery'/></p>
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='Two_password_recovery'/> -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='Two_password_recovery'/></p>
        <form class="widget-form" action="" name="Form" id="Form" onSubmit="return false" method="post">
          <p class="item mt15">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>
            <input type="text" name="toUserName" value="${gcuser.username}" readonly/>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1097750138'/>：</label>
            <input type="password" name="newSecondPassword1" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')"/>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1453674956'/>：</label>
            <input type="password" name="newSecondPassword2" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')"/>
          </p>
          <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1010247606'/>：</label>
            <span class="text">${gcuser.call}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='enter.phone.number'/>：</label>
            <input type="text" id="inputCall" name="inputCall" tabindex="18"/>
          </p>
          <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
            <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')">
            <input class="widget-button-small" name="B2" id="btn" type="button" onclick="checkdate('#SESSION_LOCALE')" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>"/>
          </p>
          <p class="button-line mt15">
            <button type="submit" name="B1" class="widget-button" onClick="checkdate1();"><s:text name='To_update'/></button>
          </p>
        </form>
      </div>
      <!-- <s:text name='Two_password_recovery'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function CheckIfEnglish(str) {
  if (/[a-z]/.test(str) && /[0-9]/.test(str)) {
    return true;
  } else {
    return false;
  }
}

function checkdate(s) {

  var languege = s;
  if (Form.newSecondPassword1.value == "") {
    alert("<s:text name='vipupuser.jsp.upuser.jsp.1443750521'/>！");
    Form.newPassWord1.focus();
    return false;
  }
  if (!CheckIfEnglish(Form.newSecondPassword1.value)) {
    alert("<s:text name='vipupuser.jsp.upuser.jsp.-1791992834'/>！");
    Form.newPassWord1.focus();
    return false;
  }
  if (Form.newSecondPassword1.value.length > 18 || Form.newSecondPassword1.value.length < 6) {
    alert("<s:text name='vipupuser.jsp.upuser.jsp.-976914480'/>!");
    Form.newPassWord1.focus();
    return false;
  }
  if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {
    alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-947047850'/>！");
    Form.newPassWord1.focus();
    return false;
  }
  if (Form.inputCall.value == "") {
    alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");
    Form.inputCall.focus();
    return false;
  }
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms2?op=18&status=8", data, function(response) {
    if (response.erroCodeNum == 2) {
      alert('<s:text name='Enter_phone_number_error'/>！');
      $("#btn").attr("disabled", false);
      Form.inputCall.focus();
      return false;

    }
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
  });
  return true;
}

function checkNumber() {
  if (Form.inputCall.value == "") {
    alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");
    Form.inputCall.focus();
    return false;
  }
  var data = $("#Form").serialize();
  $.post("/checkUserParam?status=8", data, function(response) {
    if (response.erroCodeNum == 1) {
      alert('<s:text name='dones.not.exist.username'/>！');
      return false;
    }
    if (response.erroCodeNum == 2) {
      alert('<s:text name='Enter_phone_number_error'/>！');
      Form.inputCall.focus();
      return false;
    }
  });

}

function checkdate1() {
	if (Form.name.value == "") {
	    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-153330493'/>！");
	    Form.name.focus();
	    return false;
	  }
	  if (Form.newSecondPassword1.value == "") {
	    alert("<s:text name='vipupuser.jsp.upuser.jsp.1443750521'/>！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (!CheckIfEnglish(Form.newSecondPassword1.value)) {
	    alert("<s:text name='vipupuser.jsp.upuser.jsp.-1791992834'/>！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (Form.newSecondPassword1.value.length > 18 || Form.newSecondPassword1.value.length < 10) {
	    alert("<s:text name='vipupuser.jsp.upuser.jsp.-976914480'/>！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {
	    alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-947047850'/>！");
	    Form.newPassWord1.focus();
	    return false;
	  }
	  if (Form.inputCall.value == "") {
	    alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");
	    Form.inputCall.focus();
	    return false;
	  }
  if (Form.smsCode.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");
    Form.smsCode.focus();
    return false;
  }
  var data = $("#Form").serialize();

  $.post("/reSetSecondPass?status=7", data, function(response) {
    if (response.erroCodeNum == 0) { //重置成功
       delCookie("secondsremained");
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.1543820152'/>！');
      location.replace('../index.jsp?id=' + Form.toUserName.value);
    } else if (response.erroCodeNum == 1) {
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-1597545170'/>');
      return;
    } else if (response.erroCodeNum == 2) {
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-1020311822'/>!');
      return;
    } else if (response.erroCodeNum == 3) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.806188307'/>!");
      return;
    } else if (response.erroCodeNum == 4) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.436948753'/>!");
      return;
    }else if(response.erroCodeNum == 5){
    	alert("<s:text name='modifyself'/>!");
        return;
    } else {
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-745085746'/>.[' + response.erroCodeNum + ']');
      return;
    }
  });
  return true;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"),'#SESSION_LOCALE');
</script>
</body>

</html>
