<!--#include file="../shopmfh.asp"-->
<%  
jbk001=request("jbkuser")
sql="select * from ejbk where pdid = '"&jbk001&"' "
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn0,1,1
%>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
	<p align="center">��</p>
	<form method="POST" action="jbkglupok.asp?jbkid=<%=jbk001%>" name="form">
		<div align="center">
			<table border="1" width="53%" id="table1" style="border-collapse: collapse" height="128">
				<tr>
					<td width="29%" align="right">���ѱ�ţ�</td>
					<td width="39%"><font color="#FF0000"><%=jbk001%></font></td>
					<td width="31%">
					&nbsp;&nbsp; ����<font color="#FF00FF"><%=rs("up")%></font></td>
				</tr>
				<tr>
					<td width="29%" align="right">������</td>
					<td colspan="2">
					<input name="up" size="20" value="<%=rs("up")%>">
					<font color="#FF0000">** ��������</font></td>
				</tr>
				<tr>
					<td width="29%" align="right">������</td>
					<td colspan="2">
					<input name="bf2" size="20" value="<%=rs("bf2")%>">
					<font color="#FF0000">** ��������</font></td>
				</tr>
				</table>
		</div>
		<p align="center">
		<input type="submit" value="�ύ" name="B1" style="font-size: 12pt"></p>
		<p align="center">��</p>
	</form>
	<p align="center"><b><a href="/gcgl/jbkgl002.asp" style="text-decoration: none"><font color="#FF0000" size="6">�� �� �� ��</font></a></b></p>
	<p align="center">��</p>
</body> 
</html>
