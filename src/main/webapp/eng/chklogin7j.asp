<!--#include file="../ct0618.asp"-->
<%
username=request("m_username")
password3=request("password3")
Set rs_login = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username = '" & username & "' and password3 = '" & password3 & "'"
rs_login.open sql,conn2,1,1
if rs_login.eof and rs_login.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Two password is incorrect, please re-enter!');"
   response.write "location.replace('login7j.asp');"
   response.write "</script>"
   response.end
end if
response.cookies("regid")=rs_login("username")
response.cookies("password")=rs_login("password")
rs_login.close
response.redirect "sjfk001.asp"
%>