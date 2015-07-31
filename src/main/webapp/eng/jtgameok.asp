<!--#include file="../ct0618.asp"-->
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
tgpay=request("cjpay")
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
elseif tgpay+0<0 or tgpay+0=0 or tgpay<100 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you recharge single number can not be less than zero, or the number of not less than 100 recharging points, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you recharge your number is not greater than the number of remaining points "&rs("jyg")&", Thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-(tgpay+0)
   rs("ga")=rs("ga")+(tgpay+0)
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
rs_d1("bz")="Game recharge"
rs_d1("jy")=1
rs_d1.update
%>
<% 
response.redirect"http://p.cfjte.com/Manage/Pay/RuiPay/r.aspx?user="&username&"&paymoney="&tgpay&""
%>
