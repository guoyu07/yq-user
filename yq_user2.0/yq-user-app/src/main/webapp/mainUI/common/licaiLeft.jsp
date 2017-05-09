<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.ManagerService"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.bo.Fcxt"%>
<%@page import="com.yq.common.utils.Global"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
 --%>
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
        <div class="point-info">
          <p class="title"><s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/></p>
          <ul class="list">
            <li><a href="/datepay"><s:text name='Cumulative_reward_currency'/><em><%=gcuserJflc.getDlpay()%></em></a></li>
            <li><a href="/datepay?lb=9"><s:text name='viewshop.html.shop.html.-2060498186'/> <em><%=gcuserJflc.getJbpay()%></em></a></li>
            <li><a href="/datepay?lb=1"><s:text name='viewshop.html.shop.html.-256393235'/> <em><%=gcuserJflc.getJjpay()%></em></a></li>
            <li><a href="/datepay?lb=8"><s:text name='viewshop.html.shop.html.994834486'/> <em><%=gcuserJflc.getJypay()%></em></a></li>
            <li><a href="/datepay?lb=2"><s:text name='viewshop.html.shop.html.-1892736228'/> <em><%=gcuserJflc.getRgpay()%></em></a></li>
            <li><a href="/datepay?lb=3"><s:text name='viewshop.html.shop.html.1958259639'/> <em><%=gcuserJflc.getMcpay()%></em></a></li>
            <p><s:text name='viewlinks.html.links.html.649202784'/> <em><%=gcuserJflc.getJydb()%></em></p>
            <p><s:text name='viewshop.html.shop.html.950786681'/> <em><%=ajygj%></em></p>
            <p><s:text name='viewshop.html.shop.html.950947478'/> <em><%=gcuserJflc.getJyg()%></em></p>
            <p><s:text name='viewjflc.jsp.jflc.jsp.-1002641178'/> <em><%=gcuserJflc.getCfa()%></em></p>
            <p><s:text name='viewjflc.jsp.jflc.jsp.-1002856070'/><em><%=gcuserJflc.getCfb()%></em></p>
          </ul>
        </div>
