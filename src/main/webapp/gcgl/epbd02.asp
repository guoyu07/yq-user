<!--#include file="../zqcjimg.asp"-->
<%
jybh=request("bh")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn1,2,3
rs("jyid")=request("jyid")
rs("pdid")=request("pdid")
rs.update
%>
<%
response.Write "<script language=javascript>alert('ÐÞ¸Ä³É¹¦£¡');location.replace('epbd01.asp?bh="&jybh&"');</script>"
%>