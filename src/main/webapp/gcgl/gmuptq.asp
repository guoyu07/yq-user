<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "window.location.replace('logout001.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="1200"
end if
%>
<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
regid=request("id")
td=request("td")
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM cfuser where username like '"&regid&"'"
rs.open sql,conn,3,2
   s4=rs("addsheng")
   s3=rs("addshi")
   q2=rs("addqu")
   z1=rs("addzhen")
if rs("gmjl")=0 or rs("gmjl")<0 then
   response.write "<script language='javascript'>"
   response.write "alert('该用户的订单已处理过！');"
   response.write "window.location.replace('logout001.asp');"
   response.write "</script>"
   response.end
else
   rs("gmpaytj")=rs("gmpay")+rs("gmpaytj")
   rs.update
end if
%>
<%
  set rs1=server.createobject("adodb.recordset")
  sql1="select * from cfdown where user_xx like '"&regid&"'and down1=1 "
  rs1.open sql1,conn,3,2
  if rs1.eof and rs1.bof then
  user1="0"
  else
  user1=rs1(1)
  end if
  set rs2=server.createobject("adodb.recordset")
  sql2="select * from cfdown where user_xx like '"&regid&"'and down2=1 "
  rs2.open sql2,conn,3,2
  if rs2.eof and rs2.bof then
  user2="0"
  else
  user2=rs2(1)
  end if
  set rs3=server.createobject("adodb.recordset")  
  sql3="select * from cfdown where user_xx like '"&regid&"'and down3=1 "
  rs3.open sql3,conn,3,2
  if rs3.eof and rs3.bof then
  user3="0"
  else
  user3=rs3(1)
  end if
  set rs4=server.createobject("adodb.recordset")  
  sql4="select * from cfdown where user_xx like '"&regid&"'and down4=1 "
  rs4.open sql4,conn,3,2
  if rs4.eof and rs4.bof then
  user4="0"
  else
  user4=rs4(1)
  end if  
%>
<%			
set rs10=server.createobject("adodb.recordset")
  sql10="select * from cfuser where username like '"&user1&"'"
  rs10.open sql10,conn,3,2
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn,3,2
rs_d1.addnew
rs_d1("username")=user1
rs_d1("regid")="一级代理"&regid&"买卡"&rs("gmpay")&"元"
rs_d1.update
if rs10("jb")=4 then
  rs10("pay")=rs10("pay")+(0.14*rs("gmpay"))
  rs10("cbpay")=rs10("cbpay")+(0.14*rs("gmpay"))
  rs10.Update
rs_d1("syjz")=rs_d1("syjz")+(0.14*rs("gmpay"))
rs_d1("pay")=rs10("pay")
rs_d1.update
elseif rs10("jb")=3 then
  rs10("pay")=rs10("pay")+(0.12*rs("gmpay"))
  rs10("cbpay")=rs10("cbpay")+(0.12*rs("gmpay"))
  rs10.Update
rs_d1("syjz")=rs_d1("syjz")+(0.12*rs("gmpay"))
rs_d1("pay")=rs10("pay")
rs_d1.update
elseif rs10("jb")=2 then
  rs10("pay")=rs10("pay")+(0.1*rs("gmpay"))
  rs10("cbpay")=rs10("cbpay")+(0.1*rs("gmpay"))
  rs10.Update
rs_d1("syjz")=rs_d1("syjz")+(0.1*rs("gmpay"))
rs_d1("pay")=rs10("pay")
rs_d1.update
elseif rs10("jb")=1 then
  rs10("pay")=rs10("pay")+(0.08*rs("gmpay"))
  rs10("cbpay")=rs10("cbpay")+(0.08*rs("gmpay"))
  rs10.Update
rs_d1("syjz")=rs_d1("syjz")+(0.08*rs("gmpay"))
rs_d1("pay")=rs10("pay")
rs_d1.update
elseif rs10("jb")=0 then
  rs10("pay")=rs10("pay")+(0.04*rs("gmpay"))
  rs10("cbpay")=rs10("cbpay")+(0.04*rs("gmpay"))
  rs10.Update
rs_d1("syjz")=rs_d1("syjz")+(0.04*rs("gmpay"))
rs_d1("pay")=rs10("pay")
rs_d1.update
end if
%>
<%
set rs11=server.createobject("adodb.recordset")
  sql11="select * from cfuser where username like '"&user2&"'"
  rs11.open sql11,conn,3,2
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn,3,2
rs_d2.addnew
rs_d2("username")=user2
rs_d2("regid")="二级代理"&regid&"买卡"&rs("gmpay")&"元"
rs_d2.update
if rs11("jb")>0 then
  rs11("pay")=rs11("pay")+(0.06*rs("gmpay"))
  rs11("cbpay")=rs11("cbpay")+(0.06*rs("gmpay"))
  rs11.Update
rs_d2("syjz")=rs_d2("syjz")+(0.06*rs("gmpay"))
rs_d2("pay")=rs11("pay")
rs_d2.update
end if
%>
<% 
set rs12=server.createobject("adodb.recordset")
  sql12="select * from cfuser where username like '"&user3&"'"
  rs12.open sql12,conn,3,2
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM datepay"
rs_d3.open sql_d3,conn,3,2
rs_d3.addnew
rs_d3("username")=user3
rs_d3("regid")="三级代理"&regid&"买卡"&rs("gmpay")&"元"
if rs12("jb")>0 then
  rs12("pay")=rs12("pay")+(0.03*rs("gmpay"))
  rs12("cbpay")=rs12("cbpay")+(0.03*rs("gmpay"))
  rs12.Update
rs_d3("syjz")=rs_d3("syjz")+(0.03*rs("gmpay"))
rs_d3("pay")=rs12("pay")
rs_d3.update
end if
%>
<%  
set rs13=server.createobject("adodb.recordset")
  sql13="select * from cfuser where username like '"&user4&"'"
  rs13.open sql13,conn,3,2
set rs_d4 = Server.CreateObject("ADODB.Recordset")
sql_d4 = "SELECT * FROM datepay"
rs_d4.open sql_d4,conn,3,2
rs_d4.addnew
rs_d4("username")=user4
rs_d4("regid")="四级代理"&regid&"买卡"&rs("gmpay")&"元"
if rs13("jb")>0 then
  rs13("pay")=rs13("pay")+(0.01*rs("gmpay"))
  rs13("cbpay")=rs13("cbpay")+(0.01*rs("gmpay"))
  rs13.Update
rs_d4("syjz")=rs_d4("syjz")+(0.01*rs("gmpay"))
rs_d4("pay")=rs13("pay")
rs_d4.update
end if
%>
<%
sql_z1="select * from cfuser where addzhen='"&z1&"'and dljb=1"
Set rs_z1= Server.CreateObject("ADODB.Recordset") 
rs_z1.open sql_z1,conn,3,2
if not rs_z1.eof then
set rs_d5 = Server.CreateObject("ADODB.Recordset")
sql_d5 = "SELECT * FROM datepay"
rs_d5.open sql_d5,conn,3,2
rs_d5.addnew
rs_d5("username")=rs_z1("username")
rs_d5("regid")="四级代理"&regid&"买卡"&rs("gmpay")&"元"
  rs_z1("zhentj")=rs_z1("zhentj")+(0.02*rs("gmpay"))
  rs_z1("zhenpay")=rs_z1("zhenpay")+(0.02*rs("gmpay"))
  rs_z1("dlpay")=rs_z1("dlpay")+(0.02*rs("gmpay"))
  rs_z1.update
rs_d5("syjz")=rs_d5("syjz")+(0.02*rs("gmpay"))
rs_d5("pay")=rs_z1("pay")
rs_d5.update
end if
%>
<%
sql_q2="select * from cfuser where addqu='"&q2&"'and dljb=2"
Set rs_q2= Server.CreateObject("ADODB.Recordset") 
rs_q2.open sql_q2,conn,3,2
if not rs_q2.eof then
set rs_d6 = Server.CreateObject("ADODB.Recordset")
sql_d6 = "SELECT * FROM datepay"
rs_d6.open sql_d6,conn,3,2
rs_d6.addnew
rs_d6("username")=rs_q2("username")
  rs_q2("qutj")=rs_q2("qutj")+(0.02*rs("gmpay"))
  rs_q2("qupay")=rs_q2("qupay")+(0.02*rs("gmpay"))
  rs_q2("dlpay")=rs_q2("dlpay")+(0.02*rs("gmpay"))
  rs_q2.update
rs_d6("syjz")=rs_d6("syjz")+(0.02*rs("gmpay"))
rs_d6("pay")=rs_q2("pay")
rs_d6.update
end if
%>
<%
sql_s3="select * from cfuser where addshi='"&s3&"'and dljb=3"
Set rs_s3= Server.CreateObject("ADODB.Recordset") 
rs_s3.open sql_s3,conn,3,2
if not rs_s3.eof then
set rs_d7 = Server.CreateObject("ADODB.Recordset")
sql_d7 = "SELECT * FROM datepay"
rs_d7.open sql_d7,conn,3,2
rs_d7.addnew
rs_d7("username")=rs_s3("username")
  rs_s3("shitj")=rs_s3("shitj")+(0.03*rs("gmpay"))
  rs_s3("shipay")=rs_s3("shipay")+(0.03*rs("gmpay"))
  rs_s3("dlpay")=rs_s3("dlpay")+(0.03*rs("gmpay"))
  rs_s3.update
rs_d7("syjz")=rs_d7("syjz")+(0.03*rs("gmpay"))
rs_d7("pay")=rs_s3("pay")
rs_d7.update
end if
%>
<%
sql_s4="select * from cfuser where addsheng='"&s4&"'and dljb=4"
Set rs_s4= Server.CreateObject("ADODB.Recordset") 
rs_s4.open sql_s4,conn,3,2
if not rs_s4.eof then
set rs_d8 = Server.CreateObject("ADODB.Recordset")
sql_d8 = "SELECT * FROM datepay"
rs_d8.open sql_d8,conn,3,2
rs_d8.addnew
rs_d8("username")=rs_s4("username")
  rs_s4("shengtj")=rs_s4("shengtj")+(0.04*rs("gmpay"))
  rs_s4("shengpay")=rs_s4("shengpay")+(0.04*rs("gmpay"))
  rs_s4("dlpay")=rs_s4("dlpay")+(0.04*rs("gmpay"))
  rs_s4.update
rs_d8("syjz")=rs_d8("syjz")+(0.04*rs("gmpay"))
rs_d8("pay")=rs_s4("pay")
rs_d8.update
end if
%>
<%  
set rs15=server.createobject("adodb.recordset")
  sql15="select * from cfuser where username like 'quanguo2'"
  rs15.open sql15,conn,3,2
set rs_d9 = Server.CreateObject("ADODB.Recordset")
sql_d9 = "SELECT * FROM datepay"
rs_d9.open sql_d9,conn,3,2
rs_d9.addnew
rs_d9("username")="quanguo2"
rs_d9("regid")="会员"&regid&"买卡"&rs("gmpay")&"元"
  rs15("pay")=rs15("pay")+(0.02*rs("gmpay"))
  rs15("cbpay")=rs15("cbpay")+(0.02*rs("gmpay"))
  rs15("dlpay")=rs15("dlpay")+(0.02*rs("gmpay"))
  rs15.Update
rs_d9("syjz")=rs_d9("syjz")+(0.02*rs("gmpay"))
rs_d9("pay")=rs15("pay")
rs_d9.update
%>
<%
response.redirect"pdkff.asp?id="&regid&"&td="&td&""
%>

