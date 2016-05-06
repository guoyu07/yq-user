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
                <%@ include file="/view/yjcx.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>报 单 币 变 化 明 细</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th width="75">用户名</th>
								<th>报单币收入</th>
								<th>报单币支出</th>
								<th>剩余报单币</th>
								<th>左总计</th>
								<th>右总计</th>
								<th>左结余</th>
								<th>右结余</th>
								<th>更新时间</th>
								<th>备注</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.sy}</td>
								<td><c:if test="${data.jc<0}">-${data.jc}</c:if><c:if test="${data.jc>0}">${data.jc}</c:if></td>
								<td>${data.sybdb}</td>
								<td>${data.zaq}</td>
								<td>${data.zbq}</td>
								<td>${data.aq}</td>
								<td>${data.bq}</td>
								<td><fmt:formatDate value="${data.bfdate}" type="both"/></td>
								<td>${data.bz}</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/>
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>