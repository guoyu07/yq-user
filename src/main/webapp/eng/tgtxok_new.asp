<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
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
   tgpay=request("txpay")
   pa3=request("pa3")
end if
%>
<%
if tgpay<1000 then
   tgpay9=request("txpay")*0.85
   tgpay09=int(tgpay9/1)
else
   tgpay9=request("txpay")*0.9
   tgpay09=int(tgpay9/1)
end if
%>
<%
if tgpay<>"" then
if tgpay+0<0 or tgpay+0=0 or tgpay+0<100 then
   response.write "<script language='javascript'>"
   response.write "alert('Published a number of coins in error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
txqpay=rs("pay")
bjpay=rs("sjb")*500
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay*1>rs("fhpay") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you gain one selling game currency shortage, please try again, if necessary, to sell a currency bonus bonus point next part please sell a currency, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("password3")<>pa3 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you two password is incorrect, please re-enter!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you publish the number one currency can not be less than zero, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<100 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you publish the number one currency can not be less than 100, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you publish the number one currency can not be greater than your remaining one currency "&rs("pay")&" , Thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("payok")=1 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you have posted success, please be patient after processing is complete release the second tranche, or the Subscriber has your payment, please re-confirm receiving the second tranche release, thank you!');"
   response.write "location.replace('epmcjl.asp');"
   response.write "</script>" 
   response.end 
end if
else
   response.write "<script language='javascript'>"
   response.write "alert('Published a number of coins can not be empty, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
rs("pay")=rs("pay")-(tgpay+0)
rs("fhpay")=rs("fhpay")-(tgpay+0)
rs("txpay")=rs("txpay")+(tgpay+0)
rs("mcpay")=rs("mcpay")+(tgpay+0)
rs("payok")=1
rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("regid")="Paid"&tgpay09&""
rs_d1("jc")=tgpay
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("newbz")=3
rs_d1("txbz")=1
rs_d1.update
%>
<%
'set rs_jy = Server.CreateObject("ADODB.Recordset")
'sql_jy = "select top 1 * from (SELECT top 11 * from txpay where payonoff = 'ипн╢в╙ук' and ep=0 order by payid asc) order by payid desc"
'rs_jy.open sql_jy,conn9,1,1
%>
<%
set rs_jy = Server.CreateObject("ADODB.Recordset")
sql_jy = "SELECT top 1 * from txpay order by payid desc"
rs_jy.open sql_jy,conn9,1,1
%>
<%
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select top 1 * from datepay where username ='"&username&"' and jc="&tgpay&" order by id desc "
rs0.open sql0,conn9,1,1
%>
<%
set rs_tx = Server.CreateObject("ADODB.Recordset")
sql_tx = "SELECT * FROM txpay"
rs_tx.open sql_tx,conn9,2,3
rs_tx.addnew
rs_tx("payusername")=rs("username")
rs_tx("cxt")=rs("cxt")
rs_tx("paynum")=tgpay
rs_tx("paynum9")=tgpay09
rs_tx("payname")=rs("name")
rs_tx("paybank")=rs("bank")
rs_tx("paycard")=rs("card")
rs_tx("payonoff")="Not yet forwarded"
rs_tx("bankbz")=txqpay
rs_tx("bz")=rs("pay")
rs_tx("dqu")=rs("dqu")
rs_tx("qlid")=rs0("id")
rs_tx("pdid")=11
rs_tx("jyid")=rs_jy("payid")+1
rs_tx("vipname")=rs("vipname")
rs_tx("txvip")=rs("txlb")
rs_tx("txip")=Request.ServerVariables("REMOTE_ADDR")
rs_tx.update
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where name='"&rs("name")&"' and userid='"&rs("userid")&"' order by id asc"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("payok")=1
'rsTest("txdate")=Now()+20
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('Your publication has been successfully submitted, after the release of the success of our subscription a coin - the direction of your order within 2 hours after the hit on your payment account! Please check in time!--"&txbl&"');location.replace('epmcjl.asp');</script>"
%>