<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('修改上涨比例成功！');</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('修改当前交易量成功！');</script></c:if>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新建网页 1</title>
</head>
<body>

		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>总交易量：<font color="#008000">${fcxt.jygsl}</font></b></p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>当前交易量：<font color="#008000">${fcxt.jy5w}</font></b></p>
		 <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>当前上涨比例：<font color="#008000">${fcxt.cz04}</font></b></p>


<form method="POST" action="updateCurrentCharge" name="form1">
	<div align="center">
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="200"><b><font size="2">修改当前交易量为：</font></b></td>
				<td><input type="text" name="cc" size="10" value="${fcxt.jy5w}"><input type="submit" value="修改" name="B1"></td>
			</tr>
			</table>
	</div>
</form>


<form method="POST" action="updateCz04" name="form2">
	<div align="center">
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="200"><b><font size="2">修改上涨比例为：</font></b></td>
				<td><input type="text" name="ration" size="10" value="${fcxt.cz04}"><input type="submit" value="修改" name="B2"></td>
			</tr>
			</table>
	</div>
</form>
</body>

</html>