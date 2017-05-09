<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
UserService userServiceyblc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser yblcGcuser = userServiceyblc.getUserByUserName(userServiceyblc.isLogin(request.getSession().getId()));
%>
<div class="point-info">
    <p class="title"><s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
    <ul class="list">
    <%if(yblcGcuser.getUsername().equals("300fhk")||yblcGcuser.getUsername().equals("zxz888")){
				%><%="<li><a href=\"/glpay\"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/></a></li>"%>
			<%}%>
			<%if(yblcGcuser.getUsername().equals("zxz888")){
				%><%="<li><a href=\"/backscores\"><s:text name='Shopping_mall'/></a></li>"%>
	 <%}%>
	  <li><a href="/datepay"><s:text name='viewlinks.html.links.html.1846650039'/></a></li>
      <%if(yblcGcuser.getVip()!=0){%><%="<li><a  href='vipjzpay'><s:text name='Currency_transfer'/></a></li>"%><%}else{%>
      <%="<li><a href='/login2j?inputUrl=login3j.jsp'><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.618675493'/></a></li>"%><%}%>
      <li><a href="/login2j?inputUrl=login8j.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1811565864'/></a></li>
      <li><a href="/login2j?inputUrl=loginmc.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1842504285'/></a></li>
      <li><a href="/login2j?inputUrl=loginmy.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></a></li>
      <li><a href="/login2j?inputUrl=login5j.jsp"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></a></li>
      <li><a href="/ybPresent"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2003028320'/></a></li>
      <p class="member-stars"><span><s:text name='viewyblc.jsp.yblc.jsp.1710120446'/>：</span>
        <%=yblcGcuser.getCxt()%>
        <i class="icon-member-star on"></i>
        <i class="icon-member-star on"></i>
        <i class="icon-member-star on"></i>
        <i class="icon-member-star"></i>
        <i class="icon-member-star"></i>
      </p>
    </ul>
  </div>
