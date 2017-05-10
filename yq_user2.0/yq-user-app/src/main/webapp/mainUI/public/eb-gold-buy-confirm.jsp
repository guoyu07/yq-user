<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1616194221'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='Member_center'/>|<s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
     <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
     <div class="member-main-full">
      <!-- <s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Conversion_of_electronic_coin_card'/></p>
        <div class="widget-article">
          <form class="widget-form" action="jztojb?status=3&mj=${mj}&gmsl=${gmsl}&secondThisState=${secondThisState}&thisState=${thisState}" method="post" onSubmit="return checkdate();" name="Form" id="Form">
            <p class="item">
              <lable class="title"><s:text name='Gold_card'/></lable>
              <span class="text widget-warning">
							<c:if test="${mj==10}">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</c:if>
							<c:if test="${mj==50}">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</c:if>
							<c:if test="${mj==100}">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</c:if>
							<c:if test="${mj==300}">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</c:if>
							<c:if test="${mj==500}">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</c:if>
							<c:if test="${mj==1000}">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</c:if></span>
            </p>
            <p class="item">
              <lable class="title"><s:text name='Purchase_gold_card_number'/></lable>
              <span class="text"><b class="widget-warning">${gmsl}</b><s:text name='Zhang'/></span>
            </p>
            <p class="item">
              <lable class="title"><s:text name='Total_number_of_coins'/></lable>
              <span class="text"><b class="widget-warning">${gmsl*mj}</b><s:text name='individual'/></span>
            </p>
            <p class="item">
              <lable class="title"><s:text name='Consumption_of_currency'/></lable>
              <span class="text"><b class="widget-warning">${gmsl*mj*1.5}</b><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></span>
            </p>
            <p class="item">
              <lable class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</lable>
              <input type="password" name="pa3" />
            </p>
            <p class="item">
	            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
	            <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"/>
	            <input class="widget-button-small" id="btn" type="button" onclick="sendMsg()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>"/>
	            <!-- input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"/><a href="javascript:void(0);" class="widget-button-small" onclick="sendMsg()"><s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/></a> -->
         	 </p> 
            <p class="button-line mt15">
              <button type="submit" class="widget-button"><s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.1964436824'/></button>
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
<script language="JavaScript">
function checkdate() {
  if (Form.pa3.value == "") {
    alert("<s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.-1396482625'/>!");
    return false;
  }
  if (Form.smsCode.value == "") {
	    alert("手机验证码不能为空！");
	    Form.smsCode.focus();
	    return false;
	  }
  if (!confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？ ')) {
    return false;
  }
  return true;
}
function sendMsg() {
	  /* if (!checkdate()) {
	    return;
	  } */
	  $("#btn").attr("disabled", "disabled");
	  var data = $("#Form").serialize();
	  $.post("/sms?op=17", data, function(response) {
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
</body>

</html>
