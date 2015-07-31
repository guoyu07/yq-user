<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
Set rs_admin = Server.CreateObject("ADODB.Recordset")
sql="select * from cfadmin where adminusername = 'admin'"
rs_admin.open sql,conn,3,2
  rs_admin("jygj")=request.Form("jygj")
  rs_admin("zgj")=request.Form("zgj")
  rs_admin("zdj")=request.Form("zdj")
  rs_admin.update
  response.Write "<script language=javascript>alert('…Ë÷√≥…π¶£°');location.href='vipjyj.asp'</script>"
%>