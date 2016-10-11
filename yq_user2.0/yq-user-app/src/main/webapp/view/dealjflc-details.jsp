<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/jflc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/></span>
						<p class="r-link">
							<a href="gpjy" style="font-size: 20px;">未成交</a>|
							<a href="gpjyOfDeal" class="hover" style="font-size:20px;">已成交</a>
						</p>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th width="60"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th width="70"><s:text name='viewjflc-details.jsp.jflc-details.jsp.656571075'/></th>
								<th width="70"><s:text name='viewjflc-details.jsp.jflc-details.jsp.619069972'/></th>
								<th width="70"><s:text name='viewjflc-details.jsp.jflc-details.jsp.648863855'/></th>
								<th width="70"><s:text name='viewjflc-details.jsp.jflc-details.jsp.784049096'/></th>
								<th width="35"><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/></th>
								<th width="60"><s:text name='viewjflc-details.jsp.jflc-details.jsp.20195982'/></th>
								<th><s:text name='viewjflc-details.jsp.jflc-details.jsp.934923'/></th>
								<th><s:text name='viewjflc-details.jsp.jflc-details.jsp.755936'/></th>
								<th><s:text name='viewjflc-details.jsp.jflc-details.jsp.768067666'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td><c:if test="${data.mcsl>0}">-${data.mcsl}</c:if><c:if test="${data.mcsl<=0}">${data.mcsl}</c:if></td>
								<td>${data.mysl}</td>
								<td>${data.sysl}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td><c:if test="${data.pay<1}">${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></td>
								<td>${data.jypay}</td>
								<td>${data.bz}</td>
								<td>${data.dfuser}</td>
								<td><fmt:formatDate value="${data.cgdate}" type="both"/></td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag />
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
