<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
 <%
UserService userServiceJflc2 = ServiceCacheFkactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc2 = userServiceJflc2.getUserByUserName(userServiceJflc2.isLogin(request.getSession().getId()));
%> --%>
      <div class="point-info">
          <p class="title">积分理财</p>
           <ul class="list">
           <!-- <li><a href="/vipgo">我要充值</a></li>
            <li><a href="/login2j?inputUrl=login6j.jsp">激活金币卡</a></li>
            <li><a href="/gpjy">积分交易明细</a></li>
            <li><a href="/gpjysc">积分交易市场</a></li> -->
           <li>积分拆分次数<em><%=gcuserHead.getCfa() %></em></li>
           <li>积分拆分倍数<em><%=gcuserHead.getCfb() %></em></li>
          </ul>
        </div>
