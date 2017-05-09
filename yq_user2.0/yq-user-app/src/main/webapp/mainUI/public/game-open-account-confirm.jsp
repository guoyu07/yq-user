<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1610007112'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1396378774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-394660049'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1923400400'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1060799146'/>！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1996562206'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1380597198'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1649708849'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1817862406'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.153703061'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1554447127'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1554447127'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-131078147'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1541818965'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==15}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1917340790'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==16}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1463370214'/>！');history.go(-2);</script></c:if>
<c:if test="${erroCodeNum==17}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1086940459'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-632272473'/>！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Confirm_account_information'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> 
<style type="text/css">
  .zzbg{display:none;position:fixed;width:100%;height:100%;background:#000;z-index:998;top:0;left:0;opacity:0.7;}
  .zzcontent{display:none;width:500px;height:50px;position:fixed;top:50%;margin-top:-150px;background:#fff;z-index:999;left:50%;margin-left:-250px;}
</style>
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='viewjflc.jsp.jflc.jsp.951062035'/></p>
     <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
  <%-- <%@ include file="/mainUI/common/userLeft.jsp" %> --%>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <%@ include file="/mainUI/common/gameservice.jsp" %>
  <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='Confirm_account_information'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Confirm_account_information'/></p>
        <p class="small-button-line">
          <a class="widget-warning" href="javascript:history.back();"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></a>
        </p>
        <form class="widget-form" method="POST" action="bdreg?step=7&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" id="Form" onSubmit="return showZz()">
            <input type="hidden" name="targetdate" size="8">
          <input type="hidden" name="status" value="1">
          <input type="hidden" name="xmlmode" size="8">
	      <input type="hidden" name="cjpay" size="10" value="${cjpay}" readonly><input type="hidden" name="remark" size="8" value="3" readonly><input type="hidden" name="user" size="10" value="${userName}" readonly>
          
          <p class="item">
            <label class="title"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.473018246'/>：</label>
            <b class="text widget-warning"><input type="hidden" name="up" readonly value="${up}">${up}</b>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1763852615'/>：</label>
            <b class="text widget-warning"><input type="hidden" name="bduser" readonly value="${bduser}">${bduser}</b>
          </p>
          <p class="item">
          	<label class="title"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1123565209'/>：</label>
			<font color="#008000"><b>${cjpay}</b></font><input type="hidden" name="pa1j" size="8" value="${pa1j}"><input type="hidden" name="pa2j" size="8" value="${pa2j}">
		  </p>
          <p class="widget-notice mt15 ml10">（<s:text name='vipbdreg.jsp.bdreg.jsp.-808057141'/>（<b>${userName}</b>）<c:if test="${cjpay<9000}"><s:text name='yibi'/></c:if><c:if test="${cjpay>=9000}"><s:text name='Order'/></c:if><s:text name='deduction'/>${cjpay}）</p>
          <c:if test="${cjpay<9000}">
          <p class="item">
            <label class="title"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1539312043'/>：</label><span class="text">${call}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
            <input type="text" name="ceid" />
            <input class="widget-button-small" id="btn" type="button" onclick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2" />
          </p>
          </c:if>
          <p class="button-line mt15">

          </p>
        </form>
        <p class="widget-notice mt15"><b class="widget-warning"><s:text name='vipepmy.jsp.epmy.jsp.-1694703455'/>：</b><s:text name='After_confirmation,_the_system_into_the_accounting_period,_please_stop_other_operations,_not_to_close_the_page!'/></p>
      </div>
      <!-- <s:text name='Confirm_account_information'/> end -->
    </div>
  </div>
</div>
<div class="zzbg"></div>
<div class="zzcontent">
<h2 align="center"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.579202987'/>！</h2>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=2", data, function(response) {
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
  if (Form.ceid.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");
    Form.ceid.focus();
    return false;
  }
  return true;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');

function showZz() {
  $('.zzbg').fadeIn(200);
  $('.zzcontent').fadeIn(400);
  return true;
}
</script>
</body>

</html>
