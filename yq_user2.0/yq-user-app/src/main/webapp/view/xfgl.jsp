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
					<h3><s:text name='viewhead.jsp.head.jsp.871093494'/></h3>
					<ul>
					<li><a href="/hfcz"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/>(100)</a></li>
					<li><a target="_blank" href="http://www.kypwe.com"><s:text name='keshanpiaowu'/></a></li>
					<li><a target="_blank" href="http://www.qlsme.com"><s:text name='HAPPY100_online'/></a></li>
					<li><a target="_blank" href="http://yb.zgyce.com/index.asp?vipid=<%=gcuserJflc.getUsername() %>&vippa=<%=gcuserJflc.getPassword()%>"><s:text name='Yibiexchange_goods'/></a></li>
					<li><a target="_blank" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=gcuserJflc.getUsername() %>"><s:text name='Yibiexchange_record'/></a></li>
			        <li><a href="/baby"><s:text name='eloquence_training_camp'/></a></li>
			        </ul>
				</div>
