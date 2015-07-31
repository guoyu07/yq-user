<!--#include file="../shopmfh.asp"-->
<%
if request.cookies("fhk0628")="" or request.cookies("pdid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('ÕËºÅ»òÃÜÂë´íÎó£¬ÇëÖØĞÂµÇÂ¼£¡');"
   response.write "window.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   jbk=request.cookies("fhk0625")
   pdid=request.cookies("pdid")
   gmuser=request.cookies("gmuser")
   gmdate=request.cookies("gmdate")
   mj=request.cookies("mj")
end if
%>
<%
set rs_dl =server.createobject("adodb.recordset")
sql_dl ="delete from ejbk where pdid ='"&pdid&"'"
rs_dl.open sql_dl,conn0,2,3
%>
<%
  response.cookies("fhk0628")=""
  response.cookies("pdid")=""
  response.redirect "/vgo/jbkcj.asp?jbk="&jbk&"&pdid="&pdid&"&gmuser="&gmuser&"&gmdate="&gmdate&"&mj="&mj&""
%>