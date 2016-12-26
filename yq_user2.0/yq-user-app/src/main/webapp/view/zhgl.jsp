<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.ManagerService"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.bo.Fcxt"%>

<%
UserService userServiceJflc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc = userServiceJflc.getUserByUserName(userServiceJflc.isLogin(request.getSession().getId()));

ManagerService managerServiceJflc = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
Fcxt fcxt = managerServiceJflc.getFcxtById(2);
double ajygj = 0;
if(fcxt!=null){
	ajygj = fcxt.getJygj();
}
%>
				<div class="system">
					<h3><s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/></h3>
					<ul>
						<li><a href="/datepay"><s:text name='viewshop.html.shop.html.2019724238'/></a>：<span class="c-r"><%=gcuserJflc.getDlpay()%></span></li>
						<li><a href="/datepay?lb=9"><s:text name='viewshop.html.shop.html.-2060498186'/></a>：<span class="c-z"><%=gcuserJflc.getJbpay()%></span></li>
						<li><a href="/datepay?lb=1"><s:text name='viewshop.html.shop.html.-256393235'/></a>：<span class="c-z"><%=gcuserJflc.getJjpay()%></span></li>
						<li><a href="/datepay?lb=8"><s:text name='viewshop.html.shop.html.994834486'/></a>：<span class="c-z"><%=gcuserJflc.getJypay()%></span></li>
						<li><a href="/datepay?lb=2"><s:text name='viewshop.html.shop.html.-1892736228'/></a>：<span class="c-g"><%=gcuserJflc.getRgpay()%></span></li>
						<li><a href="/datepay?lb=3"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1029202'/><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></a>：<span class="c-b"><%=gcuserJflc.getMcpay()%></span></li>
						<li><s:text name='viewzhgl.jsp.zhgl.jsp.649202784'/>：<span class="c-z"><%=gcuserJflc.getJydb()%></span></li>
						<li><s:text name='viewzhgl.jsp.zhgl.jsp.950786681'/>：<span class="c-r"><%=ajygj%></span></li>
						<li><s:text name='viewshop.html.shop.html.950947478'/>：<span class="c-g"><%=gcuserJflc.getJyg()%></span></li>
						<li><s:text name='viewjflc.jsp.jflc.jsp.-1002641178'/>：<span class="c-z"><%=gcuserJflc.getCfa()%></span></li>
						<li><s:text name='viewjflc.jsp.jflc.jsp.-1002856070'/>：<span class="c-g"><%=gcuserJflc.getCfb()%></span></li>
			        </ul>
				</div>
