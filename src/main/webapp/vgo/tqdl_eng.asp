<!--#include file="../zqcjimg.asp"-->
<%
dluser=request("dl")
%>
<%
dim rs,sql
set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from dateip where user ='"&dluser&"'order by id desc"
rs.open sql,conn1,2,3
rs("tcdate")=Now()
rs.update
%>
<%
response.redirect "http://www.zgyce.com/english"
%>