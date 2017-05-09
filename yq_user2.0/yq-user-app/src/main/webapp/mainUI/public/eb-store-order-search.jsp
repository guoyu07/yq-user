<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户订单不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='mallorderquery'/></title>
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
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
   <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<!-- 会员中心左边栏 end -->
<form method="post" name="Form" action="datepayfororder?status=1&thisState=${thisState}&secondThisState=${secondThisState}">
    <div class="member-main-full">
      <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='mallorderqueryforyibi'/></p>
        <p class="small-button-line">
          <a href="datepay?thisState=${thisState}&secondThisState=${secondThisState}" class="widget-warning mr10"><s:text name='Back_to_a_dollar_change_details'/></a>
          <span><s:text name='mallorderquery'/>：</span>
          <input type="text" name="orderId" id="orderId" value="" size="10" style="padding: 0 5px;" />
          <button type="submit" class="widget-button-small order-search" onClick="querydata()"><s:text name='query'/> </button>
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
				<th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
				<th><s:text name='viewlinks.html.links.html.618817200'/></th>
				<th><s:text name='viewlinks.html.links.html.618817132'/></th>
				<th><s:text name='viewlinks.html.links.html.1136018751'/></th>
				<th><s:text name='viewlinks.html.links.html.1136018683'/></th>
				<th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></th>
				<th><s:text name='viewlinks.html.links.html.649202784'/></th>
				<th width="100"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
				<th width="135"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
			</tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="datepaylist">
				<tr>
					<td>${data.username}</td>
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
        <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> end -->
      </div>
      <!-- <s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/> end -->
    </div>
    </form>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  <script type="text/javascript">
	  function querydata(){
		  var order = $("#orderId").val();
		  if (order==""){
				alert("<s:text name='pleaseinputmallorder'/>！");
				Form.orderId.focus();
				return false;
			}
	  }
	
	</script>
  </body>

  </html>
