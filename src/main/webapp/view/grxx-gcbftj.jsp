<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>全 部 分 红 明 细</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th>用户名</th>
								<th>个人持点数量</th>
								<th>每点分红</th>
								<th>本期累计</th>
								<th>所有累计</th>
								<th>分红时间</th>
								<th>备注</th>
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