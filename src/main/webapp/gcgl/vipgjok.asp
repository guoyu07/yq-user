<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
Set rs_admin = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where adminusername = 'admin'"
rs_admin.open sql,conn2,2,3
  rs_admin("dqgj")=request.Form("gj")
  rs_admin.update
  response.Write "<script language=javascript>alert('…Ë÷√≥…π¶£°');location.href='vipgj.asp'</script>"
%>