<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>
<body>

<form method="POST" action="jzbdb?jzid=${jzid}&status=1" name="form">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>要增加的用户名：<font color="#008000">${jzid}</font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="43%" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2"><b>当前备用报单币：</b></font></td>
				<td height="27" colspan="2"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">${gcuser.syep}</b></font></td>
			</tr>
			<tr>
				<td align="right" width="43%"><b><font size="2">增加额：</font></b></td>
				<td width="7%"><input type="text" name="jzbdb" size="10"></td>
				<td width="48%"><font size="2">只能5千，1万的整数</font></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交增加" name="B1"></p>
</form>

</body>

</html>