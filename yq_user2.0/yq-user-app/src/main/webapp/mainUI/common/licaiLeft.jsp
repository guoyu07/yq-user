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
          <p class="title">账户概览</p>
          <ul class="list">
            <li><a href="/datepay">累计奖励一币 <em><%=gcuserJflc.getDlpay()%></em></a></li>
            <li><a href="/datepay?lb=9">推广部分一币 <em><%=gcuserJflc.getJbpay()%></em></a></li>
            <li><a href="/datepay?lb=1">平衡部分一币 <em><%=gcuserJflc.getJjpay()%></em></a></li>
            <li><a href="/datepay?lb=8">辅导部分一币 <em><%=gcuserJflc.getJypay()%></em></a></li>
            <li><a href="/datepay?lb=2">累计认购一币 <em><%=gcuserJflc.getRgpay()%></em></a></li>
            <li><a href="/datepay?lb=3">累计卖出一币 <em><%=gcuserJflc.getMcpay()%></em></a></li>
            <p>剩余金币 <em><%=gcuserJflc.getJydb()%></em></p>
            <p>积分单价 <em><%=ajygj%></em></p>
            <p>积分数量 <em><%=gcuserJflc.getJyg()%></em></p>
            <p>积分拆分次数 <em><%=gcuserJflc.getCfa()%></em></p>
            <p>积分拆分倍数<em><%=gcuserJflc.getCfb()%></em></p>
          </ul>
        </div>
