<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
 <%
UserService userServiceJflc2 = ServiceCacheFkactory.getServiceCache().getService(UserService.class);
Gcuser gcuserJflc2 = userServiceJflc2.getUserByUserName(userServiceJflc2.isLogin(request.getSession().getId()));
%> --%>
      <%-- <div class="point-info">
          <p class="title"><s:text name='viewjflc.jsp.jflc.jsp.951062035'/></p>
           <ul class="list">
           <!-- <li><a href="/vipgo"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.782396711'/></a></li>
            <li><a href="/login2j?inputUrl=login6j.jsp"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></a></li>
            <li><a href="/gpjy"><s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/></a></li>
            <li><a href="/gpjysc"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></a></li> -->
           <li><s:text name='viewjflc.jsp.jflc.jsp.-1002641178'/><em><%=gcuserHead.getCfa() %></em></li>
           <li><s:text name='viewjflc.jsp.jflc.jsp.-1002856070'/><em><%=gcuserHead.getCfb() %></em></li>
          </ul>
        </div>
         --%>
        <div class="point-info">
    <p class="title">VIP中心</p>
    <ul class="list">
      <li><s:text name='Currency_balance'/><em style="font-size: 10px;font-weight:bold;"><%=gcuserHead.getVipcjcjb()%></em></li>
      <li><s:text name='Cumulative_recharge'/><em  style="font-size: 10px;font-weight:bold;"><%=gcuserHead.getVipljcjb()%></em></li>
      <li><s:text name='Prepaid_coins'/><em  style="font-size: 10px;font-weight:bold;"><%=gcuserHead.getVipsycjb()%></em></li>
      <li><s:text name='viewlinks.html.links.html.-881818137'/><em style="font-size: 10px;font-weight:bold;"><%=gcuserHead.getSyep()%></em></li>
    </ul>
    <%-- <c:if test="${gcuser.vip==2}"><p class="widget-tips mt10"><a href="vipcjb"><s:text name='VIP_recharge_management'/>（<s:text name='Cumulative_recharge'/>：${gcuser.vipljcjb}）（<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1480031139a'/>：${gcuser.vipsycjb}）（<s:text name='Surplus'/>：${gcuser.vipcjcjb}）</a></p></c:if> --%>
  </div>
