<!--#include file="../ct0618.asp"-->
<!--#include file="cfvip.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   session.timeout=10
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
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
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("username")<>jhuser then
   response.write "<script language='javascript'>"
   response.write "alert('激活的用户名和当前登录的用户名不相同，请退出后重试！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("password")<>md5(pa5) then
   response.write "<script language='javascript'>"
   response.write "alert('你好，你的登录密码不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
response.redirect"http://p.cfjte.com/Manage/Reg02.aspx?user="&jhuser&"&pa="&request("pa")&""
%>