<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
userid=request("jzid")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,2,3
ylpay=rs("syep")
rs("syep")=rs("syep")+request("jzbdb")
rs("ljep")=rs("ljep")+request("jzbdb")
rs.update
%>
<%
set rs_bdb = Server.CreateObject("ADODB.Recordset")
sql_bdb = "SELECT * FROM bdbdate"
rs_bdb.open sql_bdb,conn1,2,3
rs_bdb.addnew
rs_bdb("zuser")=userid
rs_bdb("sy")=request("jzbdb")
rs_bdb("sybdb")=rs("sybdb")
rs_bdb("ljbdb")=rs("ljbdb")
rs_bdb("bz")="���ñ����Ҳ�����δ��ֵ�ݲ���Ч"
rs_bdb.update
%>
<div align="center">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<p align="center"><font color="#FF0000"><%=rs("username")%></font>�޸ĳɹ�</p>
			<p align="center">ԭ���ñ������ܶ�Ϊ��<font color="#800000"><%=ylpay%></font>&nbsp; </p>
			<p align="center">������Ϊ��<b><font color="#FF0000"><%=rs("syep")%></font></b></p>
			</td>
		</tr>
	</table>
<p align="center"><b><a href="jzbdb.asp?jzid=<%=userid%>" style="text-decoration: none">����</a></b></div>