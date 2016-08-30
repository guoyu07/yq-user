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
						<span><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.1749444652'/></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.-439906297'/></th>
								<th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.850616742'/></th>
								<th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.813238533'/></th>
								<th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.775680731'/></th>
								<th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.657552666'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${gcuser.username}</td>
								<td>${data.sygc}</td>
								<td><c:if test="${fhpay<1}">0</c:if><c:if test="${fhpay>=1}">${fhpay}</c:if></td>
								<td>${data.syfh}</td>
								<td>${data.ljfhtj}</td>
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
