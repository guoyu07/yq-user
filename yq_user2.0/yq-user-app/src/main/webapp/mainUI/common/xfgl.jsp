<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.ManagerService"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.user.bo.Fcxt"%>

<%
	UserService userServiceJflc2xx = ServiceCacheFactory.getServiceCache().getService(UserService.class);
	Gcuser gcuserJflc2xx = userServiceJflc2xx.getUserByUserName(userServiceJflc2xx.isLogin(request.getSession().getId()));
	/* String key="lladsfkk@331";
  	String time = new Date().getTime()+"";
  	String sign = MD5Security.code(gcuserHead.getUsername()+key+time, 32).toLowerCase(); */
%>

		<%	
	     	if(secondResource.size()==1){
	     		%>
	     		 	<%
				      	for (Resource re : secondResource) {
							%>
							<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'><%=re.getResoName()%></a>asd
							</li>
							<%
						}
					%>
	     		<%
	     	}else{
     	%>
      	
      		<%
		      	for (Resource re : secondResource) {
					%>
					<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>>
					
				     		 <%-- <% if("283".equals(re.getId()+"")){%> 
				     			<a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'><%=re.getResoName()%></a>
				     		<%}else --%><% if("284".equals(re.getId()+"")){%> 
				      		<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="active" <%} %>><a class="root" target="_blank" href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>&secondThisState=<%=re.getId()%>'><%=re.getResoName()%></a></li>
					       <%}else if("285".equals(re.getId()+"")){%> 
					      		<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="active" <%} %>><a class="root" target="_blank" href='<%=re.getResoUrl()%>shop/index.php?act=login&op=ycvipindex&userName=<%=gcuserHead.getUsername()%>&sign=<%=sign%>&time=<%=time%>&thisState=<%=re.getId()%>&secondThisState=<%=re.getId()%>'><%=re.getResoName()%></a></li>
					       <%}%>
				     		
				     </li>
					<%
				}
			%>
      			
      		<%-- <%
		      	for (Resource re : secondResource) {
					%>
					<% if("283".equals(re.getId()+"")){%> 
				      		<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="active" <%} %>><a class="root" href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>&secondThisState=<%=re.getId()%>'><%=re.getResoName()%></a></li>
				       <%}else if("284".equals(re.getId()+"")){%> 
				      		<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="active" <%} %>><a class="root" target="_blank" href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>&secondThisState=<%=re.getId()%>'><%=re.getResoName()%></a></li>
				       <%}else if("285".equals(re.getId()+"")){%> 
				      		<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="active" <%} %>><a class="root" target="_blank" href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>&secondThisState=<%=re.getId()%>'><%=re.getResoName()%></a></li>
				       <%}%>	
					<%
				}
			%> --%>
      			
      
		<%} %>
      <!-- 


 <li class="cur"><a class="root" href="/hfcz">话费充值（100）</a></li>
      <li><a class="root" target="_blank" href="http://www.kypwe.com">科赡票务</a></li>
      <li><a class="root" target="_blank" href="http://www.qlsme.com">幸福100云购在线</a></li>
      <li><a class="root" href="/baby">口才训练营报名</a></li> -->
<!-- 
      <li class="cur"><a href="/hfcz">话费充值（100）</a></li>
      <li><a target="_blank" href="http://www.kypwe.com">科赡票务</a></li>
      <li><a target="_blank" href="http://www.qlsme.com">幸福100云购在线</a></li> -->
    <%--   <li><a target="_blank" href="http://yb.zgyce.com/index.asp?vipid=<%=gcuserJflc2xx.getUsername() %>&vippa=<%=gcuserJflc2xx.getPassword()%>">一币换购商品</a></li>
	  <li><a target="_blank" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=gcuserJflc2xx.getUsername() %>">一币换购记录</a></li>
      <li><a href="/baby">口才训练营报名</a></li> --%>
