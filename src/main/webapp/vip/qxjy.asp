<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("id") 
end if
%>
<%
dim rs_qx,sql_qx
set rs_qx = Server.CreateObject("ADODB.Recordset")
sql_qx="select * from gpjy where id ="&jybh&""
rs_qx.open sql_qx,conn2,2,3
if rs_qx("cgdate")<>"" and rs_qx("dfuser")<>"" then
rs_qx("jy")=1
rs_qx.update
else
rs_qx("jy")=0
rs_qx.update
end if
%>
<%
response.Write "<script language=javascript>alert('交易超时或撒消交易成功！');location.replace('gpjysc.asp');</script>"
%>