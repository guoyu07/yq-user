<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.common.utils.Global"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuser = userService.getUserByUserName(userService.isLogin(request.getSession().getId()));
%>
<div class="user">
	<p class="z-tc pt10"><!-- <s:text name='reg.jsp.reg.jsp.29623262'/>： --><span class="c-f"><a href="/userlist"><%=gcuser.getUsername()%></a>【<a href="/logout?type=1"><s:text name='viewuser.jsp.user.jsp.-559633485'/></a>】</span></p>
	<p class="c-z z-fl"><span class="c-z1 z-fl"></span></p>
	<p><s:text name='viewuser.jsp.user.jsp.1504881972'/>：<span class="c-z z-fl"><%=gcuser.getPay()%></span></p>
	<p><s:text name='viewuser.jsp.user.jsp.1927395202'/>：<span class="z-fl"><%=gcuser.getCbpay()%></span></p>
	<p><s:text name='viewuser.jsp.user.jsp.1937629852'/>：<span class="z-fl"><%=gcuser.getTxpay()%></span></p>
	<% if(Global.OpenScoresPay){
	 %>
	<p><s:text name='viewuser.jsp.user.jsp.35660508'/>：<span class="z-fl"><a href="/userscoreslog"><%=gcuser.getScores()%></a></span></p>
	<%
	}
	%>
</div>
