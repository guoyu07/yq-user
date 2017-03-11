<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${thisState==242}"><script language=javascript>alert('${thisState}');history.go(-1);</script></c:if>

<%-- <%@page import="com.yq.common.utils.MD5Security"%>
<%@page import="com.yq.user.bo.Gcuser"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@page import="com.yq.user.service.UserService"%>
<%@page import="com.yq.manage.service.ManageService"%>
<%@page import="com.yq.manage.bean.Resource"%>
<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" /> --%>
	<%-- <!-- <span style="display:none"><script src="https://s11.cnzz.com/z_stat.php?id=1259177711&web_id=1259177711" language="JavaScript"></script></span> -->
	<%
		ManageService manageService = ServiceCacheFactory.getService(ManageService.class);
	  List<Resource> rootResource = manageService.findResourceListByResourceId(242);
	  System.out.println("rootResource="+rootResource.size());
%> --%>

     <!--   <ul class="list">
         <li><a href='/manager'>首页</a></li>
         <li><a href='/vipgo'>财富中心</a></li>
         <li><a href='/tgurl'>账户管理</a></li>
         <li><a href='/hfcz'>消费管理</a></li>
         <li><a href='/vipup'>客服中心</a></li>
       </ul> -->
		
	<%-- 	<c:if test="${not empty rootResource}">
		<c:forEach items="${rootResource}" var="list" varStatus="i">
		 <li><a href='/manager'>首页</a></li>
		</c:forEach>
		</c:if>
 --%>

      <%--  <ul class="list">
       
      <%

      for (Resource re : rootResource) {
			%>
			<li class="active"><a href='<%=re.getResoUrl()%>?thisState=<%=re.getId()%>'><%=re.getResoName()%></a></li>
			
			<%
		}

%>
      
       
         
        </ul> --%>