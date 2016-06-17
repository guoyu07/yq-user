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
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>我的客户</span>
					</div>
					<div class="a-kh">
						如果有问题请第一时间联系我(推荐人): QQ:${up.qq} <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${up.qq}&site=qq&menu=yes"> 点击这里给我发消息</a>　手机：${up.call}  ${upName}先生/小姐
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th>用户名</th>
								<th>QQ</th>
								<th>注册时间</th>
								<th>累计充值</th>
								<th>最近充值时间</th>
								<th>双区玩家</th>
								<th>升级时间</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${data.username}</td>
								<td><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${data.qq}&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:${data.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></font></a><font size="2" color="#000000">${data.qq}</font></td>
								<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
								<td>${data.cjtj}</td>
								<td><fmt:formatDate value="${data.gmdate}" type="both"/></td>
								<td><c:if test="${data.sjb==0}">否</c:if><c:if test="${data.sjb!=0}">${data.sjb}单</c:if></td>
								<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
							</tr>
						   </s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="scripts/jquery.js"></script>
	<script src="scripts/common.js"></script>
</body>
</html>