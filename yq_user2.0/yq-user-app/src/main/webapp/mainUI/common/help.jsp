<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <ul class="nav-secondary">
      <!-- <li><a href="/tjz">同名账户管理</a></li>
      <li><a href="/regTheSame">添加同名账户</a></li>
      <li><a href="/tgdown">我的客户</a></li>
      <li><a href="/tgurl">个人信息</a></li> -->
     <!--  <li class="cur"><a class="root" href="/tjz">同名账户管理</a></li>
      <li><a class="root" href="/regTheSame">添加同名账户</a></li>
      <li><a class="root" href="/tgdown">我的客户</a></li>
      <li><a class="root" href="/tgurl">个人信息</a></li>
       -->
      <%	
	     	if(secondResource.size()==1){
	     		%>
	     		 	<%
				      	for (Resource re : secondResource) {
							%>
							<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'><%=re.getResoName()%></a>
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
					<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'><%=re.getResoName()%></a>
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
				        <a href="/mysl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分买入</a>
				        <a href="/mcsl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分卖出</a>
				        <a href="/gpjy?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分交易明细</a>
				        <a href="/gpjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分交易市场</a>
				      	</div>
				       <%}else if("249".equals(re.getId()+"")){%>
			       		<div class="list">
				          <a href="/datepay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币明细</a>
				          <a href="/userpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币卖出</a>
				          <a href="/epmcjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币卖出明细</a>
				          <a href="/jztojb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币购金币卡</a>
				          <a href="/ybPresent?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币捐助区</a>
				        </div>
				       <%}else if("251".equals(re.getId()+"")){%>
			       		<div class="list">
					       <a href="/vipgo?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">我要充值</a>
					       <a href="/gmjh?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">激活金币卡</a>
					       <a href="/goldDetail?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">金币明细</a>
				        </div>
				       <%}else if("252".equals(re.getId()+"")){%>
			       		<div class="list">
					       <a href="/bybdblog?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">报单币明细</a>
					       <a href="/userscoreslog?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">购物券</a>
				        </div>
				        
				       <%}else if("253".equals(re.getId()+"")){%>
			       		<div class="list">
					      <a href="/vipjzpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币转出</a>
				          <a href="/epjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币交易市场</a>
				          <a href="/epmyjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币认购明细</a>
				          <a href="/bdbzz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">报单币转出</a>
				          <a href="/bdbcz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">报单币充值</a>
				          <a href="/vipcjb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">vip充值币管理</a>
				          <a href="/bdbdate?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">备用报单币明细</a>
				        </div>
				         <%}else if("254".equals(re.getId()+"")){%>
				         <div class="list">
				          <a href="/glpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">商城退款</a>
				          <a href="/glpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">商城购物券退款</a>
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
  
  