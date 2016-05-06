<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>
<body>
<form method="POST" action="bcjb?bcid=${bcid}&status=1" name="form">
	<div align="center">
		<font color="#008000"><b>${bcid}</b></font><table border="0" width="30%" id="table1" cellspacing="3" height="68" cellpadding="2">
			<tr>
				<td align="right" width="133">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">金币：</td>
				<td><font color="#0000FF"><b>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">${gcuser.jydb}</b></font>+<input type="text" name="bcjb" size="10" value="0"></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交" name="B1"></p>
</form>

</body>

</html>