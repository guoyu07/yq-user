<!--#include file="../cfvip.asp"-->
<%
	response.cookies("regid")=""
	response.cookies("password")=""
%>
<%
regid=request("id")
password=request("pa")
Set rs_login = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username =  '" & regid & "' and password = '" & password & "'"
rs_login.open sql,conn2,1,1
if regid="'or'='or'" then
   response.write "<script language='javascript'>"
   response.write "alert('�벻Ҫ�������ֱ�վ��');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
if rs_login.eof and rs_login.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż�������������µ�¼��');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
end if
end if
response.cookies("regid")=rs_login("username")
response.cookies("password")=rs_login("password")
rs_login.close
response.redirect "manager.asp"
%>