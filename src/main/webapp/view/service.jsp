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
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>客服中心</span>
					</div>
					<div class="content-txt">
						<div class="service">
						<p>团队服务中心编号：	${upuname}***</p>
						<p>称谓：	${gcuserup.name}</p>
						<p>联系QQ：	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>${gcuserup.qq}</p>
						<p>联系电话：	${gcuserup.call}</p>
						<p>收款账号：	${gcuserup.bank}-${gcuserup.card}</p>
						<p>开户行所在地：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}支行</p>
						    有关业务问题可咨询，如您无法在一币市场进行收购一币的操作或您想省去在收一币中（打款，<br />
						等对方确认）的中间环节，就可以联系本团队服务中心快速购买（按1000一币，付款950元的比例进行）
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>