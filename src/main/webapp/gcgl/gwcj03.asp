<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "top.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="120"
   cjyh=request("uid")
   cjpay=request("cj")
   cjfs=request("fs")
   czy=request("czy")
   bfym=Request.ServerVariables("SERVER_NAME")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="secjlog.asp"-->
<%
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from fcxt where ncjud ='"&czy&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作员不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&cjyh&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该用户名不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
  rs("cjtj")=rs("cjtj")+cjpay
  rs("jjsy")=rs("jjsy")+(1*cjpay)
  rs("ljsy")=rs("ljsy")+(1*cjpay)  
  rs("gmdate")=Now()
  rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gcfh"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("userid")=cjyh
rs_d1("syfh")=cjpay
rs_d1("ljfhtj")=rs("jjsy")
rs_d1("bz")="充值消费"
rs_d1("sf")=1
rs_d1.update
end if
%>
<%
response.cookies("lsyh")=""
response.redirect "/vgo/cfkfc04.asp?dl="&cjyh&"&cj="&cjpay&"&cjtj="&rs("cjtj")&"&cz="&czy&"&fs="&cjfs&"-购物&bfym="&bfym&""
%>