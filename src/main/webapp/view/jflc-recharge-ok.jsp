<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="本公司【①号】客服QQ：613697151"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="本公司【②号】客服QQ：613697152"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
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
				<div class="content-box1 new4-top">
					<div class="content-title">
						<span>注意事项</span>
					</div>
					<div class="i-gg">
					<p>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！
					<p>有任何事情请联系：${cz01}客服QQ：${qq} <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes">点击这里给我发消息</a></p>
					<p style="color: red;">各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题</p><br />
					<p>请大家尽量提前充值，尽量不要都挤压在晚上8点至10点，所有充值升级事宜要在晚上11点20分前办理
晚上11点30分后要求充值的不能及时处理属于正常现象，谢谢理解</p>
					</div>
				</div>
				<div class="content-box2 mt10">
					<div class="content-title">
						<span>汇款确认</span>
					</div>
					<div class="new4-bottom">
						<h3>您选择充值<b>${cjpay}</b>元</h3>
						<p>（注：每次充值最低100元，并以100元的整数递增，如200，300，400，同时需要加尾数）
(充值成功后显示在可用一币里，可自由购买金币卡、消费或升级开通双区业务)</p>
						<p><a href="/bank?dq=${gcuser.dqu}">点这里查看汇款账号</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>