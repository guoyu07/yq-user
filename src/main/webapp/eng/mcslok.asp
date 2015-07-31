<!--#include file="../ct0618.asp"-->
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
tgpay=request("sl")
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
elseif rs("stopjyg")>19 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, notarized in order to provide a more equitable trading rules, listed a total of up to 20 pens, after the completion of the transaction can continue to publish, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 or tgpay>2000 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you sell single number can not be less than zero or greater than 2000 points can not sell the number, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you sell the remaining number of points that you can not be greater than the number of "&rs("jyg")&" , Thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-(tgpay+0)
   rs("stopjyg")=rs("stopjyg")+1
   rs.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("mcsl")=tgpay
rs_d1("sysl")=rs("jyg")
rs_d1("pay")=request("gj")
rs_d1("bz")="Sell listed in"
rs_d1("jypay")=int(tgpay*request("gj")*1+0.1)/1
rs_d1.update
%>
<% 
response.Write "<script language=javascript>alert('Ask listing success!');location.replace('gpjy.asp');</script>"
%>