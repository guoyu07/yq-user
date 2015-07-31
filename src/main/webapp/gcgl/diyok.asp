<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where id =2 "
rs.open sql,conn2,2,3
 rs("dqgj")=request("dqgj")
 rs("jygj")=request("jygj")
 rs("fsjygsl")=request("fsjygsl")
 rs.update
%>
<% 
response.Write "<script language=javascript>alert('…Ë÷√≥…π¶£°');window.location.replace('jydiy.asp');</script>"
%>