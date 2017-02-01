<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
UserService userServiceyblc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser yblcGcuser = userServiceyblc.getUserByUserName(userServiceyblc.isLogin(request.getSession().getId()));
%>
<div class="point-info">
    <p class="title">一币理财</p>
    <ul class="list">
    <%if(yblcGcuser.getUsername().equals("300fhk")||yblcGcuser.getUsername().equals("zxz888")){
				%><%="<li><a href=\"/glpay\">商城退款</a></li>"%>
			<%}%>
			<%if(yblcGcuser.getUsername().equals("zxz888")){
				%><%="<li><a href=\"/backscores\">商城退购物券</a></li>"%>
	 <%}%>
	  <li><a href="/datepay">一币变化明细</a></li>
      <%if(yblcGcuser.getVip()!=0){%><%="<li><a  href='vipjzpay'>一币转出</a></li>"%><%}else{%>
      <%="<li><a href='/login2j?inputUrl=login3j.jsp'>一币卖出</a></li>"%><%}%>
      <li><a href="/login2j?inputUrl=login8j.jsp">一币交易市场</a></li>
      <li><a href="/login2j?inputUrl=loginmc.jsp">一币卖出明细</a></li>
      <li><a href="/login2j?inputUrl=loginmy.jsp">一币认购明细</a></li>
      <li><a href="/login2j?inputUrl=login5j.jsp">一币购金币卡</a></li>
      <li><a href="/ybPresent">一币捐助区</a></li>
      <p class="member-stars"><span>当前信用星：</span>
        <%=yblcGcuser.getCxt()%>
        <i class="icon-member-star on"></i>
        <i class="icon-member-star on"></i>
        <i class="icon-member-star on"></i>
        <i class="icon-member-star"></i>
        <i class="icon-member-star"></i>
      </p>
    </ul>
  </div>