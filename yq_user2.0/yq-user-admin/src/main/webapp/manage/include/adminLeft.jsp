<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.yq.manage.bean.Resource"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<script language="javascript"  src="${ctx}/scripts/resize.js"></script>
<div class="table_left" id="table_left">
     <div class="moudle_div">
       <div class="sidebar_title">
         <div class="sidebar_title_border menu_title1">系统管理</div>
       </div>
       <div class="div_content">
         <div class="wodeyingyong">
           <div id="invite_div">
           	 <%
			 	List<Resource> list=(List<Resource>)request.getSession().getAttribute("LOGIN_RESOURCE");
			 	for(Resource res:list){
			  	if(("YHGL").equals(res.getResoCode())||("JSGL").equals(res.getResoCode())||("BMGL").equals(res.getResoCode())||("ZYGL").equals(res.getResoCode())||("CZRZ").equals(res.getResoCode())||("DYXGL").equals(res.getResoCode())||("YXZGL").equals(res.getResoCode())||("JBGL").equals(res.getResoCode())||("QDGL").equals(res.getResoCode())||("QDTJ").equals(res.getResoCode())||("DMTJ").equals(res.getResoCode())||("IPGL").equals(res.getResoCode()) ){
				  %>
						<div><a id="q_qun" class="<%=res.getResoClass()%>" href="<%=res.getResoUrl()%>"><%=res.getResoName()%></a></div>
				  <%	
	               }
			  	}%>
			 <%-- 
			 	<div><a id="q_qun" class="btn_sys_1" href="${ctx}/user/pageList.action">用户管理</a></div>
             	<div><a id="q_qun" class="btn_sys_3" href="${ctx}/role/pageList.action">角色管理 </a></div>
             	<div><a id="q_qun" class="btn_sys_4" href="${ctx}/department/listPage.action">部门管理 </a></div>
             	<div><a id="q_qun" class="btn_sys_5" href="/resource/listPage">资源管理</a></div>
			  --%>
          </div>
          <div style="clear:both;"></div>
        </div>
      </div>
</div>
</div>

