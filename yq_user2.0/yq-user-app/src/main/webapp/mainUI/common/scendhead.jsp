<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@page import="com.yq.user.service.*"%>
<%@page import="com.yq.manage.bean.*"%> --%>
	<!-- <span style="display:none"><script src="https://s11.cnzz.com/z_stat.php?id=1259177711&web_id=1259177711" language="JavaScript"></script></span> -->
<%-- <%
  ManageService manageService = ServiceCacheFactory.getService(ManageService.class);
  List<Resource> secondResource = manageService.findResourceListByResourceId(244);
  System.out.println("secondResource="+secondResource.size());
%> --%>
<!-- <ul class="nav-secondary">
       	<li><a href="/vipgo"><s:text name='viewjflc.jsp.jflc.jsp.951062035'/></span></li>
        <li><a href="/login2j?inputUrl=login2j.jsp"><s:text name='viewyblc.jsp.yblc.jsp.618950045'/></span></li>
        <li><a href="/sgks01"><s:text name='viewlinks.html.links.html.627723500'/></span></li>
        <li><a href="/datepay"><s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/></span></li>
    </ul> -->
    <%--  <ul class="nav-secondary JQ_navSecondary">
     <%for (Resource re : secondResource) {
				%>
				 <li>
        			<span href="<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>"><%=re.getResoUrl()%></a>
      			</li>
				<li <% if(thisState.equals(re.getId()+"")){%> class="active" <%} %>><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>'><%=re.getResoName()%></span></li>
				<%
		}%>
    </ul> --%>
     <ul class="nav-secondary JQ_navSecondary">
      <%-- 	<%	
	     	if(secondResource.size()==1){
	     		%>
	     		 	<%
				      	for (Resource re : secondResource) {
							%>
							<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span><%=re.getResoName()%></span></li>
							<%
						}
					%>
	     		<%
	     	}else{
     	%>
      	 --%>
      		<%
		      	for (Resource re : secondResource) {
					%>
				       <% if("248".equals(re.getId()+"")){%> 
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root" >
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
				       </span>
				       <div class="list JQ_navThirdList">
				        <a href="/mysl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Integral_buy'/></a>
				        <a href="/mcsl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='integral_sell'/></a>
				        <a href="/gpjy?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/></a>
				        <a href="/gpjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></a>
				      	</div>
				      	</li>
				       <%}else if("249".equals(re.getId()+"")){%>
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root" >
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
				       </span>
			       		 <div class="list JQ_navThirdList">
			       		  <a href="/vipgo?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.782396711'/></a>
				          <a href="/datepay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1470113791'/></a>
				          <a href="/userpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.618675493'/></a>
				          <a href="/epmcjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1842504285'/></a>
				          <a href="/jztojb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></a>
				          <a href="/ybPresent?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2003028320'/></a>
				        </div>
				        </li>
				       <%}else if("251".equals(re.getId()+"")){%>
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root">
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
			       		 <div class="list JQ_navThirdList">
					       <a href="/gmjh?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></a>
					       <a href="/goldDetail?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Gold_details'/></a>
				        </div>
				        </li>
				       <%}else if("252".equals(re.getId()+"")){%>
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root">
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
			       		 <div class="list JQ_navThirdList">
					       <a href="/bdbdate?secondThisState=<%=re.getId()%>&thisState=${thisState}&type=1" class="item"><s:text name='viewlinks.html.links.html.773655496'/></a>
					       <a href="/bdbzhuanzhang?secondThisState=<%=re.getId()%>&thisState=${thisState}&type=0" class="item"><s:text name='Transfer_details'/></a>
				        </div>
				        </li>
				      <%--  <%}else if("253".equals(re.getId()+"") && gcuserHead.getVip()!=0 ){%>
			       		<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root">
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
			       		 <div class="list JQ_navThirdList">
					      <a href="/vipjzpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Currency_transfer'/></a>
				          <a href="/epjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1811565864'/></a>
				          <a href="/epmyjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></a>
				          <a href="/bdbzz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='From_the_currency_declaration'/></a>
				           <% if(gcuserHead.getVip()==2){%>
				          <a href="/bdbcz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Account_currency_recharge'/></a>
				          <a href="/vipcjb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1624937649'/></a>
				          <%} %>
				           <a href="/bybdblog?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='Reserve_currency_report_details'/></a>
				        </div> --%>
				        </li>
				         <%-- <%}else if("254".equals(re.getId()+"") && (gcuserHead.getUsername().equals("300fhk") || gcuserHead.getUsername().equals("zxz888"))){%>
				         <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root"><%=re.getResoName()%></a>
				          <div class="list JQ_navThirdList">
				          <%if(gcuserHead.getUsername().equals("300fhk")|| gcuserHead.getUsername().equals("zxz888")) {%>
				          <a href="/glpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/></a>
				          <%} %>
				           <%if(gcuserHead.getUsername().equals("zxz888")) {%>
				          <a href="/backscores?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item"><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/></a>
				       	 	<%} %>
				       	 </div>
				       	 </li> --%>
				        <%}else if("250".equals(re.getId()+"")){%>
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
		   				</a></li>
				       <%}else if("273".equals(re.getId()+"") && (gcuserHead.getJb()==5 || gcuserHead.getJb()==3)){%>
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
				      	 </a></li>
				       <%}else if("291".equals(re.getId()+"")){%>
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
				      	 </a></li>
				       <%} %>
				      
				     
					<%
				}
			%>
      			
      
		<%-- <%} %> --%>
     <!-- 
      <li>
        <span href="/sgks01"><s:text name='viewlinks.html.links.html.627723500'/></a>
      </li>
      <li >
        <span href="/mysl"><s:text name='viewjflc.jsp.jflc.jsp.951062035'/></a>
         <div class="list JQ_navThirdList">
          <a href="/mysl" class="item">积分买入</a>
          <a href="/mcsl" class="item"><s:text name='integral_sell'/></a>
          <a href="/gpjy" class="item"><s:text name='viewjflc-details.jsp.jflc-details.jsp.-1151284962'/></a>
          <a href="/gpjysc" class="item"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></a>
        </div>
      </li>
      <li>
        <span href="/datepay"><s:text name='viewyblc.jsp.yblc.jsp.618950045'/></a>
         <div class="list JQ_navThirdList">
          <a href="/datepay" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1470113791'/></a>
          <a href="/userpay" class="item"><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.618675493'/></a>
          <a href="/epmcjl" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1842504285'/></a>
          <a href="/jztojb" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-1995717051'/></a>
          <a href="/ybPresent" class="item"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2003028320'/></a>TOTO
        </div>
      </li>
      <li>
        <span href="/vipgo"><s:text name='Gold_coin_management'/></a>
         <div class="list JQ_navThirdList">
          <a href="/vipgo" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.782396711'/></a>
          <a href="/gmjh" class="item"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></a>
          <a href="/goldDetail" class="item">金币明细</a>TOTO
        </div>
      </li>
      <li>
        <span href="/bybdblog"><s:text name='viewlinks.html.links.html.-1741306770a'/></a>
         <div class="list JQ_navThirdList">
          <a href="/bybdblog" class="item"><s:text name='viewlinks.html.links.html.-1741306770a'/></a>
          <a href="/userscoreslog" class="item"><s:text name='viewuser.jsp.user.jsp.35660508'/></a>TOTO --><!-- TOTO
        </div>
      </li>
      <li>
        <span href="/vipjzpay">VIP中心</a>
         <div class="list JQ_navThirdList">
          <a href="/vipjzpay" class="item">一币转出</a>
          <a href="/epjysc" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.1811565864'/></a>
          <a href="/epmyjl" class="item"><s:text name='vipadmin_menu.jsp.admin_menu.jsp.-2008491582'/></a>
          <a href="/bdbzz" class="item">报单币转出</a>
          <a href="/bdbcz" class="item"><s:text name='Account_currency_recharge'/></a>
          <a href="/vipcjb" class="item">vip<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1624937649'/></a>
          <a href="/bdbdate" class="item">备用报单币明细</a>
        </div>
      </li>
      <li>
        <span href="/glpay"><s:text name='Mall_management'/></a>
         <div class="list JQ_navThirdList">
          <a href="/glpay" class="item"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/></a>
          <a href="/glpay" class="item"><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/></a>TOTO --><!-- TOTO
        </div>
      </li>
      <li>
        <span href="/ybsf"><s:text name='Merchant_management'/></a>
      </li> -->
    </ul> 
