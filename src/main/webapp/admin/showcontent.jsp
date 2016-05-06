<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<p align="center"><img border="0" src="/top_bg.png" width="1075" height="169"></p>
<p align="center">查看公告</p>
<p align="center"><b><font color="#FF0000">${dgag.ggbt}</font></b></p>
<blockquote>
	<blockquote>
		<p align="left"><b>${dgag.ggny}</b></p>
	</blockquote>
</blockquote>
<p align="left">　</p>
<table border="0" width="100%" id="table1" cellspacing="1">
	<tr>
		<td>　</td>
		<td width="468" align="center">
		<c:if test="${empty dgag.bz}">积分游戏大平台</c:if>
		<c:if test="${not empty dgag.bz}">${dgag.bz}</c:if></td>
		<td width="27">　</td>
	</tr>
	<tr>
		<td>　</td>
		<td width="468" align="center">${dgag.ggdate}</td>
		<td width="27">　</td>
	</tr>
</table>
