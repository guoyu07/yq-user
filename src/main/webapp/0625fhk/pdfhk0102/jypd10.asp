<!--#include file="../shopmfh.asp"-->
<%
if request.cookies("fhk0628")="" or request.cookies("pdid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż�������������µ�¼��');"
   response.write "window.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   jbk=request.cookies("fhk0625")
   pdid=request.cookies("pdid")
end if
%>
<%
set rs_dl =server.createobject("adodb.recordset")
sql_dl ="delete from jbk100 where pdid ='"&pdid&"'"
rs_dl.open sql_dl,conn0,2,3
%>
<%
  response.cookies("fhk0628")=""
  response.cookies("pdid")=""
  response.redirect "/vgo/jbkcj.asp?jbk="&jbk&"&pdid="&pdid&"&mj=10"
%>