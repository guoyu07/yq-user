<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.ManagerService"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.bo.Fcxt"%>
<%@page import="com.yq.common.utils.Global"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
 --%>
<%-- <%
UserService userServiceJflc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc = userServiceJflc.getUserByUserName(userServiceJflc.isLogin(request.getSession().getId()));

ManagerService managerServiceJflc = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
Fcxt fcxt = managerServiceJflc.getFcxtById(2);
double ajygj = 0;
if(fcxt!=null){
	ajygj = fcxt.getJygj();
}
%> --%>
        <div class="point-info">
          <p class="title">账户概览</p>
          <ul class="list">
            <%-- <li><a href="/datepay">累计奖励一币 <em><%=gcuserJflc.getDlpay()%></em></a></li> --%>
            <%-- <li>推广部分一币 <em><%=gcuserJflc.getJbpay()%></em></a></li>
            <li><a href="/datepay?lb=103&secondThisState=249&thisState=244">平衡部分一币 <em><%=gcuserJflc.getJjpay()%></em></a></li>
            <li><a href="/datepay?lb=105&secondThisState=249&thisState=244">辅导部分一币 <em><%=gcuserJflc.getJypay()%></em></a></li>
            <li><a href="/datepay?lb=144&secondThisState=249&thisState=244">累计认购一币 <em><%=gcuserJflc.getRgpay()%></em></a></li>
            <li><a href="/datepay?lb=111&secondThisState=249&thisState=244">累计卖出一币 <em><%=gcuserJflc.getMcpay()%></em></a></li>
             --%>
            <li>推广部分一币 <em><%=gcuserJflc.getJbpay()%></em></li>
            <li>平衡部分一币 <em><%=gcuserJflc.getJjpay()%></em></li>
            <li>辅导部分一币 <em><%=gcuserJflc.getJypay()%></em></li>
            <li>累计认购一币 <em><%=gcuserJflc.getRgpay()%></em></li>
            <li>累计卖出一币 <em><%=gcuserJflc.getMcpay()%></em></li>
            <li>剩余金币 <em><%=gcuserJflc.getJydb()%></em></li>
            <li>积分单价 <em><%=ajygj%></em></li>
            <li>积分数量 <em><%=gcuserJflc.getJyg()%></em></li>
            <li>积分拆分次数 <em><%=gcuserJflc.getCfa()%></em></li>
            <li>积分拆分倍数<em><%=gcuserJflc.getCfb()%></em></li>
            <%--
            <li>分红点总数 <em><%=gcuserJflc.getGdgc() %></em></li>
            <li>累计分红<em><%=gcuserJflc.getLjfh()%></em></li>
            <li>当前信用星<em><%=gcuserJflc.getCxt()%></em></li> --%>
            <li class="member-stars"><span>当前信用星：</span>
            <%if(gcuserJflc.getCxt()==1) {%>
            	<i class="icon-member-star on"></i>
            	<i class="icon-member-star"></i>
		        <i class="icon-member-star"></i>
		        <i class="icon-member-star"></i>
		        <i class="icon-member-star"></i>
            <%}else if(gcuserJflc.getCxt()==2){ %>
                <i class="icon-member-star on"></i>
            	<i class="icon-member-star on"></i>
		        <i class="icon-member-star"></i>
		        <i class="icon-member-star"></i>
		        <i class="icon-member-star"></i>
           <%}else if(gcuserJflc.getCxt()==3){ %>
            	<i class="icon-member-star on"></i>
            	<i class="icon-member-star on"></i>
		        <i class="icon-member-star on"></i>
		        <i class="icon-member-star"></i>
		        <i class="icon-member-star"></i>
           <%}else if(gcuserJflc.getCxt()==4){ %>
            	<i class="icon-member-star on"></i>
            	<i class="icon-member-star on"></i>
		        <i class="icon-member-star on"></i>
		        <i class="icon-member-star on"></i>
		        <i class="icon-member-star"></i>
            <%}else if(gcuserJflc.getCxt()>=5){ %>
            	<i class="icon-member-star on"></i>
            	<i class="icon-member-star on"></i>
		        <i class="icon-member-star on"></i>
		        <i class="icon-member-star on"></i>
		        <i class="icon-member-star on"></i>
            <%}else{ %>
            	<i class="icon-member-star"></i>
            	<i class="icon-member-star"></i>
            	<i class="icon-member-star"></i>
            	<i class="icon-member-star"></i>
            	<i class="icon-member-star"></i>
            <%} %>
	      
	      
	      
	      
	      	      
	        </li>
          </ul>
        </div>
