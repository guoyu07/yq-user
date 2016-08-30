<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
UserService userServiceyblc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser yblcGcuser = userServiceyblc.getUserByUserName(userServiceyblc.isLogin(request.getSession().getId()));
%>
<div class="system">
					<h3><s:text name='viewyblc.jsp.yblc.jsp.618950045'/></h3>
					<ul>
						<%if(yblcGcuser.getUsername().equals("300fhk")||yblcGcuser.getUsername().equals("zxz888")){
							%><%="<li><a href=\"/glpay\"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/></a></li>"%>
						<%}%>
						<%if(yblcGcuser.getUsername().equals("zxz888")){
							%><%="<li><a href=\"/backscores\"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/><s:text name='viewuser.jsp.user.jsp.35660508'/></a></li>"%>
						<%}%>
						<li><a href="/datepay"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1470113791'/></a></li>
						<li><a href="/login2j?inputUrl=login3j.jsp"><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/></a><%if(yblcGcuser.getVip()!=0){%><%="--<b><a  href='vipjzpay'><s:text name='viewlinks.html.links.html.1159182'/></a></b>"%><%}%></li>
						<li><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1710120446'/>: <font color="#0000FF"><%=yblcGcuser.getCxt()%></font></li>
						<li><a href="/login2j?inputUrl=login8j.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1811565864'/></a></li>
						<li><a href="/login2j?inputUrl=loginmc.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1842504285'/></a></li>
						<li><a href="/login2j?inputUrl=loginmy.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></a></li>
						<li><a href="/login2j?inputUrl=login5j.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></a></li>
						<li><a href="/ybPresent"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2003028320'/></a></li>
			        </ul>
</div>
