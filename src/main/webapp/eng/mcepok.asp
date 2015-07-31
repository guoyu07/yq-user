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
   jybh=request("ep") 
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
if rs_mc("payusername")<>username then
   response.write "<script language='javascript'>"
   response.write "alert('Published square error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs_mc("ep")=0 or rs_mc("zftime")<>"" then
   response.write "<script language='javascript'>"
   response.write "alert('Transaction has been completed!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_mc("ep")=0
   rs_mc("rgdate")=now()
   rs_mc("payonoff")="Has been transferred"
   rs_mc("zftime")=now()
   rs_mc("clip")=Request.ServerVariables("REMOTE_ADDR")
   rs_mc.update
   rs("payok")=0
   'rs("txdate")=abcd
   rs.Update
end if
%>
<%
dim sql_df
dim rs_df
set rs_df=server.createobject("adodb.recordset")
sql_df="select * from gcuser where username = '" &rs_mc("dfuser")& "' "
rs_df.open sql_df,conn2,2,3
rs_df("pay")=rs_df("pay")+rs_mc("paynum")
rs_df("jyg")=rs_df("jyg")+rs_mc("kjygid")
rs_df("cbpay")=rs_df("cbpay")+rs_mc("paynum")
rs_df("rgpay")=rs_df("rgpay")+rs_mc("paynum")
rs_df.update
%>
<%
dim sql0
dim rs0
set rs0=server.createobject("adodb.recordset")
sql0="select * from datepay where id = " &rs_mc("qlid")& " "
rs0.open sql0,conn9,2,3
if not rs0.eof then
rs0("regid")=rs0("regid")&"-"&rs_mc("dfuser")&"-"&now()
rs0("txbz")=0
rs0.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=rs_mc("dfuser")
rs_d1("mysl")=rs_mc("kjygid")
rs_d1("sysl")=rs_df("jyg")
rs_d1("bz")="Thaw - Call a currency-"&rs_mc("paynum")&"Honesty gold-"&rs_mc("payusername")&""
rs_d1("cgdate")=Now()
rs_d1("jy")=1
rs_d1("dfuser")="System"
rs_d1.update
%>
<%
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs_mc("dfuser")
rs_d2("regid")="Call a currency-"&rs_mc("payusername")&"-"&rs_mc("paynum")&""
rs_d2("syjz")=rs_mc("paynum")
rs_d2("pay")=rs_df("pay")
rs_d2("jydb")=rs_df("jydb")
rs_d2("newbz")=2
rs_d2.update
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
response.Write "<script language=javascript>alert('The transaction a success!');location.replace('epmcjl.asp');</script>"
%>