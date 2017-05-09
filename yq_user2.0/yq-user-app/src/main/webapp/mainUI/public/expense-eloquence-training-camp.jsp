<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1873291783'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-495031333'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-879132281'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.773789335'/>！');location.replace('baby');</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='Member_center'/>|<s:text name='Future_leader_youth_eloquence_training_camp'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Consumption-management'/> >> <s:text name='Charge_recharge_(100)'/></p>
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
      <!-- <s:text name='Young_leaders_of_the_future_training_camp_eloquence_notice'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Young_leaders_of_the_future_training_camp_eloquence_notice'/></p>
        <div class="widget-article">
          <p class="widget-notice"><s:text name='Sign_up_for_the_training_camp'/><b class="widget-warning">23800</b> <s:text name='A_coin'/></p>
        </div>
      </div>
      <!-- <s:text name='Young_leaders_of_the_future_training_camp_eloquence_notice'/> end -->
      <!-- 未来领袖青少年口才训练营报名 -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='Youth_training_camp_for_future_leaders'/></p>
        <form class="widget-form" action="?st=1" method="post" onsubmit="return checkdate1()" name="Form" id="Form">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>william123</p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.721961018'/>：</label>
            <input type="text" name="babyName" value="">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.722017072'/>：</label>
            <input type="text" name="babyAge" value="" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title"><s:text name='Baby_sex:'/></label>
            <select class="widget-select" name="babySex">
             <option value="男" <c:if test="${babySex=='男'}">selected</c:if>><s:text name='man'/></option><option value="女" <c:if test="${babySex=='女'}">selected</c:if> ><s:text name='female'/></option>
            </select>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.899922842'/>：</label>
            <input type="text" name="dadyName" value="">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.899978896'/>：</label>
            <input type="text" name="dadyAge" value="" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1010272733'/>：</label>
            <input type="text" name="dadyCall" value="">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.705570202'/>：</label>
            <input type="text" name="momName" value="">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.705626256'/>：</label>
            <input type="text" name="momAge" value="" onkeyup="value=value.replace(/[^\d]/g,'')">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1010272733'/>：</label>
            <input type="text" name="momCall" value="">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.714256'/>：</label>
            <input type="text" name="address" value="">
          </p>
          <p class="item-textarea">
            <label class="title"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.842903009'/>：</label>
            <textarea rows="5" name="details" cols="30" value=""><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.842903009a'/></textarea>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="pa3">
          </p>
          <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
            <input type="text" name="smsCode">
            <input class="widget-button-small" id="btn" type="button" onclick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2">
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-204321051a'/></button>
          </p>
        </form>
      </div>
      <!-- 未来领袖青少年口才训练营报名 end -->
    </div>
  </div>
</div>
</div>
<!-- 消费管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.babyName.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1822162869'/>!");
    Form.babyName.focus();
    return false;
  }
  if (Form.babyAge.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1822106815'/>!");
    Form.babyAge.focus();
    return false;
  }
  if (Form.dadyName.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1644201045'/>!");
    Form.dadyName.focus();
    return false;
  }
  if (Form.dadyAge.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1644144991'/>!");
    Form.dadyAge.focus();
    return false;
  }
  if (Form.dadyCall.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.775311534'/>!");
    Form.dadyCall.focus();
    return false;
  }
  if (Form.momName.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1838553685'/>!");
    Form.momName.focus();
    return false;
  }
  if (Form.momAge.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1838497631'/>!");
    Form.momAge.focus();
    return false;
  }
  if (Form.momCall.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1313981778'/>!");
    Form.momCall.focus();
    return false;
  }
  if (Form.address.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1846478333'/>!");
    Form.address.focus();
    return false;
  }
  if (Form.details.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-645253644'/>!");
    Form.details.focus();
    return false;
  }
  if (Form.pa3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    Form.pa3.focus();
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=12", data, function(response) {
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
