<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>
<body>
<%
userid=request("jfid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
<form method="POST" action="tojfsave.asp?jfid=<%=userid%>" name="form">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>EP换积分：<font color="#008000"><%=userid%></font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="109" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#0000FF"><b>当前EP：</b></font></td>
				<td height="27"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs("pay")%></b></font></td>
			</tr>
			<tr>
				<td align="right" width="109"><b><font size="2">换积分数量：</font></b></td>
				<td><input type="text" name="jfpay" size="10"></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="转换积分" name="B1"><font size="2">原积分：<font color="#FF0000"><%=rs("jyg")%></font></font></p>
</form>

</body>

</html>