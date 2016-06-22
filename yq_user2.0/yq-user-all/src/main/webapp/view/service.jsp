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
						<span>客服中心</span>
					</div>
					<div class="content-txt">
						<div class="service">
						<p>团队服务中心编号：	${upuname}***</p>
						<p>称谓：	${gcuserup.vipuser}</p>
						<p>联系QQ：	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>${gcuserup.qq}</p>
						<p>联系电话：	${gcuserup.call}</p>
						<c:if test="${not empty gcuserup.vipgh}">
						  <p>工商银行:${gcuserup.vipgh}</p>
						</c:if>
						<c:if test="${not empty gcuserup.vipnh}">
						  <p>农业银行:${gcuserup.vipnh}</p>
						</c:if>		
						<c:if test="${not empty gcuserup.vipjh}">
						  <p>建设银行:${gcuserup.vipjh}</p>
						</c:if>
						<c:if test="${not empty gcuserup.vipzh}">
						  <p>中国银行:${gcuserup.vipzh}</p>
						</c:if>	
						<c:if test="${not empty gcuserup.vipcft}">
						  <p>财付通:${gcuserup.vipcft}</p>
						</c:if>		
						<c:if test="${not empty gcuserup.vipzfb}">
						  <p>支付宝:${gcuserup.vipzfb}</p>
						</c:if>				
						<p>开户行所在地：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}支行</p>
						    有关业务问题可咨询，如您无法在一币市场进行收购一币的操作或您想省去在收一币中（打款，<br />
						等对方确认）的中间环节，就可以联系本团队服务中心快速购买
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>