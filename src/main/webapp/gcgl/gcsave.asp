<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
userid=request("gcid")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,2,3
ylgdgc=rs("gdgc")
rs("gdgc")=rs("gdgc")+request("bcgc")
rs.update
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gcfh"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("userid")=userid
rs_d1("sygc")=request("bcgc")
rs_d1("ljgc")=rs("gdgc")
rs_d1("bz")="系统"
rs_d1.update
%>
<div align="center">
	<table border="0" width="30%" id="table1">
		<tr>
			<td>
			<p align="center"><%=rs("username")%>修改成功</p>
			<p align="center">原来股权为：<font color="#800000"><%=ylgdgc%></font>&nbsp; 修改后为：<b><font color="#FF0000"><%=rs("gdgc")%></font></b></p>
			</td>
		</tr>
	</table>
	<p align="center"><b><a href="bcgc.asp?bcid=<%=userid%>" style="text-decoration: none">返回</a></b></div>