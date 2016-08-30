<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.-69283997'/></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.29623262'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.-1088521889'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.989905457'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${gcuser.username}</td>
								<td>${data.sygc}</td>
								<td>${data.ljgc}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td>${data.bz}</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag para1="lb" value1="${lb}"/>
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
