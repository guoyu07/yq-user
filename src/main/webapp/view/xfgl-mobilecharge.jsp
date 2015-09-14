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
				<%@ include file="/view/xfgl.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>话费充值</span>
					</div>
					<div class="content-form">
						<form class="form form3" style="height:463px;">
							<p><label class="c-r">转出用户名：</label></p>
							<p><label class="c-r">要充值的手机号：</label><input type="text"></p>
							<p><label>确认充值号码：</label><input type="text" style="width:100px;" /></p>
							<p><label>充值金额：</label></p>
							<p><label>服务费(10%)：</label></p>
							<p><label>合计一币：</label></p>
							<p><label>二级密码：</label><input type="text"></p>
							<p><label>手机验证码：</label><input type="text">　<button>获取验证码</button></p>
							<p><label></label><button class="but1">确 定 转 账</button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="scripts/jquery.js"></script>
	<script src="scripts/common.js"></script>
</body>
</html>