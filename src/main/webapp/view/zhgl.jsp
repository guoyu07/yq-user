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
					<h3>账户概览</h3>
					<ul>
						<li><a href="/datepay">累计奖金一币</a>：<span class="c-r"><%=gcuserJflc.getDlpay()%></span></li>
						<li><a href="/datepay?lb=9">推广部分一币</a>：<span class="c-z"><%=gcuserJflc.getJbpay()%></span></li>
						<li><a href="/datepay?lb=1">平衡部分一币</a>：<span class="c-z"><%=gcuserJflc.getJjpay()%></span></li>
						<li><a href="/datepay?lb=8">辅导部分一币</a>：<span class="c-z"><%=gcuserJflc.getJypay()%></span></li>
						<li><a href="/datepay?lb=2">累计认购一币</a>：<span class="c-g"><%=gcuserJflc.getRgpay()%></span></li>
						<li><a href="/datepay?lb=3">累计卖出一币</a>：<span class="c-b"><%=gcuserJflc.getMcpay()%></span></li>
						<li>剩余金币：<span class="c-z"><%=gcuserJflc.getJydb()%></span></li>
						<li>积分单价：<span class="c-r"><%=ajygj%></span></li>
						<li>积分数量：<span class="c-g"><%=gcuserJflc.getJyg()%></span></li>
						<li>积分拆分次数：<span class="c-z"><%=gcuserJflc.getCfa()%></span></li>
						<li>积分拆分倍数：<span class="c-g"><%=gcuserJflc.getCfb()%></span></li>
			        </ul>
				</div>