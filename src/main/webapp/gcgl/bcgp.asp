<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�½���ҳ 1</title>
</head>
<body>
<%
userid=request("bcid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
<form method="POST" action="bcusersave.asp?bcid=<%=userid%>" name="form">
	<div align="center">
		<font color="#008000"><b><%=userid%></b></font><table border="0" width="30%" id="table1" cellspacing="3" height="86" cellpadding="2">
			<tr>
				<td align="right" width="133">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">���֣�</td>
				<td><font color="#0000FF"><b>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs("jyg")%></b></font>+<input type="text" name="bcgp" size="10" value="0"></td>
			</tr>
			<tr>
				<td align="right" width="133">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">��Ȩ��</td>
				<td><font color="#FF0000"><b>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs("gdgc")%></b></font>+<input type="text" name="bcgc" size="10" value="0"></td>
			</tr>
		</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="�ύ" name="B1"></p>
</form>

</body>

</html>