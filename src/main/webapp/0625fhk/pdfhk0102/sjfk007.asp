<!--#include file="../shopmfh.asp"-->
<%
lkid=request("lkid")
lksl=request("lksl")
gmmj=request("mj")
fkuser=request("fk")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from lkjl where lkuser = '"&lkid&"'"
rs.open sql,conn0,2,3
if rs.eof and rs.bof then
   rs.addnew
   rs("lkuser")=lkid
   rs("lksl")=lksl
   rs.update
else
   rs("lksl")=lksl
   rs.update
end if
%>
<%
response.cookies("lkuserid")="100200"
response.redirect"sjfk008.asp?lkid="&rs("lkuser")&"&mj="&gmmj&"&fk="&fkuser&""
%>