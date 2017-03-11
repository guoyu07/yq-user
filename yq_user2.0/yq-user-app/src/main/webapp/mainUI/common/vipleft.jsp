<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
 <%
UserService userServiceJflc2 = ServiceCacheFkactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc2 = userServiceJflc2.getUserByUserName(userServiceJflc2.isLogin(request.getSession().getId()));
%> --%>
      <%-- <div class="point-info">
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
         --%>
        <div class="point-info">
    <p class="title">VIP中心</p>
    <ul class="list">
      <li>充值币余额<em><%=gcuserHead.getVipcjcjb()%></em></li>
      <li>累计充值数量<em><%=gcuserHead.getVipljcjb()%></em></li>
      <li>已使用充值币<em><%=gcuserHead.getVipsycjb()%></em></li>
      <li>备用报单币<em><%=gcuserHead.getSyep()%></em></li>
    </ul>
    <%-- <c:if test="${gcuser.vip==2}"><p class="widget-tips mt10"><a href="vipcjb">VIP充值管理（累计充值币：${gcuser.vipljcjb}）（已使用：${gcuser.vipsycjb}）（剩余：${gcuser.vipcjcjb}）</a></p></c:if> --%>
  </div>
