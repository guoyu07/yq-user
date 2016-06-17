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
					<h3>个人信息</h3>
					<ul>
						<li><a href="tgurl">游戏规则</a></li>
						<li><a href="login2j?inputUrl=login2j.jsp">修改个人信息</a></li>
						<li><a target="_blank" href="http://bbs.zgyce.com">学习专区</a></li>
						<li><a href="gcbf?lb=0">分红点总数：<span class="c-b"><%=gcuser1.getGdgc() %></span></a></li>
						<li><a href="gcbf?lb=1">累计分红：<font color="#008000"><%=gcuser1.getLjfh()%></font></a></li>
						<li><a target="_blank" href="http://yb.zgyce.com/sj_login.asp?sjname=<%=gcuser1.getUsername()%>"><span class="c-b">管理我的商店</span></a></li>
						<li><a href="ybsf"><span class="c-b">商户管理系统</span></a></li>
						<li><a href="dldate">查看登录日志</a></li>
						<li><a href="javascript: openwindow2('sfz.html');">查看用户协议</a></li>
			        </ul>
				</div>