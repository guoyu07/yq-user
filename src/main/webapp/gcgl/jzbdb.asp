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
userid=request("jzid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
<form method="POST" action="jzbdbok.asp?jzid=<%=userid%>" name="form">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>Ҫ���ӵ��û�����<font color="#008000"><%=userid%></font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="43%" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2"><b>��ǰ���ñ����ң�</b></font></td>
				<td height="27" colspan="2"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs("syep")%></b></font></td>
			</tr>
			<tr>
				<td align="right" width="43%"><b><font size="2">���Ӷ</font></b></td>
				<td width="7%"><input type="text" name="jzbdb" size="10"></td>
				<td width="48%"><font size="2">ֻ��5ǧ��1�������</font></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="�ύ����" name="B1"></p>
</form>

</body>

</html>