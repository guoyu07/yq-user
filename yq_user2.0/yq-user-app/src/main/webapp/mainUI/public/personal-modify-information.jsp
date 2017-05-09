<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.472164400'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Account_manage'/> >> <s:text name='The_same_account_management'/></p>
   <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/> -->
      <!-- <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/></p>
        <div class="widget-article">
          <p class="widget-notice"><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc">《平台用户名转让申请书》</a></p>
        </div>
      </div> -->
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/> end -->
      <!-- <s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.472164400'/> -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.472164400'/></p>
        <p class="small-button-line"><!-- <a href="updateuserjc" class="widget-button-small"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.709350807'/></a> --></p>
        <form class="widget-form" method="post" action="" name="Form" id="Form" onSubmit="return false">
          <input type="hidden" name="remark" size="5" value="2" readonly>
          <input type="hidden" name="targetdate" size="8">
          <input type="hidden" name="xmlmode" size="8">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><span class="text">${gcuser.username}</span>
            <input type="hidden" name="userName" size="20" value="${gcuser.username}" readonly>
          </p>
          <p class="item">
            <label class="title widget-warning"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-800902043'/>：</label>
            <input type="password" name="newPassWord1" maxlength="18" onKeyUp="value=value.replace(/[\W]/g,'')" />
          </p>
          <p class="item">
            <label class="title widget-warning"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1750523051'/>：</label>
            <input type="password" name="newPassWord2" tabindex="18" onKeyUp="value=value.replace(/[\W]/g,'')" />
          </p>
          <p class="item">
            <label class="title widget-warning"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1097750138'/>：</label>
            <input type="password" name="newSecondPassword1" maxlength="20" onKeyUp="value=value.replace(/[\W]/g,'')" />
          </p>
          <p class="item">
            <label class="title widget-warning"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1453674956'/>：</label>
            <input type="password" name="newSecondPassword2" maxlength="20" onKeyUp="value=value.replace(/[\W]/g,'')" />
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.734362'/>：</label><span class="text">${gcuser.name}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.799485150'/>：</label>
            <select name="bank" id="" class="widget-select">
              <option selected value="${gcuser.bank}">${gcuser.bank}</option>
              <option value="<s:text name='reg.jsp.reg.jsp.-453899062'/>"><s:text name='reg.jsp.reg.jsp.-453899062'/></option>
              <option value="<s:text name='reg.jsp.reg.jsp.1781968004'/>"><s:text name='reg.jsp.reg.jsp.1781968004'/></option>
              <option value="<s:text name='reg.jsp.reg.jsp.691148048'/>"><s:text name='reg.jsp.reg.jsp.691148048'/></option>
              <option value="<s:text name='reg.jsp.reg.jsp.1019445992'/>"><s:text name='reg.jsp.reg.jsp.1019445992'/></option>
            </select>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.799409753'/>：</label>
            <input type="text" name="card" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="19" value="${gcuser.card}" //>
          </p>
          <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1010247606'/>：</label><span class="text">${interRegionCode.country_name}${gcuser.call}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1050407'/>QQ/Email：</label><span class="text">${gcuser.qq}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1768474821'/>：</label>
            <select class="widget-select" name="provinceName" OnChange="ChangeProvince(document.getElementById('provinceName').options[document.getElementById('provinceName').selectedIndex].value);" id="provinceName">
              <option selected="selected" value="${gcuser.addsheng}">${gcuser.addsheng}</option>
              <s:iterator var="data" value="provinceList">
				           <option value="${data.b}">${data.b}</option>
				</s:iterator>
				<option value="<s:text name='abroad'/>"><s:text name='abroad'/></option>
            </select>
            <select class="widget-select" name="cityName" onChange="ChangeCity(document.getElementById('cityName').options[document.getElementById('cityName').selectedIndex].value);" id="cityName">
              <option selected="selected" value="${gcuser.addshi}">${gcuser.addshi}</option>
            </select>
            <select class="widget-select" name="areaName"  id="areaName">
              <option selected="selected" value="${gcuser.addqu}">${gcuser.addqu}</option>
            </select>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1875608565'/>：</label>
            <input type="password" name="secondPassword" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-386556444'/>：</label>
            <input type="text" name="idCard" maxlength="19" /><span class="text">${gcuser.userid}</span>
          </p>
          <p class="item">
                      
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
            <input type="text" name="smsCode" size="20"  onKeyUp="value=value.replace(/[\W]/g,'')"/>
            <input class="widget-button-small" id="btn" type="button" onclick="sendMsg()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>"/>
           <!--  <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"/><a href="javascript:void(0);" class="widget-button-small" onclick="sendMsg()"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/></a> -->
          </p>
          <p class="widget-tips widget-warning mt10"><s:text name='Just_modify_a_username._Other_similar_accounts_unified_update!'/></p>
          <p class="button-line mt15">
            <button type="submit" class="widget-button" onClick="checkdate1();"><s:text name='vipuserga.jsp.userga.jsp.1384157160'/></button>
          </p>
        </form>
      </div>
      <!-- <s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.472164400'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/myarea.js"></script>

<script language="JavaScript">
function CheckIfEnglish(str) {
  if (/[a-z]/.test(str) && /[0-9]/.test(str)) {
    return true;
  } else {
    return false;
  }
}

function checkdate() {

  if (Form.name.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-153330493'/>！");
    Form.name.focus();
    return false;
  }
  if (Form.newPassWord1.value != "" || Form.newPassWord2.value != "") {
    if (Form.newPassWord1.value != Form.newPassWord2.value) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.856129909'/>！");
      Form.newPassWord1.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.newPassWord1.value)) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-627569921'/>！");
      Form.newPassWord1.focus();
      return false;
    }
    if (Form.newPassWord1.value.length > 18 || Form.newPassWord1.value.length < 6) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-525641962'/>！");
      Form.newPassWord1.focus();
      return false;
    }
  }
  if (Form.newSecondPassword1.value != "" || Form.newSecondPassword2.value != "") {
    if (Form.newSecondPassword1.value != Form.newSecondPassword2.value) {
      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-947047850'/>！");
      Form.newPassWord1.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.newSecondPassword1.value)) {
      alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-1932694410'/>！");
      Form.newSecondPassword1.focus();
      return false;
    }
    if (Form.newSecondPassword1.value.length < 10) {
      alert("<s:text name='reg.jsp.reg.jsp.908634376'/>!");
      Form.newSecondPassword1.focus();
      return false;
    }
    if (Form.newSecondPassword1.value.length > 20) {
      alert("<s:text name='reg.jsp.reg.jsp.653975038'/>!");
      Form.newSecondPassword1.focus();
      return false;
    }
  }
  if (Form.bank.value == "") {
    alert("<s:text name='reg.jsp.reg.jsp.1996388245'/>！");
    Form.bank.focus();
    return false;
  }
  if (Form.card.value == "") {
    alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1712677638'/>！");
    Form.card.focus();
    return false;
  }
  if (Form.provinceName.value == 0) {
    alert("<s:text name='reg.jsp.reg.jsp.-145275757'/>!");
    return false;
  }
  if (Form.cityName.value == 0) {
    alert("<s:text name='reg.jsp.reg.jsp.-145519509'/>!");
    return false;
  }
  if (Form.areaName.value == 0) {
    alert("<s:text name='reg.jsp.reg.jsp.-145527167'/>!");
    return false;
  }
  /* if (Form.areaCode.value=="") {      alert("<s:text name='emptyinternationalareacode'/>!");      return false;    } */
  if (Form.secondPassword.value == "") {
    alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1544222851'/>！");
    Form.secondPassword.focus();
    return false;
  }
  if (Form.idCard.value == "") {
    alert("<s:text name='reg.jsp.reg.jsp.-1745964948'/>！");
    Form.idCard.focus();
    return false;
  }

  return true;
}
function sendMsg() {
  if (!checkdate()) {
    return;
  }
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=1", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
  });
} 

function checkdate1() {
  if (Form.smsCode.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");
    Form.smsCode.focus();
    return false;
  }
  if (!checkdate()) {
    return;
  }
  var data = $("#Form").serialize();
  $.post("userga?status=2", data, function(response) {
    if (response.erroCodeNum == 0) { //更新成功
      alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.606198600'/>！');
      location.replace('../index.jsp?id=' + Form.userName.value);
    } else if (response.erroCodeNum == 1) {
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-1597545170'/>');
      return;
    } else if (response.erroCodeNum == 2) {
      alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.39306141'/>！');
      return;
    } else if (response.erroCodeNum == 3) {
      alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-869667680'/>！');
      return;
    } else if (response.erroCodeNum == 4) {
      alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.698939873'/>！');
      return;
    } else if (response.erroCodeNum == 5) {
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.856129909'/>！');
      return;
    } else if (response.erroCodeNum == 6) {
      alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.-947047850'/>！');
      return;
    } else {
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-745085746'/>.[' + response.erroCodeNum + ']');
      return;
    }
  });
  return true;
}
</script>
<script language="javascript" type="text/javascript">
function ChangeProvince(subid) {

  document.getElementById("cityName").length = 0;
  var subid = subid;
  var i;
  document.getElementById("cityName").options[0] = new Option('==<s:text name='reg.jsp.reg.jsp.-145519509'/>==', '0');
  for (i = 0; i < subCity.length; i++) {
    if (subCity[i][1] == subid) {
      document.getElementById("cityName").options[document.getElementById("cityName").length] = new Option(subCity[i][0], subCity[i][2]);
    }
  }
  ChangeCity(0)
}

function ChangeCity(subid) {
  document.getElementById("areaName").length = 0;
  var subid = subid;
  var i;
  document.getElementById("areaName").options[0] = new Option('==<s:text name='reg.jsp.reg.jsp.-145527167'/>==', '0');
  for (i = 0; i < subArea.length; i++) {
    if (subArea[i][1] == subid) {
      document.getElementById("areaName").options[document.getElementById("areaName").length] = new Option(subArea[i][0], subArea[i][2]);
    }
  }
}

function AmendCity(ProvinceID, CityID, AreaID) {
  ChangeProvince(ProvinceID);
  for (var i = 1; i < document.getElementById("cityName").length; i++) {
    if (document.getElementById("cityName").options[i].value == CityID) {
      document.getElementById("cityName").options[i].selected = true;
    }
  }
  ChangeCity(CityID);
  for (var i = 1; i < document.getElementById("areaName").length; i++) {
    if (document.getElementById("areaName").options[i].value == AreaID) {
      document.getElementById("areaName").options[i].selected = true;
    }
  }
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');
</script>
</body>

</html>
