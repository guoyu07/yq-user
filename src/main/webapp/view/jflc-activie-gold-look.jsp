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
						  <p>消费编号是：<b>${id}</b>  登录密码为：<b>${pdpa}</b>  防伪编号为：<b>${fwid}</b>  金币面值：<b>${ejbk.bf2}0</b></p>
						  <p>请牢记，并及时交给客户以便尽快激活购买积分增值！</p>
						  <p><a onClick="return confirm('提示：按此激活将是自己使用，不能再用于赠送，您确定了吗？')" href="activedGoldCard?pdid=${id}&pdpa=${pdpa}&fwid=${fwid}"><button class="but1">快 速 激  活</button></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>