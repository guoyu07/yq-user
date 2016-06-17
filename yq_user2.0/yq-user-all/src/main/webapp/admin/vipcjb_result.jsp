<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<div align="center">
	<table border="0" width="30%" id="table1">
		<tr>
			<td>
			<p align="center">${sfid}修改成功</p>
			<p align="center">原来为：<font color="#800000">${gcuser.vipcjcjb-cjb}</font>&nbsp; 修改后为：<b><font color="#FF0000">${gcuser.vipcjcjb}</font></b></p>
			</td>
		</tr>
	</table>
	<p align="center"><b><a href="vipcjb?sfid=${sfid}" style="text-decoration: none">返回</a></b></div>