<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.777812136'/></span>
					</div>
					<div class="a-kh">
						<s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-1775315253'/> QQ:${up.qq} <a target="_blank" href="https://wpa.qq.com/msgrd?v=3&uin=${up.qq}&site=qq&menu=yes"> <s:text name='viewservice.jsp.service.jsp.488997268'/></a>　<s:text name="phone"></s:text>：${up.call}  ${upName}<s:text name="mr_ms"></s:text>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.29623262'/></th>
								<th>QQ/Email</th>
								<th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.851482466'/></th>
								<th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.989728617'/></th>
								<th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-738867994'/></th>
								<th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.660492955'/></th>
								<th><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.667120382'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${data.username}</td>
								<td>
								<c:choose>
									<c:when test="${fn:contains(data.qq,'@')!=true}">
											<a target="_blank" href="https://wpa.qq.com/msgrd?v=3&uin=${data.qq}&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:${data.qq}:41" alt="<s:text name='viewservice.jsp.service.jsp.488997268'/>" title="<s:text name='viewservice.jsp.service.jsp.488997268'/>"></font></a><font size="2" color="#000000">${data.qq}</font>
									</c:when>
									<c:otherwise>
											<a target="_blank" href="mailto:${data.qq}"><font size="2"><img border="0" src="image/eamil.png" alt="<s:text name='sendemail'/>" title="<s:text name='sendemail'/>"></font></a><font size="2" color="#000000">${data.qq}</font>
									</c:otherwise>
								</c:choose>
								</td>
								<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
								<td>${data.cjtj}</td>
								<td><fmt:formatDate value="${data.gmdate}" type="both"/></td>
								<td><c:if test="${data.sjb==0}"><s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-522793551'/></c:if><c:if test="${data.sjb!=0}">${data.sjb}<s:text name='viewzhgl-kehu.jsp.zhgl-kehu.jsp.-522793551a'/></c:if></td>
								<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
							</tr>
						   </s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="scripts/jquery.js"></script>
	<script src="scripts/common.js"></script>
</body>
</html>
