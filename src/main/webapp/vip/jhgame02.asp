<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   session.timeout=10
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jhuser=request("user") 
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&jhuser&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("ga")=1
   rs.update
end if
%>
<%
response.Write "<script language=javascript>alert('����ɹ���');window.location.replace('jfgame.asp');</script>"
%>