<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<div align="center">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<p align="center"><font color="#FF0000">${gcuser.username}</font>修改成功</p>
			<p align="center">原备用报单币总额为：<font color="#800000">${gcuser.syep-jzbdb}</font>&nbsp; </p>
			<p align="center">补贴后为：<b><font color="#FF0000">${gcuser.syep}</font></b></p>
			</td>
		</tr>
	</table>
<p align="center"><b><a href="jzbdb?jzid=${jzid}" style="text-decoration: none">返回</a></b></div>