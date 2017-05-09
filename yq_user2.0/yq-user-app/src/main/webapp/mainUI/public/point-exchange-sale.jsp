<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-949213936'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1341989901'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-498016988'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.440060053'/> ${fcxt.zdj} ！');history.go(-1);</script></c:if>

<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2045778169'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.115010359'/>！');history.go(-1);</script></c:if>


<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1997417452'/>!');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.624662580'/>|<s:text name='integral_sell'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='vipadmin_menu.jsp.admin_menu.jsp.951062035'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
  <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1817661566'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1817700589'/></p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="mcsl?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
            <p class="item">
              <label class="title"><s:text name='vipmcsl.jsp.mcsl.jsp.227454429'/>：</label><span class="text">${gcuser.jyg}</span>
            </p>
            <p class="item">
              <label class="title"><s:text name='vipmcsl.jsp.mcsl.jsp.227454429a'/>：</label><span class="text"><c:if test="${fcxt.jygj<1}">${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></span>
            </p>
            <p class="item">
              <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><span class="text">${userName}</span>
            </p>
            <p class="item">
              <label class="title"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.656410278'/>：</label>
              <input type="text" name="jygj" />
            </p>
            <p class="widget-warning mt10">** <s:text name='Available_for_sale'/>：<b class="sp">${gcuser.jyg}</b></span>
            </p>
            <p class="item">
              <label class="title"><s:text name='viewjflc-details.jsp.jflc-details.jsp.656571075'/>：</label>
              <input type="text" name="txpay" value="" class="item-2"/>
            </p>
            <p class="item">
              <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
              <input type="password" name="pa3" />
            </p>
            <p class="button-line mt15">
              <button type="submit" class="widget-button"><s:text name='Determine_sell'/></button>
            </p>
            <p class="widget-tips mt10"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-602511626'/></p>
          </form>
        </div>
      </div>
      <!-- <s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1817661566'/> end -->
      <!-- 当前求购明细 大概是一页10行数据 -->
      <div class="main-widget mt15">
        <p class="widget-title"><s:text name='sell.1696499005'/></p>
        <p class="small-button-line"><!-- <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="/mcslmoredetail?status=4" id="J_rechargeDetailMore"><s:text name='View_more'/></a> --></p>
        <div class="widget-table mt5">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
            	 <c:if test="${empty dataList}">
						<div class="content-tisp">
							<h5><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.807971267'/></h5>
						</div>
					</c:if>
			<c:if test="${not empty dataList}">
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/></th>
                <th><s:text name='viewjflc-details.jsp.jflc-details.jsp.784049096'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.747890431'/></th>
                <th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.635139184'/></th>
                <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
              </tr>
            </thead>
            <tbody>
            <s:iterator var="data" value="dataList">
              <tr>
				<td>${userName}</td>
				<td>${data.mcsl}</td>
				<td>${data.sysl}</td>
				<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
				<td>${data.pay}</td>
                   <td><a href="/diyjygj?sgid=${data.id}&secondThisState=${secondThisState}&thisState=${thisState}"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.635139184'/></a></td>
                   <td><!-- <c:if test="${data.newjy!=3}"><a href="qxyjg?qxid=${data.id}" style="text-decoration: none">撒销</a></c:if> --></td>
			</tr>
             </s:iterator>
             </c:if>
            </tbody>
          </table>
        </div>
         <p class="widget-pages">
  <aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
      </div>
      <!-- <s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1696499005'/> end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
function checkdate() {
  if (Form.jygj.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1510332280'/>");
    Form.jygj.focus();
    return false;
  }
  if (Form.jygj.value < ${fcxt.zdj}) {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.440060053'/> ${fcxt.zdj} !");
    Form.jygj.focus();
    return false;
  }
  if (Form.jygj.value > ${fcxt.jygj}+0.03) {
    alert("<s:text name='vipmcsl.jsp.mcsl.jsp.908656802'/>");
    Form.jygj.focus();
    return false;
  }
  if (!chkinteger1(Form.jygj.value)) {
    alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2139966856'/>');
    document.Form.jygj.focus;
    return (false);
  }

  function chkinteger1(checkStr1) {
    var re = /^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
    return re.test(checkStr1)
  }

  if (Form.txpay.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1510493077'/>!");
    Form.txpay.focus();
    return false;
  }
  if (Form.txpay.value == 0) {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1384480305'/>");
    return false;
  }
  if (!chkinteger(Form.txpay.value)) {
    alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1416619015'/>!');
    document.Form.txpay.focus;
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
  if (Form.txpay.value < 10) {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.603950472'/>!");
    return false;
  }
  if (Form.txpay.value > 3000) {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1469760371'/>!");
    return false;
  }
  if (Form.txpay.value > ${gcuser.jyg}) {

    return false;
  }
  if (Form.pa3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>");
    Form.pa3.focus();
    return false;
  }
  return true;
}
</script>
</body>

</html>
