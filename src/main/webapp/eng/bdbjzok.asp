<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="../mq0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")
   jzpay=request("jzpay")
   syuser=request("syuser")
end if
%>
<%
if regid<>"300fhk" then
set rs_zuo = Server.CreateObject("ADODB.Recordset")
sql_zuo="select * from zuo_mingxi where tjuser ='"&regid&"' and down = '" &syuser&"'"
rs_zuo.open sql_zuo,conn7,1,1
if rs_zuo.eof and rs_zuo.bof then
set rs_you = Server.CreateObject("ADODB.Recordset")
sql_you="select * from you_mingxi where tjuser ='"&regid&"' and down = '" &syuser&"'"
rs_you.open sql_you,conn7,1,1
if rs_you.eof and rs_you.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Can only be transferred to their own teams and players have entered the two-zone!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&regid&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Transfer user name does not exist, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif regid=syuser then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, can not be transferred to yourself, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif jzpay<0 or jzpay=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you transfer credits can not be less than zero declaration, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("sybdb")<jzpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Username declaration turn out not greater than the remaining coins currency declaration form "&rs("sybdb")&" , Thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&syuser&"'"
rs1.open sql1,conn2,2,3
if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Receiving a user name does not exist, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("sybdb")=rs("sybdb")-(jzpay+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM bdbdate"
rs_d1.open sql_d1,conn1,2,3
rs_d1.addnew
rs_d1("zuser")=regid
rs_d1("bz")="Transferred-"&syuser&""
rs_d1("jc")=jzpay
rs_d1("sybdb")=rs("sybdb")
rs_d1("ljbdb")=rs("ljbdb")
rs_d1.update   
   rs1("sybdb")=rs1("sybdb")+(jzpay+0)
   rs1("ljbdb")=rs1("ljbdb")+(jzpay+0)
   rs1.update   
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM bdbdate"
rs_d2.open sql_d2,conn1,2,3
rs_d2.addnew
rs_d2("zuser")=syuser
rs_d2("bz")="Receive - service center"&left(regid,2)&"***"
rs_d2("sy")=jzpay
rs_d2("sybdb")=rs1("sybdb")
rs_d2("ljbdb")=rs1("ljbdb")
rs_d2.update
end if
%>
<%
set rs_vip= Server.CreateObject("ADODB.Recordset")
sql_vip= "SELECT * FROM vipxtgc where vipname='"&regid&"' and DateDiff('d',date(),vipdate)=0 order by vipid desc"
rs_vip.open sql_vip,conn2,2,3
if not rs_vip.eof then
   rs_vip("jcbdb")=rs_vip("jcbdb")+(jzpay+0)
   rs_vip.update
else
   rs_vip.addnew
   rs_vip("vipname")=regid
   rs_vip("vipdate")=date()
   rs_vip("jcbdb")=jzpay
   rs_vip.update
end if
response.Write "<script language=javascript>alert('Hello! Currency transfer declaration success!');location.replace('bdbdate.asp');</script>"
%>