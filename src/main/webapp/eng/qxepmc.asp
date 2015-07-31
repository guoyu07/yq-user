<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("qx") 
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from txpay where payid ="&jybh&""
rs_mc.open sql_mc,conn1,2,3
txpay=rs_mc("paynum")
fbuser=rs_mc("payusername")
if rs_mc("ep")>0 or rs_mc("zftime")<>"" or rs_mc("kjygid")<>0 then
   response.Write "<script language=javascript>alert('The EP transaction or transactions by its people has been successful, temporarily can not be undone, or try again later£¡');location.href='epmcjl.asp'</script>"
   response.end
else
   rs("pay")=rs("pay")+(rs_mc("paynum")*1)
   rs("txpay")=rs("txpay")-(rs_mc("paynum")*1)
   rs("mcpay")=rs("mcpay")-(rs_mc("paynum")*1)
   rs("payok")=0
   'rs("txdate")=abcd
   rs.update
dim rs_th,sql_th
set rs_th = Server.CreateObject("ADODB.Recordset")
sql_th="select * from datepay where id ="&rs_mc("qlid")&""
rs_th.open sql_th,conn9,2,3
if not rs_th.eof then
   rs_th("regid")=rs_th("regid")&"-Cancelled"
   rs_th("txbz")=0
   rs_th.update
end if
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("regid")="Revocation sell"
rs_d1("syjz")=rs_mc("paynum")
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
   rs_mc("ep")=0
   rs_mc("rgdate")=now()
   rs_mc("payonoff")="ÒÑ¾­×ªÕË"
   rs_mc("zftime")=now()
   rs_mc("dfuser")="Revocation"
   rs_mc("clip")=Request.ServerVariables("REMOTE_ADDR")
   rs_mc.update
end if
if rs("mcpay")<0 then
   rs("mcpay")=0
   rs.update
end if
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where name='"&rs("name")&"' and userid='"&rs("userid")&"' order by id asc"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("payok")=0
'rsTest("txdate")=abcd
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('Revocation of success!');location.replace('epmcjl.asp');</script>"
%>