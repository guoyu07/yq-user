<!--#include file="../zqcjimg.asp"-->
<%
jybh=request("payep")
tx=request("tx")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn1,2,3
   rs("ep")=0
   rs.update
%>
<%
response.Write "<script language=javascript>alert('…Û∫À≥…π¶£°');location.replace('"&tx&".asp');</script>"
%>