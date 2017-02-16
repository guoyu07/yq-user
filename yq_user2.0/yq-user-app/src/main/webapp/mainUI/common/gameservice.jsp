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
    <p class="title">业绩查询</p>
    <ul class="list">
      <li><a href="sgks01">游戏业务</a></li>
      <p>游戏级别<em><%=yjcxGcuser.getSjb()%></em></p>
      
      <li class="special">
		     报单币余额<em><%=yjcxGcuser.getSybdb()%></em><% if(yjcxGcuser.getVip()>0) {%>--<a href="bdbzz">转出</a><%}%>
		    </li>
		<% if(yjcxGcuser.getVip()==2) {%>
			<li class="special">
	        <a href="bybdblog">备用报单币</a><em><%=yjcxGcuser.getSyep()%></em>
		    </li>
		    <li class="special">
		     <a href="bdbdate">报单币明细</a>--<a href="bdbcz">充值</a>
		    </li>
		 <%-- <li><label onclick="bybdblog()">备用报单币</label><em><%=yjcxGcuser.getSyep()%></em>--<b onclick="bdbzz()">转出</b></p></li>
      	 <li><label onclick="bdbdate()">报单币明细</label>--<b onclick="bdbcz()">充值</b></li> --%>
		<%}else{%>
		 <li><a href="bybdblog">备用报单币<em><%=yjcxGcuser.getSyep()%></em></a></li>
      	 <li><a href="bdbdate">报单币明细</a></li>
		<%}%>
		
		<li>周封奖金：<span class="c-b"><%=fdpay%></span></li>
		<li>收益比例：<span class="c-z">
		<% if(fbpay<1) {%>
		<%="0"%>
		<%}else{ %>
		<%=fbpay%>
		<%}%></span></li>
      <p>当前收益<em><%=mqfh%></em></p>
    </ul>
  </div>