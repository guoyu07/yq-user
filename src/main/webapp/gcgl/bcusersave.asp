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
sql="select * from gpjy where username = '"&userid&"' and dfuser='ϵͳ����'"
rs.open sql,conn2,2,3
ylsl=rs("mysl")
rs("mysl")=rs("mysl")+request("bcgp")
rs("sysl")=rs("sysl")+request("bcgp")
rs("jypay")=rs("jypay")+request("bcgp")
rs.update
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcfh where userid = '"&userid&"' and bz='ϵͳ����'"
rs1.open sql1,conn2,2,3
ylgc=rs1("sygc")
rs1("sygc")=rs1("sygc")+request("bcgc")
rs1("ljgc")=rs1("ljgc")+request("bcgc")
rs1.update
%>
<%
'set rs2=server.CreateObject("adodb.recordset")
'sql2="select * from datepay where userid = '"&userid&"' and regid='ϵͳ��'"
'rs2.open sql2,conn9,2,3
'ylgc=rs1("sygc")
'rs1("jyjz")=rs1("jyjz")+request("bcjb")
'rs1("jydb")=rs1("jydb")+request("bcjb")
'rs1.update
'rs1.update
%>
<div align="center">
	<table border="0" width="30%" id="table1">
		<tr>
			<td>
			<p align="center"><%=rs("username")%>�޸ĳɹ�</p>
			<p align="center">ԭ������Ϊ��<font color="#800000"><%=ylsl%></font>&nbsp; �޸ĺ�Ϊ��<b><font color="#FF0000"><%=rs("mysl")%></font></b></p>
			<p align="center">ԭ����ȨΪ��<font color="#800000"><%=ylgc%></font>&nbsp; �޸ĺ�Ϊ��<b><font color="#FF0000"><%=rs1("sygc")%></font></b></p>
			</td>
		</tr>
	</table>
	<p align="center"><b><a href="bcgp.asp?bcid=<%=userid%>" style="text-decoration: none">����</a></b></div>