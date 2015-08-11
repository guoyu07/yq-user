<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<div align="center">
	　<p>　</p>
	<table border="0" width="52%" id="table1" height="120">
		<tr>
			<td><b>你好，你上次已查看过该消费编号<font color="#FF0000">${id}</font>的登录密码</b><p>
			<b>如果已经把密码给到客户手上，请不要随便重置密码。</b>
			 
			</p>
			<p align="center">　<p align="center">
			<a href="czpa?id=${id}" style="text-decoration: none">客户真的忘记了密码，我决定再次<font color="#FF0000">重置密码</font>！</a><p align="center">　<p align="center">
			<a href="gmjh?jh=${id}" style="text-decoration: none; font-weight: 700"><font size="4" color="#FF0000">不重置点击返回</font></a></td>
		</tr>
	</table>
	<p align="center">　</p>
	<table border="0" width="45%" id="table2" cellspacing="1">
		<tr>
			<td width="204" rowspan="2">
			<img border="0" src="images/tixing.jpg" align="right"></td>
			<td>　</td>
		</tr>
		<tr>
			<td><font color="#008000"><b>&nbsp;</b></font><b><font color="#008000">该编号并未激活</font></b></td>
			</tr>
		</table>
	</div>