<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
UserService userServiceJflc2 = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc2 = userServiceJflc2.getUserByUserName(userServiceJflc2.isLogin(request.getSession().getId()));
%>
<div class="system">
					<h3>积分理财</h3>
					<ul>
						<li><a href="/vipgo">我要充值</a></li>
						<!-- <li><a href="#">积分竞猜</a></li>
						<li><a href="#">积分抢购</a></li>
						<li><a href="#">积分游戏</a></li> -->
						<li><a href="/mysl">积分买入(求购)</a></li>
						<li><a href="/mcsl">积分卖出(出售)</a></li>
						<li><a href="/gpjy">积分交易明细</a></li>
						<li><a href="/gpjysc">积分交易市场</a></li>
						<li>积分拆分次数:<%=gcuserJflc2.getCfa() %></li>
						<li>积分拆分倍数:<%=gcuserJflc2.getCfb() %></li>
			        </ul>
				</div>