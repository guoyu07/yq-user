<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户订单不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.624662580'/>|<s:text name='Mall_order_number_query_details'/></title>
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
      <p class="dialog-title"><s:text name='Mall_order_number_query_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <form method="post" name="Form" action="datepayfororder?status=1">
      <p class="small-button-line">
        <a href="datepay?status=1" class="widget-warning mr10"><s:text name='Back_to_a_dollar_change_details'/></a>
        <span><s:text name='mallorderquery'/>：</span>
        <input type="text" name="orderId" id="orderId" value="" size="10" style="padding: 0 5px;" />
        <button type="submit" class="widget-button-small order-search" onClick="querydata()"><s:text name='query'/> </button>
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
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
<%-- <aldtags:pageTag paraStr="lb,${lb},status,${status}"/> --%>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript">
	   function querydata(){
		  var order = $("#orderId").val();
		  if (order==""){
				alert("订单号不能为空！");
				Form.orderId.focus();
				return false;
			}
	  } 
	
	</script>
</body>

</html>
