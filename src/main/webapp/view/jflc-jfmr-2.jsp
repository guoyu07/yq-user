<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
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

				 <%@ include file="/view/jflc.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>发布积分买入</span>
					</div>
					<div class="content-form new1-top">
						<h4>请您再次确认</h4>
						<p>您要买入积分数量<strong>${txpay}</strong> 当前单价是：<strong>${jygj}</strong></p>
						<p>即将从您的金币账户扣除<strong>${needJf}</strong> 金币</p>
						<p><button class="but1 but2" onClick="bitch()">确 定 买 入</button></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
    function bitch(){
    	if(confirm('提示：您确定了吗？')){
    		location.href="/mysl?status=2&txpay=${txpay}";
    	}
    }
</script>