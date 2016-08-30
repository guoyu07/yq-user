<%@page import="com.yq.user.bo.Sgxt"%>
<%@page import="com.yq.user.dao.SgxtDao"%>
<%@page import="com.yq.common.NotAllowedCode"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
UserService userServiceyblc = ServiceCacheFactory.getServiceCache().getService(UserService.class);
Gcuser yjcxGcuser = userServiceyblc.getUserByUserName(userServiceyblc.isLogin(request.getSession().getId()));

@NotAllowedCode
SgxtDao sgxDao = ServiceCacheFactory.getServiceCache().getService(SgxtDao.class);

Sgxt sgxt = sgxDao.get(yjcxGcuser.getUsername());
double fbpay = 0d;
double mqfh = 0d;
if(sgxt!=null){
	if(sgxt.getFhbl()==0.005){
		fbpay=0.5;
	}else if(sgxt.getFhbl()==0.01){
		fbpay = 1;
	}
	mqfh = sgxt.getMqfh();
}
int fdpay=0;
int asjb = yjcxGcuser.getSjb();
if( asjb==1 ){
	 fdpay=2000;
}else if( asjb==2){
	 fdpay=4000;
}else if( asjb==4){
	fdpay=8000;
}else if( asjb==10){
	fdpay=20000;
}else if( asjb==20){
	fdpay=40000;
}else if( asjb==40){
	fdpay=80000;
}else if( asjb==100){
	fdpay=200000;
}
%>
				<div class="system">
					<h3><s:text name='viewlinks.html.links.html.627723500'/></h3>
					<ul>
						<li><a href="/sgks01"><s:text name='viewlinks.html.links.html.865347806'/></a></li>
						<li><s:text name='viewlinks.html.links.html.865732987'/>：<span class="c-z"><%=yjcxGcuser.getSjb()%></span></li>
						<li><s:text name='viewlinks.html.links.html.-1788801323'/>：<span class="c-z"><%=yjcxGcuser.getSybdb()%></span></li>
						<li><s:text name='viewlinks.html.links.html.-881818137'/>：<span class="c-z"><%=yjcxGcuser.getPay()+yjcxGcuser.getSyep()%></span></li>
						<li><a href="/bdbdate"><s:text name='viewlinks.html.links.html.-1741306770a'/></a>
						<% if(yjcxGcuser.getVip()>0) {%>
						<%="--<a href=\"/bdbzz\"><s:text name='viewlinks.html.links.html.1159182'/></a>"%>
						<%}%>
						</li>
						<li><s:text name='viewlinks.html.links.html.667104660'/>：<span class="c-b"><%=fdpay%></span></li>
						<li><s:text name='viewlinks.html.links.html.801984907'/>：<span class="c-z">
						<% if(fbpay<1) {%>
						<%="0"%>
						<%}else{ %>
						<%=fbpay%>
						<%}%></span></li>
						<li><s:text name='viewlinks.html.links.html.928097715'/>：<span class="c-r"><%=mqfh%></span></li>
			        </ul>
				</div>
