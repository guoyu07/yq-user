<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户订单不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
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
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
                
			</div>
			<form method="post" name="Form" action="datepayfororder?status=1">
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='mallorderqueryforyibi'/></span>
						<p class="r-link">
					 <a href="datepay"><font color="red"><s:text name='vipdatepay.jsp.datepay.jsp.1846650039'/><!-- 一币明细 --></font></a>&nbsp;&nbsp;&nbsp;<s:text name='mallorderquery'/><!-- 商城订单号 -->：<input type="text" name="orderId" id="orderId" value=""/> <button  type="submit" onClick="querydata()"><s:text name='query'/><!-- 查询 --></button>
					
					</div>
					<div class="content-table">
						<table>
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
						</table>
						<div class="page">
							<p><%-- <aldtags:pageTag para1="lb" value1="${lb}"/> --%>
							 </p>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
