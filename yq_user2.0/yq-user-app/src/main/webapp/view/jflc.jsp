<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
UserService userServiceJflc2 = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc2 = userServiceJflc2.getUserByUserName(userServiceJflc2.isLogin(request.getSession().getId()));
%>
<div class="system">
					<h3><s:text name='vipadmin_menu.jsp.admin_menu.jsp.951062035'/></h3>
					<ul>
						<li><a href="/vipgo"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.782396711'/></a></li>
						<!-- <li><a href="#"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.951109685'/></a></li>
						<li><a href="#"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.950924034'/></a></li>
						<li><a href="#"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.951004942'/></a></li> -->
						<li><a href="/mysl"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1561011545'/></a></li>
						<li><a href="/mcsl"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-398700255'/></a></li>
						<li><a href="/gpjy"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1151284962'/></a></li>
						<li><a href="/gpjysc"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1151358946'/></a></li>
						<li><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1002641178'/>:<%=gcuserJflc2.getCfa() %></li>
						<li><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1002856070'/>:<%=gcuserJflc2.getCfb() %></li>
			        </ul>
				</div>