<!--#include file="../zqcjimg.asp"-->
<%
dluser=request("dl")
pa=request("pa")
%>
<%
dim rs,sql
set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from dateip"
rs.open sql,conn1,2,3
rs.addnew
rs("user")=dluser
rs("dlip")=Request.ServerVariables("REMOTE_ADDR")
rs.update
%>
<%
response.redirect "/vip/manager.asp"
%>