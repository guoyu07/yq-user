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
yljydb=rs("jydb")
rs("jydb")=rs("jydb")+request("bcjb")
rs.update
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from datepay "
rs1.open sql1,conn9,2,3
rs1.addnew
rs1("username")=userid
rs1("jyjz")=request("bcjb")
rs1("pay")=rs("pay")
rs1("jydb")=rs("jydb")
rs1("regid")="系统补"
rs1.update
%>
<div align="center">
	<table border="0" width="30%" id="table1">
		<tr>
			<td>
			<p align="center"><%=rs("username")%>修改成功</p>
			<p align="center">原来金币为：<font color="#800000"><%=yljydb%></font>&nbsp; 修改后为：<b><font color="#FF0000"><%=rs("jydb")%></font></b></p>
			</td>
		</tr>
	</table>
	<p align="center"><b><a href="bcjb.asp?bcid=<%=userid%>" style="text-decoration: none">返回</a></b></div>