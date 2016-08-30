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
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.-242629559'/></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.667376878'/></th>
								<th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.-451364663'/></th>
								<th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.1119230520'/></th>
								<th>ip<s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.714256'/></th>
								<th><s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.928172778'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${gcuser.username}</td>
								<td><fmt:formatDate value="${data.dldate}" type="both"/></td>
								<td><fmt:formatDate value="${data.tcdate}" type="both"/></td>
								<td>${data.dlip}</td>
								<td>${data.dlfs}</td>
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
