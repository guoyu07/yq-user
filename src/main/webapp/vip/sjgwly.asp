<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="120"
   cjpay=request("cj")
   userid=request("uid")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&userid&"'and password = '" &password&"'"
rs.open sql,conn2,2,3
   d9=rs("add9dqu")
   s2=rs("addsheng")
   s3=rs("addshi")
   q4=rs("addqu")
if rs.eof and rs.bof or userid<>ygid then
   response.write "<script language='javascript'>"
   response.write "alert('该玩家不存在，请检查输入是否正确！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
end if
%>
<%			
set rs10=server.createobject("adodb.recordset")
  sql10="select * from gcuser where username = '"&rs("up")&"'"
  rs10.open sql10,conn2,2,3
  rs10("pay")=rs10("pay")+(0.1*cjpay)
  rs10("cbpay")=rs10("cbpay")+(0.1*cjpay)
  rs10.Update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("up")
rs_d1("regid")="用户一"&userid&"消费"&cjpay&""  
rs_d1("syjz")=0.1*cjpay
rs_d1("pay")=rs10("pay")
rs_d1("jydb")=rs10("jydb")
rs_d1.update
%>
<%
set rs11=server.createobject("adodb.recordset")
  sql11="select * from gcuser where username = '"&rs10("up")&"'"
  rs11.open sql11,conn2,2,3
  rs11("pay")=rs11("pay")+(0.03*cjpay)
  rs11("cbpay")=rs11("cbpay")+(0.03*cjpay)
  rs11.Update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs10("up")
rs_d2("regid")="用户二"&userid&"消费"&cjpay&""
rs_d2("syjz")=0.03*cjpay
rs_d2("pay")=rs11("pay")
rs_d2("jydb")=rs11("jydb")
rs_d2.update
%>
<% 
set rs12=server.createobject("adodb.recordset")
  sql12="select * from gcuser where username = '"&rs11("up")&"'"
  rs12.open sql12,conn2,2,3
  rs12("pay")=rs12("pay")+(0.01*cjpay)
  rs12("cbpay")=rs12("cbpay")+(0.01*cjpay)
  rs12.Update
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM datepay"
rs_d3.open sql_d3,conn9,2,3
rs_d3.addnew
rs_d3("username")=rs11("up")
rs_d3("regid")="用户三"&userid&"消费"&cjpay&""
rs_d3("syjz")=0.01*cjpay
rs_d3("pay")=rs12("pay")
rs_d3("jydb")=rs12("jydb")
rs_d3.update
%>
<%
sql_q4="select * from gcuser where addqu='"&q4&"'and jb=4"
Set rs_q4= Server.CreateObject("ADODB.Recordset") 
rs_q4.open sql_q4,conn2,2,3
if not rs_q4.eof then
  rs_q4("qutj")=rs_q4("qutj")+(0.01*cjpay)
  rs_q4("qupay")=rs_q4("qupay")+(0.01*cjpay)
  rs_q4("dlpay")=rs_q4("dlpay")+(0.01*cjpay)
  rs_q4.update
set rs_d5 = Server.CreateObject("ADODB.Recordset")
sql_d5 = "SELECT * FROM dldate"
rs_d5.open sql_d5,conn9,2,3
rs_d5.addnew
rs_d5("username")=rs_q4("username")
rs_d5("syjz")=0.01*cjpay
rs_d5("pay")=rs_q4("qupay")
rs_d5("regid")="区内用户"&userid&"消费"&cjpay&""
rs_d5.update
end if
%>
<%
sql_s3="select * from gcuser where addshi='"&s3&"'and jb=3"
Set rs_s3= Server.CreateObject("ADODB.Recordset") 
rs_s3.open sql_s3,conn2,2,3
if not rs_s3.eof then
  rs_s3("shitj")=rs_s3("shitj")+(0.005*cjpay)
  rs_s3("shipay")=rs_s3("shipay")+(0.005*cjpay)
  rs_s3("dlpay")=rs_s3("dlpay")+(0.005*cjpay)
  rs_s3.update
set rs_d6 = Server.CreateObject("ADODB.Recordset")
sql_d6 = "SELECT * FROM dldate"
rs_d6.open sql_d6,conn9,2,3
rs_d6.addnew
rs_d6("username")=rs_s3("username")
rs_d6("syjz")=0.005*cjpay
rs_d6("pay")=rs_s3("shipay")
rs_d6("regid")="市内用户"&userid&"消费"&cjpay&""
rs_d6.update
end if
%>
<%
sql_s2="select * from gcuser where addsheng='"&s2&"'and jb=2"
Set rs_s2= Server.CreateObject("ADODB.Recordset") 
rs_s2.open sql_s2,conn2,2,3
if not rs_s2.eof then
  rs_s2("shengtj")=rs_s2("shengtj")+(0.002*cjpay)
  rs_s2("shengpay")=rs_s2("shengpay")+(0.002*cjpay)
  rs_s2("dlpay")=rs_s2("dlpay")+(0.002*cjpay)
  rs_s2.update
set rs_d7 = Server.CreateObject("ADODB.Recordset")
sql_d7 = "SELECT * FROM dldate"
rs_d7.open sql_d7,conn9,2,3
rs_d7.addnew
rs_d7("username")=rs_s2("username")
rs_d7("syjz")=0.002*cjpay
rs_d7("pay")=rs_s2("shengpay")
rs_d7("regid")="省内用户"&userid&"消费"&cjpay&""
rs_d7.update
end if
%>
<%
sql_9d="select * from gcuser where add9dqu='"&d9&"'and jb=1"
Set rs_9d= Server.CreateObject("ADODB.Recordset") 
rs_9d.open sql_9d,conn2,2,3
if not rs_9d.eof then
  rs_9d("dqutj")=rs_9d("dqutj")+(0.001*cjpay)
  rs_9d("dqupay")=rs_9d("dqupay")+(0.001*cjpay)
  rs_9d("dlpay")=rs_9d("dlpay")+(0.001*cjpay)
  rs_9d.update
set rs_d8 = Server.CreateObject("ADODB.Recordset")
sql_d8 = "SELECT * FROM dldate"
rs_d8.open sql_d8,conn9,2,3
rs_d8.addnew
rs_d8("username")=rs_9d("username")
rs_d8("syjz")=0.001*cjpay
rs_d8("pay")=rs_9d("dqupay")
rs_d8("regid")="大区内用户"&userid&"消费"&cjpay&""
rs_d8.update
end if
%>
<%
response.cookies("lsyh")=""
response.Write "<script language=javascript>alert('恭喜购买金币卡成功。。。！');location.href='searchg0701.asp'</script>"
%>