<%@page import="com.yq.common.utils.MD5Security"%>
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
  String key="lladsfkk@331";
  String time = new Date().getTime()+"";
  String sign = MD5Security.code(gcuserHead.getUsername()+key+time, 32).toLowerCase();
%>
<div class="header">
	<div class="logo"><a href="#"><img src="/images/logo.jpg" /></a></div>
	<div class="nav">
		<ul>
			<li><a href="/manager"><img src="/images/sy.png" /></a></li>
			<li><a href="#"><img src="/images/cfzx.png" vertical-align="center"/></a>
				<div class="ej">
					<span class="close"></span>
					<a href="/vipgo">积分理财</a>
					<a href="/login2j?inputUrl=login3j.jsp">一币理财</a>
					<a href="/bdbdate">业绩查询</a>
					<a href="/datepay">账户概览</a>
					<a href="#" class="close">财富中心</a>
				</div>
			</li>
			<li><a href="#"><img src="/images/zhgl.png" /></a>
				<div class="ej">
					<span class="close"></span>
					<a href="/tjz">同名帐户管理</a>
					<a href="/regTheSame">添加同名帐户</a>
					<a href="/tgdown">我的客户</a>
					<a href="/tgurl">个人信息</a>
					<a href="#" class="close">帐户管理</a>
				</div>
			</li>
			<li><a href="#"><img src="/images/xfgl.png" /></a>
				<div class="ej">
					<span class="close"></span>
					<a href="/hfcz">话费充值(100)</a>
					<a target="_blank" href="http://www.kypwe.com">科赡票务</a>
					<a target="_blank" href="http://www.zgybe.com/shop/index.php?act=login&op=ycvipindex&userName=<%=gcuserHead.getUsername()%>&sign=<%=sign%>&time=<%=time%>">一币新商城</a>
					<a href="/baby">口才训练营报名</a>
					<a href="#" class="close">消费管理</a>
				</div>
			</li>
			<li><a href="/vipup"><img src="/images/kfzx.png" /></a></li>
		</ul>
	</div>
</div>
