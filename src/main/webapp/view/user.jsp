<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuser = userService.getUserByUserName(userService.isLogin(request.getSession().getId()));
%>
<div class="user">
	<p class="z-tc pt10">用户名：<span class="c-f"><a href="/userlist"><%=gcuser.getUsername()%></a>【<a href="/logout?type=1">登出</a>】</span></p>
	<p class="mb20"><span class="c-z1 z-fl"></span></p>
	<p>当前可用一币：<span class="c-z z-fl"><%=gcuser.getPay()%></span></p>
	<p>累计交易一币：<span class="z-fl"><%=gcuser.getCbpay()%></span></p>
	<p>累计使用一币：<span class="z-fl"><%=gcuser.getTxpay()%></span></p>
</div>