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
						<p class="r-link"><c:if test="${type==0}"><s:text name='Transfer_log'/></c:if><c:if test="${type!=0}"><a href="bdbdate?type=0"><s:text name='Transfer_log'/></a></c:if>|<c:if test="${type==1}"><s:text name='declaration_coin_log'/></c:if><c:if test="${type!=1}"><a href="bdbdate?type=1"><s:text name='declaration_coin_log'/></a></c:if></p>
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
								<td>${data.bz}
								<c:if test="${data.origintype==30023003 || data.origintype==3002 || data.origintype==3003}"><s:text name='Rechargeerrorreversa'/></c:if>
								<c:if test="${data.origintype==30043005 || data.origintype==3004 || data.origintype==3005}"><s:text name='deposit'/></c:if>
								<c:if test="${data.origintype==30003001 || data.origintype==3000 || data.origintype==3001}"><s:text name='wrongturn'/></c:if>
								<c:if test="${data.origintype==3008}"><s:text name='system'/></c:if>
								</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag para1="type" value1="${type}"/>
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
