<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<% 
t = Now()
y = Year(t)
mo = Month(t)
d = Day(t)
h = Hour(t)
m = Minute(t)
s = Second(t)

sm = right("0" & m,2)
sm = cdbl(left(sm,1) & "9")

if cdbl(right(m,1)) = 9 then
	if (cdbl(s) > 49) then
	%>
<script language="javascript" type="text/javascript">
<!--
alert("本期投注截止时间已到，请等待下期，谢谢！");
window.location.href="epkjz.asp";
//-->
</script>
    <%
		Response.End()
	end if
end if

 %>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   tzlb=request("tzlb")
   tzsl=request("tzsl")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
   d9=rs("add9dqu")
   s2=rs("addsheng")
   s3=rs("addshi")
   q4=rs("addqu")
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")=0 or rs("pay")<10 or (tzsl+0)>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，一币不足，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("pay")=rs("pay")-tzsl
   rs.update
end if
%>
<%
Set rs_qi= Server.CreateObject("ADODB.Recordset")
sql_qi="select top 1 * from epkjdate where bz=0 order by kid desc" 
rs_qi.open sql_qi,conn7,2,3
if tzlb=1 then
   rs_qi("dan")=rs_qi("dan")+tzsl
   rs_qi.update
   tzxm="单"
elseif tzlb=2 then
   rs_qi("shuang")=rs_qi("shuang")+tzsl
   rs_qi.update
   tzxm="双"
elseif tzlb=3 then
   rs_qi("da")=rs_qi("da")+tzsl
   rs_qi.update
   tzxm="大"
elseif tzlb=4 then
   rs_qi("xiao")=rs_qi("xiao")+tzsl
   rs_qi.update
   tzxm="小"
end if
%>
<%
set rs_d0 = Server.CreateObject("ADODB.Recordset")
sql_d0 = "SELECT * FROM datepay"
rs_d0.open sql_d0,conn9,2,3
rs_d0.addnew
rs_d0("username")=rs("username")
rs_d0("regid")="竞猜投注-"&tzxm
rs_d0("jc")=tzsl
rs_d0("pay")=rs("pay")
rs_d0("jydb")=rs("jydb")
rs_d0("kjqi")=rs_qi("kid")
rs_d0.update
%>
<%
sql_tzlba="select * from eptzb where tzuser = '"&rs("username")&"' and tzlba="&tzlb&" " 
Set rs_tzlba= Server.CreateObject("ADODB.Recordset") 
rs_tzlba.open sql_tzlba,conn7,2,3
if not rs_tzlba.eof then
rs_tzlba("tzsla")=rs_tzlba("tzsla")+tzsl
rs_tzlba.update
else
set rs_dan = Server.CreateObject("ADODB.Recordset")
sql_dan = "SELECT * FROM eptzb"
rs_dan.open sql_dan,conn7,2,3
rs_dan.addnew
rs_dan("tzuser")=rs("username")
rs_dan("tzlba")=tzlb
rs_dan("tzsla")=tzsl
rs_dan.update
end if
%>
<%
set rs10=server.createobject("adodb.recordset")
  sql10="select * from gcuser where username = '"&rs("up")&"'"
  rs10.open sql10,conn2,2,3
if not rs10.eof then
  rs10("pay")=rs10("pay")+(0.02*tzsl)
  rs10("cbpay")=rs10("cbpay")+(0.02*tzsl)
  rs10.Update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("up")
rs_d1("regid")="一"&username&"竞猜-"&tzsl&""  
rs_d1("syjz")=0.02*tzsl
rs_d1("pay")=rs10("pay")
rs_d1("jydb")=rs10("jydb")
rs_d1.update
end if
%>
<%
set rs11=server.createobject("adodb.recordset")
  sql11="select * from gcuser where username = '"&rs10("up")&"'"
  rs11.open sql11,conn2,2,3
if not rs11.eof then
  rs11("pay")=rs11("pay")+(0.01*tzsl)
  rs11("cbpay")=rs11("cbpay")+(0.01*tzsl)
  rs11.Update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs10("up")
rs_d2("regid")="二"&username&"竞猜-"&tzsl&""
rs_d2("syjz")=0.01*tzsl
rs_d2("pay")=rs11("pay")
rs_d2("jydb")=rs11("jydb")
rs_d2.update
end if
%>
<% 
set rs12=server.createobject("adodb.recordset")
  sql12="select * from gcuser where username = '"&rs11("up")&"'"
  rs12.open sql12,conn2,2,3
if not rs12.eof then
  rs12("pay")=rs12("pay")+(0.005*tzsl)
  rs12("cbpay")=rs12("cbpay")+(0.005*tzsl)
  rs12.Update
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM datepay"
rs_d3.open sql_d3,conn9,2,3
rs_d3.addnew
rs_d3("username")=rs11("up")
rs_d3("regid")="三"&username&"竞猜-"&tzsl&""
rs_d3("syjz")=0.005*tzsl
rs_d3("pay")=rs12("pay")
rs_d3("jydb")=rs12("jydb")
rs_d3.update
end if
%>
<% 
set rs13=server.createobject("adodb.recordset")
  sql13="select * from gcuser where username = '"&rs12("up")&"'"
  rs13.open sql13,conn2,2,3
if not rs13.eof then
  rs13("pay")=rs13("pay")+(0.002*tzsl)
  rs13("cbpay")=rs13("cbpay")+(0.002*tzsl)
  rs13.Update
set rs_d4 = Server.CreateObject("ADODB.Recordset")
sql_d4 = "SELECT * FROM datepay"
rs_d4.open sql_d4,conn9,2,3
rs_d4.addnew
rs_d4("username")=rs12("up")
rs_d4("regid")="四"&username&"竞猜-"&tzsl&""
rs_d4("syjz")=0.002*tzsl
rs_d4("pay")=rs13("pay")
rs_d4("jydb")=rs13("jydb")
rs_d4.update
end if
%>
<% 
set rs14=server.createobject("adodb.recordset")
  sql14="select * from gcuser where username = '"&rs13("up")&"'"
  rs14.open sql14,conn2,2,3
if not rs14.eof then
  rs14("pay")=rs14("pay")+(0.001*tzsl)
  rs14("cbpay")=rs14("cbpay")+(0.001*tzsl)
  rs14.Update
set rs_d5 = Server.CreateObject("ADODB.Recordset")
sql_d5 = "SELECT * FROM datepay"
rs_d5.open sql_d5,conn9,2,3
rs_d5.addnew
rs_d5("username")=rs13("up")
rs_d5("regid")="五"&username&"竞猜-"&tzsl&""
rs_d5("syjz")=0.001*tzsl
rs_d5("pay")=rs14("pay")
rs_d5("jydb")=rs14("jydb")
rs_d5.update
end if
%>
<%
sql_q4="select * from gcuser where addqu='"&q4&"'and jb=4"
Set rs_q4= Server.CreateObject("ADODB.Recordset") 
rs_q4.open sql_q4,conn2,2,3
if not rs_q4.eof then
  rs_q4("qutj")=rs_q4("qutj")+(0.0005*tzsl)
  rs_q4("qupay")=rs_q4("qupay")+(0.0005*tzsl)
  rs_q4("dlpay")=rs_q4("dlpay")+(0.0005*tzsl)
  rs_q4.update
set rs_d6 = Server.CreateObject("ADODB.Recordset")
sql_d6 = "SELECT * FROM dldate"
rs_d6.open sql_d6,conn9,2,3
rs_d6.addnew
rs_d6("username")=rs_q4("username")
rs_d6("syjz")=0.0005*tzsl
rs_d6("pay")=rs_q4("qupay")
rs_d6("regid")="区内"&username&"竞猜-"&tzsl&""
rs_d6.update
end if
%>
<%
sql_s3="select * from gcuser where addshi='"&s3&"'and jb=3"
Set rs_s3= Server.CreateObject("ADODB.Recordset") 
rs_s3.open sql_s3,conn2,2,3
if not rs_s3.eof then
  rs_s3("shitj")=rs_s3("shitj")+(0.0002*tzsl)
  rs_s3("shipay")=rs_s3("shipay")+(0.0002*tzsl)
  rs_s3("dlpay")=rs_s3("dlpay")+(0.0002*tzsl)
  rs_s3.update
set rs_d7 = Server.CreateObject("ADODB.Recordset")
sql_d7 = "SELECT * FROM dldate"
rs_d7.open sql_d7,conn9,2,3
rs_d7.addnew
rs_d7("username")=rs_s3("username")
rs_d7("syjz")=0.0002*tzsl
rs_d7("pay")=rs_s3("shipay")
rs_d7("regid")="市内"&username&"竞猜-"&tzsl&""
rs_d7.update
end if
%>
<%
sql_s2="select * from gcuser where addsheng='"&s2&"'and jb=2"
Set rs_s2= Server.CreateObject("ADODB.Recordset") 
rs_s2.open sql_s2,conn2,2,3
if not rs_s2.eof then
  rs_s2("shengtj")=rs_s2("shengtj")+(0.0001*tzsl)
  rs_s2("shengpay")=rs_s2("shengpay")+(0.0001*tzsl)
  rs_s2("dlpay")=rs_s2("dlpay")+(0.0001*tzsl)
  rs_s2.update
set rs_d8 = Server.CreateObject("ADODB.Recordset")
sql_d8 = "SELECT * FROM dldate"
rs_d8.open sql_d8,conn9,2,3
rs_d8.addnew
rs_d8("username")=rs_s2("username")
rs_d8("syjz")=0.0001*tzsl
rs_d8("pay")=rs_s2("shengpay")
rs_d8("regid")="省内"&username&"竞猜-"&tzsl&""
rs_d8.update
end if
%>
<%
sql_9d="select * from gcuser where add9dqu='"&d9&"'and jb=1"
Set rs_9d= Server.CreateObject("ADODB.Recordset") 
rs_9d.open sql_9d,conn2,2,3
if not rs_9d.eof then
  rs_9d("dqutj")=rs_9d("dqutj")+(0.00005*tzsl)
  rs_9d("dqupay")=rs_9d("dqupay")+(0.00005*tzsl)
  rs_9d("dlpay")=rs_9d("dlpay")+(0.00005*tzsl)
  rs_9d.update
set rs_d9 = Server.CreateObject("ADODB.Recordset")
sql_d9 = "SELECT * FROM dldate"
rs_d9.open sql_d9,conn9,2,3
rs_d9.addnew
rs_d9("username")=rs_9d("username")
rs_d9("syjz")=0.00005*tzsl
rs_d9("pay")=rs_9d("dqupay")
rs_d9("regid")="大区内"&username&"竞猜-"&tzsl&""
rs_d9.update
end if
%>
<%
response.Write "<script language=javascript>alert('竞猜-["&tzxm&"-"&tzsl&"一币]-成功，请耐心等待开奖，祝君好运，游戏快乐！');location.replace('epjqks.asp');</script>"
%>