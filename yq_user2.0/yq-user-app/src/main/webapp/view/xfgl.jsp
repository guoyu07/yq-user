<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.ManagerService"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.bo.Fcxt"%>
<%
UserService userServiceJflc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc = userServiceJflc.getUserByUserName(userServiceJflc.isLogin(request.getSession().getId()));
%>
				<div class="system">
					<h3>消费管理</h3>
					<ul>
					<li><a href="/hfcz">话费充值(100)</a></li>
					<li><a target="_blank" href="http://www.kypwe.com">科赡票务</a></li>
					<li><a target="_blank" href="http://www.qlsme.com">幸福100</a></li>
					<li><a target="_blank" href="http://yb.zgyce.com/index.asp?vipid=<%=gcuserJflc.getUsername() %>&vippa=<%=gcuserJflc.getPassword()%>">一币换购商品</a></li>
					<li><a target="_blank" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=gcuserJflc.getUsername() %>">一币换购记录</a></li>
			        <li><a href="/baby">口才训练营报名</a></li>
			        </ul>
				</div>