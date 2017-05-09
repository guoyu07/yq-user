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
<script type="text/javascript">

function bybdblog(){
	window.location.href="bybdblog";
}
function bdbzz(){
	window.location.href="bdbzz";
}

function bdbdate(){
	window.location.href="bdbdate";
}
function bdbcz(){
	window.location.href="bdbcz";
}
 

</script>
  <div class="point-info">
    <p class="title"><s:text name='viewlinks.html.links.html.627723500'/></p>
    <ul class="list">
       <li><s:text name='viewlinks.html.links.html.865732987'/>:<em><%=yjcxGcuser.getSjb()%></em></li>
      <%-- 
      <li class="special">
		     <s:text name='viewyjcx.jsp.yjcx.jsp.-1788801323'/><em><%=yjcxGcuser.getSybdb()%></em><% if(yjcxGcuser.getVip()>0) {%>--<a href="bdbzz"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1246610827'/></a><%}%>
		    </li>
		<% if(yjcxGcuser.getVip()==2) {%>
			<li class="special">
	        <a href="bybdblog"><s:text name='viewlinks.html.links.html.-881818137'/></a><em><%=yjcxGcuser.getSyep()%></em>
		    </li>
		    <li class="special">
		     <a href="bdbdate"><s:text name='viewlinks.html.links.html.-1741306770a'/></a>--<a href="bdbcz"><s:text name='Recharge'/></a>
		    </li>
		 <li><label onclick="bybdblog()"><s:text name='viewlinks.html.links.html.-881818137'/></label><em><%=yjcxGcuser.getSyep()%></em>--<b onclick="bdbzz()"><s:text name='viewlinks.html.links.html.1159182'/></b></p></li>
      	 <li><label onclick="bdbdate()"><s:text name='viewlinks.html.links.html.-1741306770a'/></label>--<b onclick="bdbcz()"><s:text name='Recharge'/></b></li>
		<%}else{%>
		 <li><a href="bybdblog"><s:text name='viewlinks.html.links.html.-881818137'/><em><%=yjcxGcuser.getSyep()%></em></a></li>
      	 <li><a href="bdbdate"><s:text name='viewlinks.html.links.html.-1741306770a'/></a></li>
		<%}%>
		 --%>
		<li><s:text name='viewlinks.html.links.html.667104660'/>：<em><%=fdpay%></em></li>
		<%-- <li><s:text name='viewlinks.html.links.html.801984907'/>：<em>
		<% if(fbpay<1) {%>
		<%="0"%>
		<%}else{ %>
		<%=fbpay%>
		<%}%></em></li>
      <li><s:text name='Current_income'/>:<em><%=mqfh%></em></li> --%>
    </ul>
  </div>
