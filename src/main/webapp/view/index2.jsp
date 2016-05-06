<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${isHaveTxPayBuy==true}"><script language=javascript>alert('您有认购他人一币还没有付款，请尽快完成付款！');location.replace('epmyjl');</script></c:if>
<c:if test="${isHaveTxPaySale==true}"><script language=javascript>alert('您的一币卖出已有他人收购并给您付款，请你尽快查收并及时确认，如有问题联系客服！');location.replace('epmcjl');</script></c:if>
<c:if test="${dq=='0' or dq=='2' or dq=='7' or dq=='8'}">
<c:set var="cz01" value="中国一川【①号】客服QQ：613697151"></c:set>
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<c:if test="${dq=='1' or dq=='3' or dq=='4' or dq=='5' or dq=='6'}">
<c:set var="cz01" value="中国一川【②号】客服QQ：613697152"></c:set>
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
	<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>公告</span>
					</div>
					<div class="i-gg">
						根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！
	有任何事情请联系：${gcuserup.qq}<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a><br /><br />
	各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题<a href="/bank?dq=${dq}" style="text-decoration: none">本服务中心已配备指定的客服人员，专用的收款账号名字为“${gcuserup.vipuser}”--点击查看汇款账号</a>
					</div>
				</div>
				<div class="content-boxindexnews mt10">
					<div class="content-title">
						<span>管理员公告</span>
					</div>
					<div class="new-list">
						<ul>
						<s:iterator var="data" value="dataList">
							<li>
								<a href="/ggck?ck=${data.id}" class="ck"><img src="/images/ck.png" /></a>
								<span><fmt:formatDate value="${data.ggdate}" type="date"/></span>
								<p><a href="/ggck?ck=${data.id}">${data.ggbt}</a></p>
							</li>
							</s:iterator>
						</ul>
						<p><aldtags:pageTag/></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="adleft" style="width:255px;height:538px;padding:0px;font:14px/20px arial;background-color:red; text-align:center;position:absolute;left:0;top:0px;background:url('/image/guanggao2.png') no-repeat;"><div style=";position:absolute; bottom:0;left:0; text-align:center;" onmouseover="this.style.cursor='pointer'"><img src="/image/huitiao2.png" onClick="closeadleft();" style="position:absolute;bottom:0" /></div></div>
<div id="adright" style="display:none;width:262px;height:363px;padding:0px;font:14px/20px arial;text-align:center;position:absolute;right:0; top:0px;background:url('/image/guanggao1.png') no-repeat;" onmouseover="this.style.cursor='pointer'" onclick="document.location='http://baoming.zgyce.com/baoming/bm/index';"><div style="position:absolute; bottom:0;left:0; text-align:center;" onClick="event.cancelBubble = true"><img src="/image/huitiao.png" style="position:absolute;bottom:0" onClick="closeadright();"/></div></div>
<script>
function closeadleft(){
	document.getElementById("adleft").style.display='none';
	return;
}
function closeadright(){
	document.getElementById("adright").style.display='none';
	return;
}
window.onload = function(){
 var adleft = document.getElementById("adleft");
 var adright = document.getElementById("adright");
 var adtop = adleft.offsetTop;
 window.onscroll = function(){
  adleft.style.top = adtop + (document.documentElement.scrollTop || document.body.scrollTop) +"px"; 
  adright.style.top = adtop + (document.documentElement.scrollTop || document.body.scrollTop) +"px"; 
 }
} 
</script>
</body>
</html>