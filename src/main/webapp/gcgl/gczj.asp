<%
if request.cookies("fhgc")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "window.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   user=request("uid")
   zjpay=request("zj")
   cjpay=request("cj")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
if cjpay<1000 then
response.cookies("lsyh")=""
response.cookies("fhgc")=""
response.redirect "searchg0701.asp"
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&user&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该会员不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   rs("gdgc")=rs("gdgc")+zjpay
   rs("gmdate")=now()
   rs.update
end if
%>
<%			
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gcfh"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("userid")=user
rs_d1("sygc")=zjpay
rs_d1("ljgc")=rs("gdgc")
rs_d1("bz")="充值"&cjpay&"赠送分红股权"
rs_d1.update
%>
<%
response.cookies("lsyh")=""
response.cookies("fhgc")=""
response.redirect "searchg0701.asp"
%>
