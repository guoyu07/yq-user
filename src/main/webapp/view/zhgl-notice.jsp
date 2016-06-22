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
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>公告详情</span>
					</div>
					<div class="content-txt">
						<div class="notice">
							<h3 class="title">${dgag.ggbt}</h3>
							<div class="txt-main">${dgag.ggny}
						   </div>
						</div>
						   			<p class="z-tr"><c:if test="${dgag.bz!=''}">${dgag.bz}</c:if><c:if test="${dgag.bz==''}">积分游戏大平台</c:if></p>
									<p class="z-tr" ><fmt:formatDate value="${dgag.ggdate}" pattern="yyyy/MM/dd aa HH:mm"/></p>
									<p class="z-tc"><a href="javascript:history.go(-1);">返回公告</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>