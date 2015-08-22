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
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>一币变化明细</span>
						<p class="r-link">
							<a href="/datepay">累计奖金</a>|
							<a href="/datepay?lb=9">推广部分</a>|
							<a href="/datepay?lb=1">平衡部分</a>|
							<a href="/datepay?lb=8">辅导部分</a>|
							<a href="/datepay?lb=2">累计认购</a>|
							<a href="/datepay?lb=3">累计卖出</a>
						</p>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th width="75">用户名</th>
								<th>一币收入</th>
								<th>一币支出</th>
								<th>金币收入</th>
								<th>金币支出</th>
								<th>剩余一币</th>
								<th>剩余金币</th>
								<th width="100">更新时间</th>
								<th width="135">备注</th>
							</tr>
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