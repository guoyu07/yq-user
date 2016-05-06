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
					<h3>业绩查询</h3>
					<ul>
						<li><a href="/sgks01">游戏业务</a></li>
						<li>游戏级别：<span class="c-z"><%=yjcxGcuser.getSjb()%></span></li>
						<li>报单币余额：<span class="c-z"><%=yjcxGcuser.getSybdb()%></span></li>
						<li>可开户一币：<span class="c-z"><%=yjcxGcuser.getPay()+yjcxGcuser.getSyep()%></span></li>
						<li><a href="/bdbdate">报单币明细</a>
						<% if(yjcxGcuser.getVip()>0) {%>
						<%="--<a href=\"/bdbzz\">转出</a>"%>
						<%}%>
						</li>
						<li>周封奖金：<span class="c-b"><%=fdpay%></span></li>
						<li>收益比例：<span class="c-z">
						<% if(fbpay<1) {%>
						<%="0"%>
						<%}else{ %>
						<%=fbpay%>
						<%}%></span></li>
						<li>目前收益：<span class="c-r"><%=mqfh%></span></li>
			        </ul>
				</div>