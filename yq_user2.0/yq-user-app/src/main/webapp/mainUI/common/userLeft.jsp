<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.ManagerService"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.bo.Fcxt"%>
<%@page import="com.yq.common.utils.Global"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%
  UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuser = userService.getUserByUserName(userService.isLogin(request.getSession().getId()));
%>

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
        <div class="user-info">
          <div class="head-pic">
            <p class="title"><s:text name='user'/></p>
            <img src="${ctx}/img/user_head.png" width="102" height="102">
          </div>
          <ul class="user-detail">
           <!--  <li class="login-info"><span>上次登录：</span><em></em></li> -->
            <li ><!-- class="user-name" --><span><s:text name='reg.jsp.reg.jsp.29623262'/>：</span><a href="userlist?secondThisState=292&thisState=245"><%=gcuser.getUsername()%></a></li>
            <li class="eb-exchange"><span><s:text name='viewuser.jsp.user.jsp.1504881972'/>：</span><em><%=gcuser.getPay()%></em></li>
            <li class="eb-exchange"><span><s:text name='viewuser.jsp.user.jsp.1927395202'/>：</span><em><%=gcuser.getCbpay()%></em></li>
            <li class="eb-exchange"><span><s:text name='viewuser.jsp.user.jsp.1937629852'/>：</span><em><%=gcuser.getTxpay()%></em></li>
           <%-- 	<% if(Global.OpenScoresPay){
			 %>
			<li class="eb-exchange"><span><s:text name='viewuser.jsp.user.jsp.35660508'/>：</span><a href="/userscoreslog"><%=gcuser.getScores()%></a></li>
			<%
			}
			%> --%>
			 <li class="eb-exchange"><span><s:text name='viewlinks.html.links.html.865732987'/>：</span><em><%=gcuser.getSjb()%></em></li>
          </ul>
        </div>
