<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
set rs_gg = Server.CreateObject("ADODB.Recordset")
sql_gg = "SELECT * FROM gg"
rs_gg.open sql_gg,conn,3,2
rs_gg.addnew
rs_gg("ggbt")=request.Form("ggbt")
rs_gg("ggny")=request.Form("ggny")
rs_gg.update
response.Write "<script language=javascript>alert('������ӳɹ���');history.go(-1);</script>"
response.end
%>