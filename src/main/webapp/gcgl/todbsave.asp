<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
userid=request("dbid")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,2,3
ylpay=rs("pay")
yljydb=rs("jydb")
rs("pay")=rs("pay")-request("dbpay")
rs("jydb")=rs("jydb")+request("dbpay")
rs.update
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=userid
rs_d1("regid")="EP�����"
rs_d1("jc")=request("dbpay")
rs_d1("jyjz")=request("dbpay")
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
%>
<div align="center">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<p align="center"><font color="#FF0000"><%=rs("username")%></font>�޸ĳɹ�</p>
			<p align="center">ԭEP�ܶ�Ϊ��<font color="#800000"><%=ylpay%></font>&nbsp; ����Һ�Ϊ��<%=rs("pay")%></p>
			<p align="center">ԭ���Ϊ��<b><%=yljydb%></b> ����Ϊ��<font color="#800000"><b><%=rs("jydb")%></b></font></p>
			</td>
		</tr>
	</table>
	<p align="center"><b><a href="eptodb.asp?dbid=<%=userid%>" style="text-decoration: none">����</a></b></div>