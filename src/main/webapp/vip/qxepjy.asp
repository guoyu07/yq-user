<!--#include file="../zqcjimg.asp"-->
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
   jybh=request("ep")
end if
%>
<%
dim rs_qx,sql_qx
set rs_qx = Server.CreateObject("ADODB.Recordset")
sql_qx="select * from txpay where payid ="&jybh&""
rs_qx.open sql_qx,conn1,2,3
if rs_qx("payonoff") = "尚未转账" or rs_qx("kjygid")=0 then
   rs_qx("ep")=0
   rs_qx("rgdate")=abcd
   rs_qx("dfuser")=""
   rs_qx("kjygid")=0
   rs_qx.update
end if
%>
<%
response.Write "<script language=javascript>alert('交易超时或撒消交易成功！');location.replace('epjysc.asp');</script>"
%>