<!--#include file="../ct0618.asp"-->
<!--#include file="cfvip.asp"-->
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
   jhuser=request("ga")  
end if
%>
<% 
dim pa
pa2=request("pa")
pa5=LCase(pa2)
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("username")<>jhuser then
   response.write "<script language='javascript'>"
   response.write "alert('������û����͵�ǰ��¼���û�������ͬ�����˳������ԣ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("password")<>md5(pa5) then
   response.write "<script language='javascript'>"
   response.write "alert('��ã���ĵ�¼���벻��ȷ�����������룡');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
response.redirect"http://p.cfjte.com/Manage/Reg02.aspx?user="&jhuser&"&pa="&request("pa")&""
%>