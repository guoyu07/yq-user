<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-1321238879'/>！');location.replace('jztojb?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-2099694066'/>！');location.replace('gpjy?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewjflc-details.jsp.jflc-details.jsp.624662580'/>|<s:text name='Integral_buy'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='viewjflc.jsp.jflc.jsp.951062035'/></p>
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
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1817661566'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1817661566'/></p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
            <p class="item">
              <label class="title"><s:text name='vipmcsl.jsp.mcsl.jsp.227454429b'/>：</label><span class="text">${jydb}</span>
            </p>
            <p class="item">
              <label class="title"><s:text name='vipmcsl.jsp.mcsl.jsp.227454429a'/>：</label><span class="text"><c:if test="${jygj<1}">${jygj}</c:if><c:if test="${jygj>=1}">${jygj}</c:if></span>
            </p>
            <p class="item">
              <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><span class="text">${userName}</span>
            </p>
            <p class="widget-warning mt10">** <s:text name='Maximum_buy'/><b class="sp">${zdjyg}</b><s:text name='Integral_points'/></span></p>
            <p class="item">
              <label class="title"><s:text name='viewjflc-details.jsp.jflc-details.jsp.619069972'/>：</label>
              <input type="text" name="txpay" value="" class="item-1"/>
            </p>
            <p class="item">
              <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
              <input type="password" name="pa3" />
            </p>
            <p class="button-line mt15">
              <button type="submit" class="widget-button"><s:text name='Definite_buying'/></button>
            </p>
          </form>
        </div>
      </div>
      <!-- <s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1817661566'/> end -->
      <!-- 当前求购明细 大概是一页10行数据 -->
      <div class="main-widget mt15">
        <p class="widget-title"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1696499005'/></p>
        <p class="small-button-line"><!-- <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="/myslmoredetail?status=4" id="J_rechargeDetailMore"><s:text name='View_more'/></a> --></p>
        <c:if test="${empty dataList}">
						<div class="content-tisp">
							<h5><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.807971267'/></h5>
						</div>
					</c:if>
		<c:if test="${not empty dataList}">
        <div class="widget-table mt5">
        	
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
             <tr>
								<th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-1172477375'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.787632912'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.861206825'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.mysl}</td>
								<td>${data.jypay}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td><a href="qxqg?qxid=${data.jyid}&secondThisState=${secondThisState}&thisState=${thisState}" style="text-decoration: none"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.836270'/></a></td>
							</tr>
							</s:iterator>
            </tbody>
          </table>
        
        </div>
        <p class="widget-pages">
	<aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
  </c:if>
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
  if (Form.txpay.value == "") {
    alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-477498021'/>!");
    Form.txpay.focus();
    return false;
  }
  if (Form.txpay.value == 0) {
    alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.175650976'/>!");
    return false;
  }
  if (Form.txpay.value < 5) {
    alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.2087317176'/>");
    return false;
  }
  if (Form.txpay.value > 3000) {
    alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.1250924413'/>");
    return false;
  }
  if (Form.txpay.value > ${zdjyg}) {
    alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.150034015'/>${zdjyg}");
    return false;
  }
  if (!chkinteger(Form.txpay.value)) {
    alert('<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-1758918826'/>!');
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
  if (Form.pa3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    Form.pa3.focus();
    return false;
  }
  return true;
}
</script>
</body>

</html>
