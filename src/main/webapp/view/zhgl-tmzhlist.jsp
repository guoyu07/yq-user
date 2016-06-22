<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
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
						<span>同名账户列表</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
							    <th>用户名</th>
								<th>姓名</th>
								<th>游戏级别</th>
								<th>可用一币</th>
								<th>积分数量</th>
								<th>可用金币</th>
								<th>注册时间</th>
								<th>开户时间</th>
								<th>信誉星</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td><a href="/relogin?luserName=${data.username}">${data.username}</a><c:if test="${data.username==gcuser.username}"></font><b><font color="#FF00FF">(当前)</font></b></c:if></td>
								<td>${data.name}</td>
								<td>${data.sjb}</td>
								<td>${data.pay}</td>
								<td>${data.jyg}</td>
								<td>${data.jydb}</td>
								<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
								<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
								<td>${data.cxt}</td>
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