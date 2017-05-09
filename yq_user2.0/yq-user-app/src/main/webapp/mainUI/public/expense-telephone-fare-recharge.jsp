<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-265534370'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-2137282093'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.111039607'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1068487521'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.410350332'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1213017603'/>！');history.go(-1);</script></c:if>


<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Charge_recharge_(100)'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.871093494'/> </p>
     <ul class="nav-secondary">
    	<%@ include file="/mainUI/common/xfgl.jsp" %>
    </ul>
  </div>
</div>
<!-- 会员中心导航模块 end -->
<!-- 消费管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/>（100） -->
      <div class="main-widget">
        <%-- <p class="widget-title-line"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/>（100）</p>
        <form class="widget-form" action="?status=1" method="post" onSubmit="return checkdate1()" name="Form" id="Form">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><span class="text widget-warning">${userName}</span>
          </p>
          <p class="item">
            <label class="title widget-warning"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.772129628'/>：</label>
            <input type="text" name="call" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1462957751'/>：</label>
            <input type="text" name="call2" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/>：</label><span class="text">100</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.26044037'/>(10%)：</label><span class="text">10</span></p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.675858010'/>：</label><span class="text">110</span></p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="pa3" />
          </p>
          <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
            <input type="text" name="smsCode" />
            <input class="widget-button-small" id="btn" type="button" onclick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2" />
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-204321051a'/></button>
          </p> --%>
        </form>
      </div>
      <!-- <s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/>（100） end -->
    </div>
  </div>
</div>
</div>
<!-- 消费管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.call.value == "") {
    alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>!");
    Form.call.focus();
    return false;
  }
  if (Form.call2.value == "") {
    alert("<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-2071172198'/>!");
    Form.call2.focus();
    return false;
  }
  if (Form.call.value.length < 11) {
    alert("<s:text name='reg.jsp.reg.jsp.-415194682'/>!");
    Form.call.focus();
    return false;
  }
  if (Form.call.value.length > 11) {
    alert("<s:text name='reg.jsp.reg.jsp.-669883811'/>!");
    Form.call.focus();
    return false;
  }
  if (Form.call2.value.length < 11) {
    alert("<s:text name='reg.jsp.reg.jsp.-415194682'/>!");
    Form.call2.focus();
    return false;
  }
  if (Form.call2.value.length > 11) {
    alert("<s:text name='reg.jsp.reg.jsp.-669883811'/>!");
    Form.call2.focus();
    return false;
  }
  if (Form.call.value != Form.call2.value) {
    alert("<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1355749389'/>!");
    Form.call.focus();
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入请输入二级密码密码!");
    Form.pa3.focus();
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=9", data, function(response) {
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
  if (Form.smsCode.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");
    Form.smsCode.focus();
    return false;
  }
  return true;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');
</script>
</body>

</html>
