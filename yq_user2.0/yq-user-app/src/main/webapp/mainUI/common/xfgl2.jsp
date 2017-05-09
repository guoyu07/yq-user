<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.ManagerService"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.bo.Fcxt"%>

<%
	UserService userServiceJflc2x = ServiceCacheFactory.getServiceCache().getService(UserService.class);
	Gcuser gcuserJflc2x = userServiceJflc2x.getUserByUserName(userServiceJflc2x.isLogin(request.getSession().getId()));
%>

	  <li class="cur"><a class="root" href="/hfcz"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/>（100）</a></li>
      <li><a class="root" target="_blank" href="http://www.kypwe.com"><s:text name='keshanpiaowu'/></a></li>
      <li><a class="root" target="_blank" href="http://www.qlsme.com"><s:text name='Happiness_100_cloud_purchase_online'/></a></li>
      <li><a class="root" href="expense-eloquence-training-camp.html"><s:text name='eloquence_training_camp'/></a></li>

<!--       <li class="cur"><a href="/hfcz"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/>（100）</a></li>
      <li><a target="_blank" href="http://www.kypwe.com"><s:text name='keshanpiaowu'/></a></li>
      <li><a target="_blank" href="http://www.qlsme.com">幸福100云购在线</a></li> -->
     <%--  <li><a target="_blank" href="http://yb.zgyce.com/index.asp?vipid=<%=gcuserJflc2x.getUsername() %>&vippa=<%=gcuserJflc2x.getPassword()%>"><s:text name='Yibiexchange_goods'/></a></li>
	  <li><a target="_blank" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=gcuserJflc2x.getUsername() %>"><s:text name='Yibiexchange_record'/></a></li>
      <li><a href="/baby"><s:text name='eloquence_training_camp'/></a></li> --%>
