<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("ep") 
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from txpay where payid ="&jybh&""
rs_my.open sql_my,conn1,2,3
if rs_my("dfuser")<>username or rs_my("kjygid")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('�Ϲ����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_my("ep")=2
   rs_my("rgdate")=now()+2
   rs_my.update
end if
%>
<%
response.Write "<script language=javascript>alert('֪ͨ�������ɹ����ȴ����׳ɹ���');location.replace('epmyjl.asp');</script>"
%>