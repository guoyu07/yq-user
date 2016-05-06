<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>
<body>
<form method="POST" action="btpay?uid=${uid}&status=1" name="form">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>要补贴的用户名：<font color="#008000">${uid}</font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="89" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>当前EP：</b></font></td>
				<td height="27"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">${gcuser.pay}</b></font></td>
			</tr>
			<tr>
				<td align="right" width="89"><b><font size="2">补贴额：</font></b></td>
				<td><input type="hidden" name="btpay" size="10" ><b><font color="#FF00FF" size="2">收入</font></b></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交补贴" name="B1"></p>
</form>

</body>

</html>