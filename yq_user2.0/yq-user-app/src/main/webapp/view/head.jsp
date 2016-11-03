<%@page import="com.yq.common.utils.MD5Security"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
	<script src="/scripts/sms.js"></script>
	<span style="display:none"><script src="http://s11.cnzz.com/z_stat.php?id=1259177711&web_id=1259177711" language="JavaScript"></script></span>
	<%
  UserService userServiceHead = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuserHead = userServiceHead.getUserByUserName(userServiceHead.isLogin(request.getSession().getId()));
  String key="lladsfkk@331";
  String time = new Date().getTime()+"";
  String sign = MD5Security.code(gcuserHead.getUsername()+key+time, 32).toLowerCase();
%>

<div class="header">
	<div class="logo"><a href="#"><img src="/images/logo.jpg" /></a></div>
	<div class="nav">
		<ul>
			<li><a href="/manager">
			 <c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}">    
						<img src="/images/sy_<s:text name='#SESSION_LOCALE'/>.png" />
		   				</c:when>
						<c:otherwise>
							<img src="/images/sy.png" />    
		   				</c:otherwise> 
		   	</c:choose>
			</a></li>
			<li><a href="#">
			 <c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}">    
						<img src="/images/cfzx_<s:text name='#SESSION_LOCALE'/>.png" vertical-align="center"/>
		   				</c:when>
						<c:otherwise>
							<img src="/images/cfzx.png" />    
		   				</c:otherwise> 
		   	</c:choose>
		   	</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/vipgo"><s:text name='viewjflc.jsp.jflc.jsp.951062035'/></a>
					<a href="/login2j?inputUrl=login3j.jsp"><s:text name='viewyblc.jsp.yblc.jsp.618950045'/></a>
					<a href="/sgks01"><s:text name='viewlinks.html.links.html.627723500'/></a>
					<a href="/datepay"><s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/></a>
					<a href="#" class="close"><s:text name='viewhead.jsp.head.jsp.1099577248'/></a>
				</div>
			</li>
			<li><a href="#">
			 <c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}">    
						<img src="/images/zhgl_<s:text name='#SESSION_LOCALE'/>.png" />
		   				</c:when>
						<c:otherwise>
							<img src="/images/zhgl.png" />    
		   				</c:otherwise> 
		   	</c:choose>
				</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/tjz"><s:text name='viewhead.jsp.head.jsp.742540524a'/></a>
					<a href="/regTheSame"><s:text name='viewhead.jsp.head.jsp.742540524b'/></a>
					<a href="/tgdown"><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/></a>
					<a href="/tgurl"><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></a>
					<a href="#" class="close"><s:text name='viewhead.jsp.head.jsp.742540524'/></a>
				</div>
			</li>
			<li><a href="#"> 
			<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}">    
						<img src="/images/xfgl_<s:text name='#SESSION_LOCALE'/>.png" />
		   				</c:when>
						<c:otherwise>
							<img src="/images/xfgl.png" />    
		   				</c:otherwise> 
		   	</c:choose>
		   		</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/hfcz"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/>(100)</a>
					<a target="_blank" href="http://www.kypwe.com"><s:text name='keshanpiaowu'/></a>
					<a target="_blank" href="http://www.qlsme.com/shop/index.php?act=login&op=ycvipindex&userName=<%=gcuserHead.getUsername()%>&sign=<%=sign%>&time=<%=time%>"><s:text name='HAPPY100_online'/></a>
					<a href="/baby"><s:text name='eloquence_training_camp'/></a>
					<a href="#" class="close"><s:text name='viewhead.jsp.head.jsp.871093494'/></a>
				</div>
			</li>
			<li><a href="/vipup">
			<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}">    
						<img src="/images/kfzx_<s:text name='#SESSION_LOCALE'/>.png" />
		   				</c:when>
						<c:otherwise>
							<img src="/images/kfzx.png" />    
		   				</c:otherwise> 
		   	</c:choose>
				</a></li>
		</ul>
	</div>
</div>
