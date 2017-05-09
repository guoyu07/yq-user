<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.yq.common.utils.MD5Security"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
	<!-- <span style="display:none"><script src="https://s11.cnzz.com/z_stat.php?id=1259177711&web_id=1259177711" language="JavaScript"></script></span> -->
	<%
  UserService userServiceHead = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuserHead = userServiceHead.getUserByUserName(userServiceHead.isLogin(request.getSession().getId()));
  String key="lladsfkk@331";
  String time = new Date().getTime()+"";
  String sign = MD5Security.code(gcuserHead.getUsername()+key+time, 32).toLowerCase();
%>

<div class="header" id="J_header">
    <div class="logo-container">
      <a href="#" class="logo"></a>
    </div>
    <div class="head-info">
      <div class="user-info">
      <form class="user-info" id="J_ebContributionForm" name="headerSameNameIdForm" action="" method="post">
        <div class="user-info-wrap">
          <span><s:text name='ID_with_the_same_name'/></span>
          <div class="select-id" id="J_headerSameNameIdSelect" name="nameIdSelect" title="<%=gcuserHead.getUsername()%>">
          <p class="user-name"><span id="J_userName"><%=gcuserHead.getUsername()%></span></p>
          <div class="select-id-list" id="J_headerSameNameIdList"></div>
          </div>
          <span><s:text name='viewuser.jsp.user.jsp.1504881972'/>：</span><em><%=gcuserHead.getPay()%></em>
          <span><s:text name='viewuser.jsp.user.jsp.1927395202'/>：</span>
          <em><%=gcuserHead.getCbpay()%></em>
          <span><s:text name='viewuser.jsp.user.jsp.1937629852'/>：</span>
          <em><%=gcuserHead.getTxpay()%></em>
          <span class="logout"><a href="/logout?type=1"><s:text name='Exit_login'/></a></span>
      	</div>
      	</form>
      </div>
      <div class="nav">
        <ul class="list">
          <li><a href='/manager'><s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/></a></li>
          <li><a href='/vipgo'><s:text name='viewhead.jsp.head.jsp.1099577248'/></a></li>
          <li><a href='/tgurl'><s:text name='Account_manage'/></a></li>
          <li><a href='/hfcz'><s:text name='viewhead.jsp.head.jsp.871093494'/></a></li>
          <li><a href='/vipup'><s:text name='viewservice.jsp.service.jsp.724834337'/></a></li>
        </ul>
      </div>
    </div>
  </div>
