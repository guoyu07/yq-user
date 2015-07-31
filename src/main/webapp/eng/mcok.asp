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
   jybh=request("id")
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from gpjy where id ="&jybh&""
rs_mc.open sql_mc,conn2,2,3
mcjyid=rs_mc("jyid")
mcpay=rs_mc("jypay")
mysl=rs_mc("mysl")
dqpay=mcpay*0.9
mc70a=0.7*dqpay
mc70=int(mc70a*1+0.1)/1
mc30a=0.3*dqpay
mc30=int(mc30a*1+0.1)/1
if rs_mc("jy")<>2 or rs_mc("cgdate")<>"" then
   response.Write "<script language=javascript>alert('Illegal operation, please check and try again!');location.href='gpjysc.asp'</script>"
   response.end
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
elseif rs("jyg")+0<0 or rs("jyg")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, trade credit amount can not be less than zero, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif mysl+0>rs("jyg") or rs("jyg")<1 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, this transaction is greater than the number of points your credit amount remaining transactions "&rs("jyg")&" , Temporarily unable transaction, the transaction needs "&mysl&" Points, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-mysl
   rs("pay")=rs("pay")+mc70
   rs("vippay")=rs("vippay")+mc70
   rs("cbpay")=rs("cbpay")+mc70
   rs("jydb")=rs("jydb")+mc30
   rs.update
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gcuser where username ='"&rs_mc("username")&"'"
rs_my.open sql_my,conn2,2,3
rs_my("jyg")=rs_my("jyg")+mysl
rs_my.update
%>
<%
rs_mc("sysl")=rs_my("jyg")
rs_mc("bz")="Successful Bid"
rs_mc("cgdate")=Now()
rs_mc("jy")=1
rs_mc("dfuser")=username
rs_mc.update
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("mcsl")=mysl
rs_d1("sysl")=rs("jyg")
rs_d1("pay")=rs_mc("pay")
rs_d1("jypay")=rs_mc("jypay")
rs_d1("abdate")=rs_mc("date")
rs_d1("bz")="Sell successfully"
rs_d1("cgdate")=rs_mc("cgdate")
rs_d1("jy")=1
rs_d1("dfuser")=rs_mc("username")
rs_d1.update
%>
<%
if rs_mc("pay")<1 then
   mydj="0"&rs_mc("pay")
else
   mydj=rs_mc("pay")
end if
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM datepay"
rs_d3.open sql_d3,conn9,2,3
rs_d3.addnew
rs_d3("username")=username
rs_d3("syjz")=mc70
rs_d3("pay")=rs("pay")
rs_d3("jydb")=rs("jydb")
rs_d3("jyjz")=mc30
rs_d3("regid")="Sell"&mysl&"Price Points"&mydj&"To"&rs_mc("username")&""
rs_d3.update
%>
<%
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from datepay where id = "&mcjyid&""
rs0.open sql0,conn9,2,3
rs0("regid")=""&rs_mc("cgdate")&"Expenditures success to"&rs_mc("dfuser")&"-Integration"&mysl&"-Unit price"&mydj&""
rs0.update
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,2,3
rs1("syjygsl")=rs1("syjygsl")-mysl
rs1("jygsl")=rs1("jygsl")+mysl
rs1("jy5w")=rs1("jy5w")+mysl
'rs1("jy5w")=20000
rs1.update
%>
<% 
response.Write "<script language=javascript>alert('Sell"&mysl&"Points success!');location.replace('gpjysc.asp');</script>"
%>