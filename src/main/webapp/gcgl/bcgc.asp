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
userid=request("bcid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
<form method="POST" action="gcsave.asp?gcid=<%=userid%>" name="form">
	<div align="center">
		<font color="#008000"><b><%=userid%></b></font><table border="0" width="99%" id="table1" cellspacing="3" height="54" cellpadding="2">
			<tr>
				<td align="center" width="47%"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"><font color="#FF0000"><b>股权：</b></font></td>
				<td><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs("gdgc")%></b></font>+<input type="text" name="bcgc" size="8" value="0"></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交" name="B1"></p>
</form>

</body>

</html>