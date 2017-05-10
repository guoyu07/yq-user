<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewjflc-details.jsp.jflc-details.jsp.624662580'/>|<s:text name='Quick_activation_gold_card'/></title>
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
      <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='Gold_coin_management'/></p>
      <ul class="nav-secondary">
       <%@ include file="/mainUI/common/scendhead.jsp" %>
      </ul>
    </div>
  </div>
  <!-- 会员中心导航模块 end -->
  <!-- 积分理财内容 -->
  <div class="container">
    <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
      <div class="dialog-widget">
        <p class="dialog-title"><s:text name='Quick_activation_gold_card'/></p>
        <!-- 图纸为一页13条数据 -->
        <div class="dialog-wrap-border main-widget">
          <form class="widget-form" name="Form" action="activedGoldCard?secondThisState=${secondThisState}&thisState=${thisState}">
            <p class="item">
              <lable class="title"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.871112722'/>：</lable>
              <span class="text widget-warning">${id}</span>
              <input type="hidden" name="pdid" value="${id}" />
            </p>
            <p class="item">
              <lable class="title"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>：</lable>
              <span class="text widget-warning">${pdpa}</span>
               <input type="hidden" name="pdpa" value="${pdpa}" />
            </p>
            <p class="item">
              <lable class="title"><s:text name='Security_number'/></lable>
              <span class="text widget-warning">${fwid}</span>
              <input type="hidden" name="fwid" value="${fwid}" />
              <input type="hidden" name="status" value="1" />
            </p>
            <p class="item">
              <lable class="title"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.-1226774048c'/>：</lable>
              <span class="text widget-warning">${ejbk.bf2}0</span>
            </p>
            <!-- <p class="item">
	            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
	            <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"/>
	            <input class="widget-button-small" id="btn" type="button" onclick="sendMsg()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>"/>
	            <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"/><a href="javascript:void(0);" class="widget-button-small" onclick="sendMsg()"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/></a>
         	 </p> -->
            <p class="button-line mt15">
            <!-- <button type="submit" class="widget-button" ><s:text name='vipuserga.jsp.userga.jsp.1384157160'/></button>onClick="checkdate();" -->
              <a href="activedGoldCard?pdid=${id}&pdpa=${pdpa}&fwid=${fwid}&status=1&secondThisState=${secondThisState}&thisState=${thisState}"  class="widget-button"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.-1035441473a'/></a>
            </p>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>
<script type="text/javascript">
function checkdate1() {
	  if (!checkdate()) {
	    return;
	  }
	 /*  var data = $("#Form").serialize();
	  $.post("activedGoldCard?status=1&pdid=${id}&pdpa=${pdpa}&fwid=${fwid}&status=1&secondThisState=${secondThisState}&thisState=${thisState}", data, function(response) {
	    if (response.erroCodeNum ==2000) {
	      alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.606198600'/>！');
	      location.replace('../index.jsp?id=' + Form.userName.value);
	    }
	  });
	  return true; */
	}
function checkdate() {
	  if (Form.smsCode.value == "") {
	    alert("<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.39306141'/>！");
	    Form.smsCode.focus();
	    return false;
	  }
}

function sendMsg() {
  /* if (!checkdate()) {
    return;
  } */
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=16", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
  });
} 


</script>

</html>
