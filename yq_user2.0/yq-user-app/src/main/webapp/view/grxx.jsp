<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  UserService userService1 = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuser1 = userService1.getUserByUserName(userService1.isLogin(request.getSession().getId()));
%>
<SCRIPT>
function openwindow2(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
    }
</SCRIPT>
				<div class="system">
					<h3><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></h3>
					<ul>
						<li><a href="tgurl"><s:text name='viewgrxx.jsp.grxx.jsp.865821164'/></a></li>
						<li><a href="login2j?inputUrl=login2j.jsp"><s:text name='viewgrxx.jsp.grxx.jsp.471675913'/></a></li>
						<li><a target="_blank" href="http://bbs.zgyce.com"><s:text name='viewinformation.html.information.html.716972225'/></a></li>
						<li><a href="gcbf?lb=0"><s:text name='viewgrxx.jsp.grxx.jsp.-1088456654'/>：<span class="c-b"><%=gcuser1.getGdgc() %></span></a></li>
						<li><a href="gcbf?lb=1"><s:text name='viewgrxx.jsp.grxx.jsp.989746478'/>：<font color="#008000"><%=gcuser1.getLjfh()%></font></a></li>
						<li><a target="_blank" href="http://yb.zgyce.com/sj_login.asp?sjname=<%=gcuser1.getUsername()%>"><span class="c-b"><s:text name="viewinformation.html.information.html.-2010689047"></s:text></span></a></li>
						<li><a href="ybsf"><span class="c-b"><s:text name='viewgrxx.jsp.grxx.jsp.626816442'/></span></a></li>
						<li><a href="dldate"><s:text name='viewgrxx.jsp.grxx.jsp.247726354'/></a></li>
						<li><a href="javascript: openwindow2('sfz${SESSION_LOCALE}.html');"><s:text name='viewgrxx.jsp.grxx.jsp.238200148'/></a></li>
			        </ul>
				</div>
