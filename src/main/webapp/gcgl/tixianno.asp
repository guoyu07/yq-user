<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
payid=request("payid")
set rs=server.createobject("adodb.recordset")
sql="select * from txpay  where payid = '" & payid & "' "
sql="update txpay set payonoff='�����˺�',clip='"&Request.ServerVariables("REMOTE_ADDR")&"' where payid='"&request("payid")&"'"
rs.open sql,conn9,2,3
%>


<p align="center">��</p>
<p align="center">��</p>
<p align="center">�����˺ż�¼�ɹ�</p>
<p align="center">��</p>
<p align="center"><span style="font-size: 20pt">
<a href="<%=request("tx")%>.asp" style="text-decoration: none"><font color="#FF0000">�� ��</font></a></span></p>