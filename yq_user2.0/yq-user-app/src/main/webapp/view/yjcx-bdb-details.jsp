<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yjcx.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1143349315'/></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646048'/></th>
								<th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1788646116'/></th>
								<th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.-1361215839'/></th>
								<th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.23899948'/></th>
								<th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21452281'/></th>
								<th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.24127308'/></th>
								<th><s:text name='viewyjcx-bdb-details.jsp.yjcx-bdb-details.jsp.21679641'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.sy}</td>
								<td><c:if test="${data.jc<0}">-${data.jc}</c:if><c:if test="${data.jc>0}">${data.jc}</c:if></td>
								<td>${data.sybdb}</td>
								<td>${data.zaq}</td>
								<td>${data.zbq}</td>
								<td>${data.aq}</td>
								<td>${data.bq}</td>
								<td><fmt:formatDate value="${data.bfdate}" type="both"/></td>
								<td>${data.bz}</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/>
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
