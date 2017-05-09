<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.624662580'/>|<s:text name='Details_of_a_currency_change_details'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
 <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title"><s:text name='Details_of_a_currency_change_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <p class="small-button-line">
        <a href="datepayfororder" class="widget-warning mr10"><s:text name='Click_here_to_enter_the_mall_order_number_query'/></a>
        <!-- <select class="widget-select" id="lb" name="lb" onchange="jump(document.getElementById('lb').options[document.getElementById('lb').selectedIndex].value);">
          <option value="0" selected=""><s:text name='all'/></option>
          <option value="1"><s:text name='promotion_award'/></option>
          <option value="2"><s:text name='balance_award'/></option>
          <option value="3"><s:text name='counseling_award'/></option>
          <option value="4"><s:text name='integral_sell'/></option>
          <option value="5"><s:text name='Sell_a_coin'/> </option>
          <option value="6"><s:text name='Subscribe_for_a_dollar'/> </option>
          <option value="7"><s:text name='namesake_Huzhuan'/></option>
          <option value="8"><s:text name='VIP_transfer_income'/></option>
          <option value="9"><s:text name='management_transfer_income'/></option>
          <option value="10"><s:text name='changes_in_management'/></option>
          <option value="12"><s:text name='commodity_revenues'/></option>
          <option value="13"><s:text name='Dollar_consumption'/> </option>
          <option value="14"><s:text name='ticket_expenditure'/> </option>
          <option value="15"><s:text name='business_income'/> </option>
          <option value="16"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/> </option>
          <option value="20"><s:text name='Trading_violations'/> </option>
        </select> -->
      </p>
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewlinks.html.links.html.618817200'/></th>
                <th><s:text name='viewlinks.html.links.html.618817132'/></th>
                <th><s:text name='viewlinks.html.links.html.1136018751'/></th>
                <th><s:text name='viewlinks.html.links.html.1136018683'/></th>
                <th><s:text name='viewlinks.html.links.html.648664593'/></th>
                <th><s:text name='viewlinks.html.links.html.649202784'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${gcuser.username}</td>
					<td>${data.syjz}</td>
					<td><c:if test="${data.jc>0}">-${data.jc}</c:if><c:if test="${data.jc<=0}">${data.jc}</c:if></td>
					<td>${data.jyjz}</td>
					<td><c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></td>
					<td>${data.pay}</td>
					<td>${data.jydb}</td>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td>${data.regid}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="lb,${lb},status,${status}"/><%-- paraStr="lb,${lb},status,${status}"  --%>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
function jump(lb) {
  location.replace('datepay?status=1&lb=' + lb);
  return;
};
</script>
</body>

</html>
