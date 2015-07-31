<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
userid=request("syid")
zfhs=request("zfh")
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,2,3
rs("cbuser")=request("cb")
rs.update
%>
<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from sgxt where username = '"&userid&"'"
rs1.open sql1,conn7,2,3
rs1("zfh")=zfhs
rs1.update
%>
<div align="center">
	<table border="0" width="100%" id="table1">
		<tr><td><p align="center"><font color="#FF0000"><%=userid%></font>修改成功</p></td>
		</tr>
	</table>
<p align="center"><b><a href="syuser.asp?syid=<%=userid%>" style="text-decoration: none">返回</a></b></div>