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
<%

	

%>

        <div class="point-info">
          <p class="title"><s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/></p>
          <ul class="list">
            <%-- <li><a href="/datepay"><s:text name='Cumulative_reward_currency'/><em><%=gcuserJflc.getDlpay()%></em></a></li> --%>
            <%-- <li><s:text name='viewshop.html.shop.html.-2060498186'/> <em><%=gcuserJflc.getJbpay()%></em></a></li>
            <li><a href="/datepay?lb=103&secondThisState=249&thisState=244"><s:text name='viewshop.html.shop.html.-256393235'/> <em><%=gcuserJflc.getJjpay()%></em></a></li>
            <li><a href="/datepay?lb=105&secondThisState=249&thisState=244"><s:text name='viewshop.html.shop.html.994834486'/> <em><%=gcuserJflc.getJypay()%></em></a></li>
            <li><a href="/datepay?lb=144&secondThisState=249&thisState=244"><s:text name='viewshop.html.shop.html.-1892736228'/> <em><%=gcuserJflc.getRgpay()%></em></a></li>
            <li><a href="/datepay?lb=111&secondThisState=249&thisState=244"><s:text name='viewshop.html.shop.html.1958259639'/> <em><%=gcuserJflc.getMcpay()%></em></a></li>
             --%>
            <li><font color="red"><s:text name='moneypot'/></font><em>
            <%if(moneypot==null) {%>
            	暂时无数据
            <%}else{%>
            <%=moneypot%><%} %></em>
            <li><s:text name='viewshop.html.shop.html.-2060498186'/> <em><%=gcuserJflc.getJbpay()%></em></li>
            <li><s:text name='viewshop.html.shop.html.-256393235'/> <em><%=gcuserJflc.getJjpay()%></em></li>
            <li><s:text name='viewshop.html.shop.html.994834486'/> <em><%=gcuserJflc.getJypay()%></em></li>
            <li><s:text name='viewshop.html.shop.html.-1892736228'/> <em><%=gcuserJflc.getRgpay()%></em></li>
            <li><s:text name='viewshop.html.shop.html.1958259639'/> <em><%=gcuserJflc.getMcpay()%></em></li>
            <li><s:text name='viewlinks.html.links.html.649202784'/> <em><%=gcuserJflc.getJydb()%></em></li>
            <li><s:text name='viewshop.html.shop.html.950786681'/> <em><%=ajygj%></em></li>
            <li><s:text name='viewshop.html.shop.html.950947478'/> <em><%=gcuserJflc.getJyg()%></em></li>
            <li><s:text name='viewjflc.jsp.jflc.jsp.-1002641178'/> <em><%=gcuserJflc.getCfa()%></em></li>
            <li><s:text name='viewjflc.jsp.jflc.jsp.-1002856070'/><em><%=gcuserJflc.getCfb()%></em></li>
            <%--
            <li><s:text name='viewgrxx.jsp.grxx.jsp.-1088456654'/> <em><%=gcuserJflc.getGdgc() %></em></li>
            <li><s:text name='viewgrxx.jsp.grxx.jsp.989746478'/><em><%=gcuserJflc.getLjfh()%></em></li>
            <li><s:text name='viewyblc.jsp.yblc.jsp.1710120446'/><em><%=gcuserJflc.getCxt()%></em></li> --%>
            <li class="member-stars"><span><s:text name='viewyblc.jsp.yblc.jsp.1710120446'/>：</span>
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
       <%--  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	$.ajax({
		 url:'http://192.168.2.3:8100/web/ym/get_moneybox_amt?username=william123',
		 success:function(data){
			 console.info(data);
			 document.getElementById('em').innerHTML=data.data;
			 
		 }
		
	});
  })
</script> --%>
