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
window.location.href="jfkjz.asp";
//-->
</script>
    <%
		Response.End()
	end if
end if

 %>
<!--#include file="../ct0618.asp"-->
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
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")=0 or rs("jyg")<10 or (tzsl+0)>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，积分不足，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-tzsl
   rs.update
end if
%>
<%
Set rs_qi= Server.CreateObject("ADODB.Recordset")
sql_qi="select top 1 * from jfkjdate where bz=0 order by kid desc" 
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
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("mcsl")=tzsl
rs_d1("sysl")=rs("jyg")
rs_d1("bz")="竞猜投注-"&tzxm
rs_d1("kjqi")=rs_qi("kid")
rs_d1("jy")=1
rs_d1("abdate")=abcd
rs_d1("cgdate")=Now()
rs_d1.update
%>
<%
sql_tzlba="select * from jftzb where tzuser = '"&rs("username")&"' and tzlba="&tzlb&" " 
Set rs_tzlba= Server.CreateObject("ADODB.Recordset") 
rs_tzlba.open sql_tzlba,conn7,2,3
if not rs_tzlba.eof then
rs_tzlba("tzsla")=rs_tzlba("tzsla")+tzsl
rs_tzlba.update
else
set rs_dan = Server.CreateObject("ADODB.Recordset")
sql_dan = "SELECT * FROM jftzb"
rs_dan.open sql_dan,conn7,2,3
rs_dan.addnew
rs_dan("tzuser")=rs("username")
rs_dan("tzlba")=tzlb
rs_dan("tzsla")=tzsl
rs_dan.update
end if
%>
<%
response.Write "<script language=javascript>alert('竞猜-["&tzxm&"-"&tzsl&"积分]-成功，请耐心等待开奖，祝君好运，游戏快乐！');location.replace('jfjqks.asp');</script>"
%>