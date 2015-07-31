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
alert("Current betting deadline is up, please wait for the next period, thank you!");
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
   response.write "alert('Account number or password is incorrect!');"
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
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")=0 or rs("pay")<10 or (tzsl+0)>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, a currency shortage, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("pay")=rs("pay")-tzsl
   rs("vippay")=rs("vippay")-tzsl
   rs("fhpay")=rs("fhpay")-tzsl
   rs("txpay")=rs("txpay")+tzsl
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
   tzxm="µ¥"
elseif tzlb=2 then
   rs_qi("shuang")=rs_qi("shuang")+tzsl
   rs_qi.update
   tzxm="Ë«"
elseif tzlb=3 then
   rs_qi("da")=rs_qi("da")+tzsl
   rs_qi.update
   tzxm="´ó"
elseif tzlb=4 then
   rs_qi("xiao")=rs_qi("xiao")+tzsl
   rs_qi.update
   tzxm="Ð¡"
end if
%>
<%
if rs("vippay")<0 then
   rs("vippay")=0
   rs.update
end if
if rs("fhpay")<0 then
   rs("fhpay")=0
   rs.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("regid")="Guess Bets-"&tzxm
rs_d1("jc")=tzsl
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("kjqi")=rs_qi("kid")
rs_d1.update
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
response.Write "<script language=javascript>alert('Guess-["&tzxm&"-"&tzsl&"A currency]-Success, please be patient lottery, best of luck, happy gaming!');location.replace('epjqks.asp');</script>"
%>