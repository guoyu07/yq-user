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
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>激活金币卡</span>
					</div>
					<div class="content-form new3-top">
						  <p>你好，你上次已查看过该消费编号<b>${id}</b>的登录密码</p>
						  <p>如果已经把密码给到客户手上，请不要随便重置密码。</p>
						  <p>客户真的忘记了密码，我决定再次<a href="czpa?id=${id}"><b>重置密码</b></a></p>
			              <p><a href="gmjh?jh=${id}">不重置点击返回</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>