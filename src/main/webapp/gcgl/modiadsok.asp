<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
regid=request("regid")
set rs0=server.CreateObject("adodb.recordset")
sql0="select * from gg where ID like '"&regid&"'"
rs0.open sql0,conn,2,3
rs0("ggbt")=request("ggbt")
rs0("ggny")=request("ggny")
rs0.update
response.Write "<script language=javascript>alert('公告修改成功！');history.go(-1);</script>"
response.end
%>