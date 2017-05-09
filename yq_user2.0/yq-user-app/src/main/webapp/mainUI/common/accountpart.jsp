<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <ul class="nav-secondary">
      <!-- <li><a href="/tjz"><s:text name='The_same_account_management'/></a></li>
      <li><a href="/regTheSame"><s:text name='viewhead.jsp.head.jsp.742540524b'/></a></li>
      <li><a href="/tgdown"><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/></a></li>
      <li><a href="/tgurl"><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></a></li> -->
     <!--  <li class="cur"><a class="root" href="/tjz"><s:text name='The_same_account_management'/></a></li>
      <li><a class="root" href="/regTheSame"><s:text name='viewhead.jsp.head.jsp.742540524b'/></a></li>
      <li><a class="root" href="/tgdown"><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/></a></li>
      <li><a class="root" href="/tgurl"><s:text name='viewgrxx.jsp.grxx.jsp.616144510'/></a></li>
       -->
      <%	
	     	if(secondResource.size()==1){
	     		%>
	     		 	<%
				      	for (Resource re : secondResource) {
							%>
							<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'>
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
							</a>
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
					<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'>
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
					
					</a>
					   <%-- <div class="list">
					   <%
				      	for (Resource re3 : thirdResource) {
							%>
							<a href='<%=re3.getResoUrl()%>?secondThisState=<%=re3.getId()%>&thisState=${thisState}'><%=re3.getResoName()%></a>
							<%
						}
						%>
				       </div> --%>
				      <%--  <% if("248".equals(re.getId()+"")){%> 
				       <div class="list">
				        <a href="/mysl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Integral_buy'/></a>
				        <a href="/mcsl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='integral_sell'/></a>
				        <a href="/gpjy?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/></a>
				        <a href="/gpjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></a>
				      	</div>
				       <%}else if("249".equals(re.getId()+"")){%>
			       		<div class="list">
				          <a href="/datepay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1470113791'/></a>
				          <a href="/userpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.618675493'/></a>
				          <a href="/epmcjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1842504285'/></a>
				          <a href="/jztojb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></a>
				          <a href="/ybPresent?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2003028320'/></a>
				        </div>
				       <%}else if("251".equals(re.getId()+"")){%>
			       		<div class="list">
					       <a href="/vipgo?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.782396711'/></a>
					       <a href="/gmjh?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></a>
					       <a href="/goldDetail?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Gold_details'/></a>
				        </div>
				       <%}else if("252".equals(re.getId()+"")){%>
			       		<div class="list">
					       <a href="/bybdblog?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewlinks.html.links.html.-1741306770a'/></a>
					       <a href="/userscoreslog?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewuser.jsp.user.jsp.35660508'/></a>
				        </div>
				        
				       <%}else if("253".equals(re.getId()+"")){%>
			       		<div class="list">
					      <a href="/vipjzpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Currency_transfer'/></a>
				          <a href="/epjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1811565864'/></a>
				          <a href="/epmyjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></a>
				          <a href="/bdbzz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='From_the_currency_declaration'/></a>
				          <a href="/bdbcz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Account_currency_recharge'/></a>
				          <a href="/vipcjb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">vip<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1624937649'/></a>
				          <a href="/bdbdate?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Reserve_currency_report_details'/></a>
				        </div>
				         <%}else if("254".equals(re.getId()+"")){%>
				         <div class="list">
				          <a href="/glpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/></a>
				          <a href="/glpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/></a>
				       	 </div>
				        <%}else{%>
				       
				       <%} %>
				       --%>
				      
				     </li>
					<%
				}
			%>
      			
      
		<%} %>
      
      
  </ul>
  
  
