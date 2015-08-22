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
                <%@ include file="/view/jflc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>积分交易明细</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th width="60">用户名</th>
								<th width="70">卖出数量</th>
								<th width="70">买入数量</th>
								<th width="70">剩余数量</th>
								<th width="70">挂牌时间</th>
								<th width="35">单价</th>
								<th width="60">交易额</th>
								<th>状态</th>
								<th>对方</th>
								<th>成交时间</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td><c:if test="${data.mcsl>0}">-${data.mcsl}</c:if><c:if test="${data.mcsl<=0}">${data.mcsl}</c:if></td>
								<td>${data.mysl}</td>
								<td>${data.sysl}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td><c:if test="${data.pay<1}">0${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></td>
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