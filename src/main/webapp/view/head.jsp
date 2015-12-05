<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
	<script src="/scripts/sms.js"></script>
	<%
  UserService userServiceHead = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuserHead = userServiceHead.getUserByUserName(userServiceHead.isLogin(request.getSession().getId()));
%>
<div class="header">
	<div class="logo"><a href="#"><img src="/images/logo.jpg" /></a></div>
	<div class="nav">
		<ul>
			<li><a href="/manager">首页</a></li>
			<li><a href="#">财富中心</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/vipgo">积分理财</a>
					<a href="/login2j?inputUrl=login3j.jsp">一币理财</a>
					<a href="/bdbdate">业绩查询</a>
					<a href="/datepay">账户概览</a>
					<a href="#" class="close">财富中心</a>
				</div>
			</li>
			<li><a href="#">账户管理</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/tjz">同名帐户管理</a>
					<a href="/regTheSame">添加同名帐户</a>
					<a href="/tgdown">我的客户</a>
					<a href="/tgurl">个人信息</a>
					<a href="#" class="close">帐户管理</a>
				</div>
			</li>
			<li><a href="#">消费管理</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/hfcz">话费充值(100)</a>
					<a target="_blank" href="http://www.kypwe.com">科赡票务</a>
					<a target="_blank" href="http://www.zgybe.com">一币新商城</a>
					<a target="_blank" href="http://yb.zgyce.com/index.asp?vipid=<%=gcuserHead.getUsername() %>&vippa=<%=gcuserHead.getPassword()%>">一币换购商品</a>
					<a target="_blank" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=gcuserHead.getUsername() %>">一币换购记录</a>
					<a href="#" class="close">消费管理</a>
				</div>
			</li>
			<li><a href="/vipup">客服中心</a></li>
		</ul>
	</div>
</div>
<div id="adleft" style="width:255px;height:538px;padding:0px;font:14px/20px arial;background-color:red; text-align:center;position:absolute;left:0;top:0px;background:url('/image/guanggao2.png') no-repeat;"><div style=";position:absolute; bottom:0;left:0; text-align:center;" onmouseover="this.style.cursor='pointer'"><img src="/image/huitiao2.png" onClick="closeadleft();" style="position:absolute;bottom:0" /></div></div>
<div id="adright" style="width:262px;height:363px;padding:0px;font:14px/20px arial;text-align:center;position:absolute;right:0; top:0px;background:url('/image/guanggao1.png') no-repeat;" onmouseover="this.style.cursor='pointer'" onclick="document.location='http://baoming.zgyce.com/baoming/bm/index';"><div style="position:absolute; bottom:0;left:0; text-align:center;" onClick="event.cancelBubble = true"><img src="/image/huitiao.png" style="position:absolute;bottom:0" onClick="closeadright();"/></div></div>
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