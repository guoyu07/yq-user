<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
UserService userServiceyblc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser yblcGcuser = userServiceyblc.getUserByUserName(userServiceyblc.isLogin(request.getSession().getId()));
%>
<div class="system">
					<h3>一币理财</h3>
					<ul>
						<%if(yblcGcuser.getUsername().equals("300fhk")){
							%><%="<li><a href=\"/glpay\">商城退款</a></li>"%>
						<%}%>
						<li><a href="/datepay">一币明细</a></li>
						<li><a href="/login2j?inputUrl=login3j.jsp">一币卖出</a><%if(yblcGcuser.getVip()!=0){%><%="--<b><a  href='vipjzpay'>转出</a></b>"%><%}%></li>
						<li>当前信用星: <font color="#0000FF"><%=yblcGcuser.getCxt()%></font></li>
						<li><a href="/login2j?inputUrl=login8j.jsp">一币交易市场</a></li>
						<li><a href="/login2j?inputUrl=loginmc.jsp">一币卖出明细</a></li>
						<li><a href="/login2j?inputUrl=loginmy.jsp">一币认购明细</a></li>
						<li><a href="/login2j?inputUrl=login5j.jsp">一币购金币卡</a></li>
						<li><a href="/ybPresent">一币捐助区</a></li>
			        </ul>
</div>