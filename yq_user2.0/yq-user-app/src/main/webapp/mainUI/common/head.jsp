<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@ include file="/common/taglib.jsp"%> --%>
<%@page import="com.yq.common.utils.MD5Security"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.manage.service.ManageService"%>
<%@page import="com.yq.manage.bean.Resource"%>
	<!-- <span style="display:none"><script src="https://s11.cnzz.com/z_stat.php?id=1259177711&web_id=1259177711" language="JavaScript"></script></span> -->
<%
  UserService userServiceHead = ServiceCacheFactory.getServiceCache().getService(UserService.class);
  Gcuser gcuserHead = userServiceHead.getUserByUserName(userServiceHead.isLogin(request.getSession().getId()));
  
 /*  Gcuser vipgcuser = userServiceHead.getUserByUserName(userServiceHead.isHasVipToken(request.getSession().getId()));
   */
  String moneypot = userServiceHead.getMoneyPot(gcuserHead.getUsername());
  String key="lladsfkk@331";
  String time = new Date().getTime()+"";
  String sign = MD5Security.code(gcuserHead.getUsername()+key+time, 32).toLowerCase();
  
  ManageService manageService = ServiceCacheFactory.getService(ManageService.class);
  List<Resource> rootResource = manageService.findResourceListByResourceId(242);
  
  String thisState1 = "243";
  String thisState1temp = request.getParameter("thisState");
  if(null==thisState1temp || thisState1temp.equals("")){
	  thisState1temp = thisState1;
  } 
  String secondThisState = "248";
  String secondThisStatetemp = request.getParameter("secondThisState");
  if(null==secondThisStatetemp || secondThisStatetemp.equals("")){
	  if(thisState1temp.equals("243")){
		  secondThisState = "248";
	  }else if(thisState1temp.equals("245")){
		  secondThisState = "275";
	  }else if(thisState1temp.equals("246")){
		  secondThisState = "284";
	  }else if(thisState1temp.equals("247")){
		  secondThisState = "286";
	  }
	  
	  secondThisStatetemp = secondThisState;
  } 
  
  List<Resource> secondResource = manageService.findResourceListByResourceId(Integer.parseInt(thisState1temp));
 
%>

<div class="header" id="J_header">
  <div class="logo-container">
    <a href="#" class="logo"></a>
  </div>
  <div class="head-info">
    <form class="user-info" id="J_ebContributionForm" name="headerSameNameIdForm" action="" method="post">
      <div class="user-info-wrap">
       <div class="samename-list">
        <label><s:text name='ID_with_the_same_name'/></label>
        <div class="select-id" id="J_headerSameNameIdSelect" name="nameIdSelect" title="<%=gcuserHead.getUsername()%>">
          <p class="user-name"><span id="J_userName"><%=gcuserHead.getUsername()%></span></p>
          <div class="select-id-list" id="J_headerSameNameIdList"></div>
        </div>
        </div>
         <ul class="info-line">
           <li><label><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/>：</label><em><%=gcuserHead.getPay()%></em></li>
           <li><label><s:text name='Gold'/>：</label><em><%=gcuserHead.getJydb()%></em></li>
           <li><label><s:text name='point'/>：</label><em><%=gcuserHead.getJyg()%></em></li>
           <li><label><s:text name='Order'/>：</label><em> <%=gcuserHead.getSybdb()%></em></li>
          <%--  <li><label><s:text name='viewuser.jsp.user.jsp.35660508'/>：</label> <em><%=gcuserHead.getScores()%></em></li> --%>
          </ul>
          <span class="logout"><a href="/logout?type=1"><s:text name='Exit_login'/></a></span>
      </div>
    </form>
     
    <input type="hidden" name="thisState" value="${thisState}">
    <input type="hidden" name="secondThisState" value="${secondThisState}">
    <div class="nav">
       		 <ul class="list">
        <!--  <li><a href='/manager'><s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/></a></li>
         <li><a href='/vipgo'><s:text name='viewhead.jsp.head.jsp.1099577248'/></a></li>
         <li><a href='/tjz'><s:text name='Account_manage'/></a></li>
         <li><a href='/hfcz'><s:text name='viewhead.jsp.head.jsp.871093494'/></a></li>
         <li><a href='/vipup'><s:text name='viewservice.jsp.service.jsp.724834337'/></a></li> -->
       		 
       		       <%
			      	for (Resource re : rootResource) {
						%>
						<% if("243".equals(re.getId()+"")){%> 
				      		<li <% if(thisState1temp.equals(re.getId()+"")){%> class="active" <%} %>><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>'>
				      	<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}"> 
						<%=re.getResoCode()%>
		   				</c:when>
		   				<c:when test="${SESSION_LOCALE=='zh_CN'}">   
		   				<%=re.getResoName()%>
		   				</c:when>  
						<c:otherwise>
						<%=re.getResoName()%>
		   				</c:otherwise> 
		   				</c:choose>
				      		</a></li>
				       <%}else if("244".equals(re.getId()+"")){%> 
				      		<li <% if(thisState1temp.equals(re.getId()+"")){%> class="active" <%} %>><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>&secondThisState=248'>
						<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}"> 
						<%=re.getResoCode()%>
		   				</c:when>
		   				<c:when test="${SESSION_LOCALE=='zh_CN'}">   
		   				<%=re.getResoName()%>
		   				</c:when>  
						<c:otherwise>
						<%=re.getResoName()%>
		   				</c:otherwise> 
		   				</c:choose></a></li>
				       <%}else if("245".equals(re.getId()+"")){%> 
				      		<li <% if(thisState1temp.equals(re.getId()+"")){%> class="active" <%} %>><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>'>
				      	<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}"> 
						<%=re.getResoCode()%>
		   				</c:when>
		   				<c:when test="${SESSION_LOCALE=='zh_CN'}">   
		   				<%=re.getResoName()%>
		   				</c:when>  
						<c:otherwise>
						<%=re.getResoName()%>
		   				</c:otherwise> 
		   				</c:choose>
				      		</a></li>
				       <%}else if("246".equals(re.getId()+"")){%> 
				      		<li <% if(thisState1temp.equals(re.getId()+"")){%> class="active" <%} %>><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>'>
				      			<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}"> 
						<%=re.getResoCode()%>
		   				</c:when>
		   				<c:when test="${SESSION_LOCALE=='zh_CN'}">   
		   				<%=re.getResoName()%>
		   				</c:when>  
						<c:otherwise>
						<%=re.getResoName()%>
		   				</c:otherwise> 
		   				</c:choose>
				      		</a></li>
				       <%}else if("247".equals(re.getId()+"")){%> 
				      		<li <% if(thisState1temp.equals(re.getId()+"")){%> class="active" <%} %>><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>'>
				      	<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}"> 
						<%=re.getResoCode()%>
		   				</c:when>
		   				<c:when test="${SESSION_LOCALE=='zh_CN'}">   
		   				<%=re.getResoName()%>
		   				</c:when>  
						<c:otherwise>
						<%=re.getResoName()%>
		   				</c:otherwise> 
		   				</c:choose>
				      		</a></li>
				       <%}%>						
						
						<%
					}
				%>
        </ul>
      </div>
  </div>
</div>

<%-- <c:if test="${erroCodeNum==1860}"><script language=javascript>alert('<s:text name="System_temporarily_shut_down,_please_visit_later!"/>');history.go(-1);</script></c:if> --%>
<%-- <div class="header" id="J_header">
    <div class="logo-container">
      <a href="#" class="logo"></a>
    </div>
    <div class="head-info">
      <div class="user-info">
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
      </div>
      <div class="nav">
       		 <ul class="list">
      <%
      //try{
      	for (Resource re : rootResource) {
			%>
			<li <% if(request.getParameter("thisState").equals(re.getId()+"")){%> class="active" <%} %>><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>'><%=re.getResoName()%></a></li>
			<%
		}
      /* }catch(Exception e){
    	  
      } */
		%>
        </ul>
      </div>
    </div>
  </div> --%>
