<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.1302371267'/></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
							    <th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.29623262'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.734362'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.865732987'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.669584602'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.950947478'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.670122793'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.851482466'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.749527093'/></th>
								<th><s:text name='viewzhgl-tmzhlist.jsp.zhgl-tmzhlist.jsp.20777047'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td><a href="/relogin?luserName=${data.username}">${data.username}</a><c:if test="${data.username==gcuser.username}"></font><b><font color="#FF00FF">(<s:text name='current'/>)</font></b></c:if></td>
								<td>${data.name}</td>
								<td>${data.sjb}</td>
								<td>${data.pay}</td>
								<td>${data.jyg}</td>
								<td>${data.jydb}</td>
								<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
								<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
								<td>${data.cxt}</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag />
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
