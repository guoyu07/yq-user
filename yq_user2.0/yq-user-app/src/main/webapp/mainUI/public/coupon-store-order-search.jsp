<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<script type="text/javascript">
function querydata(){
	  var order = $("#orderId").val();
	  if (order==""){
			alert("<s:text name='pleaseinputmallorder'/>！");
			Form.orderId.focus();
			return;
		}
 }
</script>

<head>
  <meta chartset="UTF-8">
  <title>会员中心|我的客户</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> <!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->

<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">财富中心 >> 报单币明细</p>
     <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>

<!-- 购物券内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
     <form method="POST" action="usermallorderscoreslog?status=1&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" id="Form">
      <!-- 购物券变化明细 -->
      <div class="main-widget">
        <p class="widget-title-line">商城订单号购物券变化明细</p>
        <p class="small-button-line"><a href="userscoreslog?secondThisState=${secondThisState}&thisState=${thisState}" class="widget-warning mr10">返回购物券变化明细</a></p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <caption class="search-line">
              <span>商城订单号查询：</span>
              <input type="text" name="orderId" id="orderId" value="" size="10" style="padding: 0 5px;" />
              <button type="submit" class="widget-button-small order-search" onClick="querydata()">查询 </button>
            </caption>
            <thead>
              <tr>
                <th>用户名</th>
                <th>改变数量</th>
                <th>当前数量</th>
                <th>详情</th>
                <th>时间</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="userScoresLoglist">
                 <tr>
                     <td>${data.userName}</td>
                     <td>${data.changeNum}</td>
                     <td>${data.nowNum}</td>
                     <td>
                       <c:choose>
                          <c:when test="${data.changeType==1001}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.985534181'/></c:when>
                          <c:when test="${data.changeType==1002}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.672663306'/>-${data.param}</c:when>
                          <c:when test="${data.changeType==1003}"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/>-${data.param}</c:when>
                          <c:when test="${data.changeType==1004}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1302859212'/>-${data.fromUser}</c:when>
                          <c:when test="${data.changeType==1005}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-1516479278'/>-${data.fromUser}</c:when>
                          <c:when test="${data.changeType==1006}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.-1849971472'/>-${data.param}</c:when>
                          <c:when test="${data.changeType==1007}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.2110427632'/>-${data.param}</c:when>
                          <c:when test="${data.changeType==2001}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.672844281'/>-${data.param}</c:when>
                          <c:when test="${data.changeType==2002}"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/>-${data.param}</c:when>
                          <c:when test="${data.changeType==2003}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1302859212'/>-${data.fromUser}</c:when>
                          <c:when test="${data.changeType==2004}"><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.2110427632'/><s:text name='viewlinks.html.links.html.1159182'/>-${data.param}-${data.fromUser}</c:when>
                          <c:otherwise>${data.changeType}</c:otherwise>
                       </c:choose>
                     </td>
                     <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
                 </tr>
                 </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<!-- 会员中心翻页组件 end -->

      </div>
      <!-- 购物券变化明细 end -->
      </form>
    </div>
  </div>
</div>
<!-- 购物券内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
