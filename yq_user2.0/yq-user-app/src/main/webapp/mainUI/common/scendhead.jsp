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
       	<li><a href="/vipgo">积分理财</span></li>
        <li><a href="/login2j?inputUrl=login2j.jsp">一币理财</span></li>
        <li><a href="/sgks01">业绩查询</span></li>
        <li><a href="/datepay">账户概览</span></li>
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
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root" ><%=re.getResoName()%></span>
				       <div class="list JQ_navThirdList">
				        <a href="/mysl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分买入</a>
				        <a href="/mcsl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分卖出</a>
				        <a href="/gpjy?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分交易明细</a>
				        <a href="/gpjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">积分交易市场</a>
				      	</div>
				      	</li>
				       <%}else if("249".equals(re.getId()+"")){%>
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root" ><%=re.getResoName()%></span>
			       		 <div class="list JQ_navThirdList">
			       		  <a href="/vipgo?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">我要充值</a>
				          <a href="/datepay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币明细</a>
				          <a href="/userpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币卖出</a>
				          <a href="/epmcjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币卖出明细</a>
				          <a href="/jztojb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币购金币卡</a>
				          <a href="/ybPresent?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币捐助区</a>
				        </div>
				        </li>
				       <%}else if("251".equals(re.getId()+"")){%>
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root"><%=re.getResoName()%></a>
			       		 <div class="list JQ_navThirdList">
					       <a href="/gmjh?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">激活金币卡</a>
					       <a href="/goldDetail?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">金币明细</a>
				        </div>
				        </li>
				       <%}else if("252".equals(re.getId()+"")){%>
				       <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root"><%=re.getResoName()%></a>
			       		 <div class="list JQ_navThirdList">
					       <a href="/bdbdate?secondThisState=<%=re.getId()%>&thisState=${thisState}&type=1" class="item">报单明细</a>
					       <a href="/bdbdate?secondThisState=<%=re.getId()%>&thisState=${thisState}&type=0" class="item">转账明细</a>
				        </div>
				        </li>
				       <%}else if("253".equals(re.getId()+"") && gcuserHead.getVip()!=0 ){%>
			       		<li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root"><%=re.getResoName()%></a>
			       		 <div class="list JQ_navThirdList">
					      <a href="/vipjzpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币转出</a>
				          <a href="/epjysc?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币交易市场</a>
				          <a href="/epmyjl?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">一币认购明细</a>
				          <a href="/bdbzz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">报单币转出</a>
				          <a href="/bdbcz?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">报单币充值</a>
				          <% if(gcuserHead.getVip()==2){%>
				          <a href="/vipcjb?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">vip充值币管理</a>
				          <%} %>
				           <a href="/bybdblog?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">备用报单币明细</a>
				        </div>
				        </li>
				         <%}else if("254".equals(re.getId()+"") && (gcuserHead.getUsername().equals("300fhk") || gcuserHead.getUsername().equals("zxz888"))){%>
				         <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><span class="root"><%=re.getResoName()%></a>
				          <div class="list JQ_navThirdList">
				          <a href="/glpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">商城退款</a>
				          <a href="/glpay?secondThisState=<%=re.getId()%>&thisState=${thisState}" class="item">商城购物券退款</a>
				       	 </div>
				       	 </li>
				        <%}else if("250".equals(re.getId()+"")){%>
				      	 <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'><%=re.getResoName()%></a></li>
				       <%}else if("273".equals(re.getId()+"") && (gcuserHead.getJb()==5 || gcuserHead.getJb()==3)){%>
				      	 <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'><%=re.getResoName()%></a></li>
				       <%}else if("291".equals(re.getId()+"")){%>
				      	 <li <% if(secondThisStatetemp.equals(re.getId()+"")){%> class="cur" <%} %>><a class="root" href='<%=re.getResoUrl()%>?secondThisState=<%=re.getId()%>&thisState=${thisState}'><%=re.getResoName()%></a></li>
				       <%} %>
				      
				     
					<%
				}
			%>
      			
      
		<%-- <%} %> --%>
     <!-- 
      <li>
        <span href="/sgks01">业绩查询</a>
      </li>
      <li >
        <span href="/mysl">积分理财</a>
         <div class="list JQ_navThirdList">
          <a href="/mysl" class="item">积分买入</a>
          <a href="/mcsl" class="item">积分卖出</a>
          <a href="/gpjy" class="item">积分交易明细</a>
          <a href="/gpjysc" class="item">积分交易市场</a>
        </div>
      </li>
      <li>
        <span href="/datepay">一币理财</a>
         <div class="list JQ_navThirdList">
          <a href="/datepay" class="item">一币明细</a>
          <a href="/userpay" class="item">一币卖出</a>
          <a href="/epmcjl" class="item">一币卖出明细</a>
          <a href="/jztojb" class="item">一币购金币卡</a>
          <a href="/ybPresent" class="item">一币捐助区</a>TOTO
        </div>
      </li>
      <li>
        <span href="/vipgo">金币管理</a>
         <div class="list JQ_navThirdList">
          <a href="/vipgo" class="item">我要充值</a>
          <a href="/gmjh" class="item">激活金币卡</a>
          <a href="/goldDetail" class="item">金币明细</a>TOTO
        </div>
      </li>
      <li>
        <span href="/bybdblog">报单币明细</a>
         <div class="list JQ_navThirdList">
          <a href="/bybdblog" class="item">报单币明细</a>
          <a href="/userscoreslog" class="item">购物券</a>TOTO --><!-- TOTO
        </div>
      </li>
      <li>
        <span href="/vipjzpay">VIP中心</a>
         <div class="list JQ_navThirdList">
          <a href="/vipjzpay" class="item">一币转出</a>
          <a href="/epjysc" class="item">一币交易市场</a>
          <a href="/epmyjl" class="item">一币认购明细</a>
          <a href="/bdbzz" class="item">报单币转出</a>
          <a href="/bdbcz" class="item">报单币充值</a>
          <a href="/vipcjb" class="item">vip充值币管理</a>
          <a href="/bdbdate" class="item">备用报单币明细</a>
        </div>
      </li>
      <li>
        <span href="/glpay">商城管理</a>
         <div class="list JQ_navThirdList">
          <a href="/glpay" class="item">商城退款</a>
          <a href="/glpay" class="item">商城购物券退款</a>TOTO --><!-- TOTO
        </div>
      </li>
      <li>
        <span href="/ybsf">商户管理</a>
      </li> -->
    </ul> 