<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
userid=request("bcid")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,2,3
yljyg=rs("jyg")
rs("jyg")=rs("jyg")+request("bcjf")
rs.update
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gpjy "
rs1.open sql1,conn2,2,3
rs1.addnew
rs1("username")=userid
rs1("mysl")=request("bcjf")
rs1("sysl")=rs("jyg")
rs1("bz")="�ɹ�"
rs1("cgdate")=Now()
rs1("jy")=1
rs1("dfuser")="ϵͳ"
rs1.update
%>
<div align="center">
	<table border="0" width="30%" id="table1">
		<tr>
			<td>
			<p align="center"><%=rs("username")%>�޸ĳɹ�</p>
			<p align="center">ԭ������Ϊ��<font color="#800000"><%=yljyg%></font>&nbsp; �޸ĺ�Ϊ��<b><font color="#FF0000"><%=rs("jyg")%></font></b></p>
			</td>
		</tr>
	</table>
	<p align="center"><b><a href="bcjf.asp?bcid=<%=userid%>" style="text-decoration: none">����</a></b></div>