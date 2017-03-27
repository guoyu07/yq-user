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
    <ul class="list">
      <li class="special">
		     购物券<em><%=yjcxGcuser.getScores()%></em><% if(yjcxGcuser.getVip()>0) {%><!-- <a href="bdbzz">转出</a> --><%}%>
		    </li>
    </ul>
