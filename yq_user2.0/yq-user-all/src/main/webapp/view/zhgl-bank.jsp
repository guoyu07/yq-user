<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="中国一川【①号】客服QQ：613697151"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="广东省-珠海市-香洲区支行"></c:set>
<c:set var="cms" value="公司【②号】财务师"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="中国一川【②号】客服QQ：613697152"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="广东省-珠海市-香洲区支行"></c:set>
<c:set var="cms" value="公司【②号】财务师"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
        <%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box2">
					<div class="fwzxbox">
						<div class="fwzxtop">根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！<br />
							有任何事情请联系：<span style="color: #0078ff;">${gcuserup.qq}<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a><span><br />
							<span style="color: #ff0000">各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题</span>
						</div>
						<div class="fwzxc">
						<div class="fwzxc-l">
						<p>服务中心服务时间表：</p>
						早上：9点30分-11点30分<br />
						下午：13点30分-17点30分<br />
						晚上：19点30分-10点30分<br />
						</div>
						<div class="fwzxc-r">
						本服务中心${gcuserup.vipuser}专用收款账号如下：<br />
						开户名：<span style="color: #ff0000">${gcuserup.vipuser}</span><br />
						<c:if test="${not empty gcuserup.vipgh}">
						  工商银行:${gcuserup.vipgh}<br />
						</c:if>
						<c:if test="${not empty gcuserup.vipnh}">
						  农业银行:${gcuserup.vipnh}<br />
						</c:if>		
						<c:if test="${not empty gcuserup.vipjh}">
						 建设银行:${gcuserup.vipjh}<br />
						</c:if>
						<c:if test="${not empty gcuserup.vipzh}">
						  <p>中国银行:${gcuserup.vipzh}</p>
						</c:if>	
						<c:if test="${not empty gcuserup.vipcft}">
						 财付通:${gcuserup.vipcft}<br />
						</c:if>		
						<c:if test="${not empty gcuserup.vipzfb}">
						支付宝:${gcuserup.vipzfb}<br />
						</c:if>
						<p>开户行所在地：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}支行</p>											
						<span style="color: #ff0000">汇款一定要加尾数，以便查账；如：1000.22  5000.12</span><br />
						</div>
						</div>
						
						<div class="fwzxbottom">
						<strong>注意：</strong>
						本服务中心指定账号不可以复制给其它地区人员，每次汇款前请按上面公布的为准，以免担误大家宝贵的时间！<br />
						<span>打款成功后按以下格式提交给客服：</span><br />
						<span>汇至户名${gcuserup.vipuser}（XX银行）、时间、金额（金额一定要加尾数）、需要充值的用户名：XXXXXX</span><br />
						充值后可自行操作报单开户，以免担误时间，还有恳请大家不要重复联系客服，以免重复处理了，感谢大家的
						配合！<br />
						请大家尽量提前充值，尽量不要都挤压在晚上8点至10点，所有充值事宜要在晚上10点30分前办理<br />
						晚上10点30分后要求充值的不能及时处理属于正常现象，谢谢理解！<br />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>