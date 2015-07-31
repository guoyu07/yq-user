<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
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
end if
%>
<%
jzpay=request("jzpay")
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
elseif jzpay<0 or jzpay=0 or jzpay<100 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you convert the balance can not be less than zero or less than 100, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fhname where fhuser ='"&username&"'"
rs1.open sql1,conn7,2,3
hzhpay=rs1("ljfhpay")-rs1("txfhpay")
if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operation Error 2, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif hzhpay+0<jzpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you convert the remaining balance can not be greater than your bonus amount "&hzhpay&" , Thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("pay")=rs("pay")+(jzpay+0)
   rs("cbpay")=rs("cbpay")+(jzpay+0)
   rs.update
   rs1("txfhpay")=rs1("txfhpay")+(jzpay+0)
   rs1.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("regid")="Dividends dump"
rs_d1("syjz")=jzpay
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
%>
<% 
response.Write "<script language=javascript>alert('Hello! The conversion was successful!');location.replace('datepay.asp');</script>"
%>