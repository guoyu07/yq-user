<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   myup=request("up")
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM gcuser where username = '"&myup&"'"
rs_my.open sql_my,conn2,1,1
if rs_my.eof and rs_my.bof then
   response.Write "<script language=javascript>alert('This username does not exist, please try again after checking!');history.go(-1);</script>"
   response.end
elseif rs_my("sjb")=0 then
   response.Write "<script language=javascript>alert('Not a dual-zone game users, please contact the appropriate position to recommend people choose to upgrade!');location.href='tgdown.asp';</script>"
   response.end
end if
%>
<%
if username<>myup then
set rs_zuo = Server.CreateObject("ADODB.Recordset")
sql_zuo="select * from zuo_mingxi where tjuser ='"&username&"' and down = '" &myup&"'"
rs_zuo.open sql_zuo,conn7,1,1
if rs_zuo.eof and rs_zuo.bof then
set rs_you = Server.CreateObject("ADODB.Recordset")
sql_you="select * from you_mingxi where tjuser ='"&username&"' and down = '" &myup&"'"
rs_you.open sql_you,conn7,1,1
if rs_you.eof and rs_you.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Enter the user name wrong or not his own team's players, please try again after checking!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
end if
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxt where username = '"&myup&"'"
rs.open sql,conn7,1,1
   rscfd=rs("cfd")
   rssjb=rs("sjb")
   rszaq=rs("zaq")
   rszbq=rs("zbq")
if rs("auid")<>"" then
   rsauid=rs("auid")
set rs21 = Server.CreateObject("ADODB.Recordset")
sql21 = "SELECT * FROM sgxt where username = '"&rs("auid")&"'"
rs21.open sql21,conn7,1,1
    rs21auid=rs21("auid")
    rs21buid=rs21("buid")
if rs("buid")<>"" then
    rsbuid=rs("buid")
set rs22 = Server.CreateObject("ADODB.Recordset")
sql22 = "SELECT * FROM sgxt where username = '"&rs("buid")&"'"
rs22.open sql22,conn7,1,1
    rs22auid=rs22("auid")
    rs22buid=rs22("buid")
end if
end if
%>
<%
if rs21auid<>"" then
set rs31 = Server.CreateObject("ADODB.Recordset")
sql31 = "SELECT * FROM sgxt where username = '"&rs21auid&"'"
rs31.open sql31,conn7,1,1
    rs31auid=rs31("auid")
    rs31buid=rs31("buid")
end if
%>
<%
if rs21buid<>"" then
set rs32 = Server.CreateObject("ADODB.Recordset")
sql32 = "SELECT * FROM sgxt where username = '"&rs21buid&"'"
rs32.open sql32,conn7,1,1
    rs32auid=rs32("auid")
    rs32buid=rs32("buid")
end if
%>
<%
if rs22auid<>"" then
set rs33 = Server.CreateObject("ADODB.Recordset")
sql33 = "SELECT * FROM sgxt where username = '"&rs22auid&"'"
rs33.open sql33,conn7,1,1
    rs33auid=rs33("auid")
    rs33buid=rs33("buid")
end if
%>
<%
if rs22buid<>"" then
set rs34 = Server.CreateObject("ADODB.Recordset")
sql34 = "SELECT * FROM sgxt where username = '"&rs22buid&"'"
rs34.open sql34,conn7,1,1
    rs34auid=rs34("auid")
    rs34buid=rs34("buid")
end if
%>
<%
if rsauid<>"" then
set rsa = Server.CreateObject("ADODB.Recordset")
sqla = "SELECT * FROM sgxt where username = '"&rsauid&"'"
rsa.open sqla,conn7,1,1
rsasjb=rsa("sjb")
rsazaq=rsa("zaq")
rsazbq=rsa("zbq")
end if
%>
<%
if rsbuid<>"" then
set rsb = Server.CreateObject("ADODB.Recordset")
sqlb = "SELECT * FROM sgxt where username = '"&rsbuid&"'"
rsb.open sqlb,conn7,1,1
rsbsjb=rsb("sjb")
rsbzaq=rsb("zaq")
rsbzbq=rsb("zbq")
end if
%>
<%
if rs21auid<>"" then
set rs21a = Server.CreateObject("ADODB.Recordset")
sql21a = "SELECT * FROM sgxt where username = '"&rs21auid&"'"
rs21a.open sql21a,conn7,1,1
rs21asjb=rs21a("sjb")
rs21azaq=rs21a("zaq")
rs21azbq=rs21a("zbq")
end if
%>
<%
if rs21buid<>"" then
set rs21b = Server.CreateObject("ADODB.Recordset")
sql21b = "SELECT * FROM sgxt where username = '"&rs21buid&"'"
rs21b.open sql21b,conn7,1,1
rs21bsjb=rs21b("sjb")
rs21bzaq=rs21b("zaq")
rs21bzbq=rs21b("zbq")
end if
%>
<%
if rs22auid<>"" then
set rs22a = Server.CreateObject("ADODB.Recordset")
sql22a = "SELECT * FROM sgxt where username = '"&rs22auid&"'"
rs22a.open sql22a,conn7,1,1
rs22asjb=rs22a("sjb")
rs22azaq=rs22a("zaq")
rs22azbq=rs22a("zbq")
end if
%>
<%
if rs22buid<>"" then
set rs22b = Server.CreateObject("ADODB.Recordset")
sql22b = "SELECT * FROM sgxt where username = '"&rs22buid&"'"
rs22b.open sql22b,conn7,1,1
rs22bsjb=rs22b("sjb")
rs22bzaq=rs22b("zaq")
rs22bzbq=rs22b("zbq")
end if
%>
<%
if rs31auid<>"" then
set rs31a = Server.CreateObject("ADODB.Recordset")
sql31a = "SELECT * FROM sgxt where username = '"&rs31auid&"'"
rs31a.open sql31a,conn7,1,1
rs31asjb=rs31a("sjb")
end if
%>
<%
if rs31buid<>"" then
set rs31b = Server.CreateObject("ADODB.Recordset")
sql31b = "SELECT * FROM sgxt where username = '"&rs31buid&"'"
rs31b.open sql31b,conn7,1,1
rs31bsjb=rs31b("sjb")
end if
%>
<%
if rs32auid<>"" then
set rs32a = Server.CreateObject("ADODB.Recordset")
sql32a = "SELECT * FROM sgxt where username = '"&rs32auid&"'"
rs32a.open sql32a,conn7,1,1
rs32asjb=rs32a("sjb")
end if
%>
<%
if rs32buid<>"" then
set rs32b = Server.CreateObject("ADODB.Recordset")
sql32b = "SELECT * FROM sgxt where username = '"&rs32buid&"'"
rs32b.open sql32b,conn7,1,1
rs32bsjb=rs32b("sjb")
end if
%>
<%
if rs33auid<>"" then
set rs33a = Server.CreateObject("ADODB.Recordset")
sql33a = "SELECT * FROM sgxt where username = '"&rs33auid&"'"
rs33a.open sql33a,conn7,1,1
rs33asjb=rs33a("sjb")
end if
%>
<%
if rs33buid<>"" then
set rs33b = Server.CreateObject("ADODB.Recordset")
sql33b = "SELECT * FROM sgxt where username = '"&rs33buid&"'"
rs33b.open sql33b,conn7,1,1
rs33bsjb=rs33b("sjb")
end if
%>
<%
if rs34auid<>"" then
set rs34a = Server.CreateObject("ADODB.Recordset")
sql34a = "SELECT * FROM sgxt where username = '"&rs34auid&"'"
rs34a.open sql34a,conn7,1,1
rs34asjb=rs34a("sjb")
end if
%>
<%
if rs34buid<>"" then
set rs34b = Server.CreateObject("ADODB.Recordset")
sql34b = "SELECT * FROM sgxt where username = '"&rs34buid&"'"
rs34b.open sql34b,conn7,1,1
rs34bsjb=rs34b("sjb")
end if
%>
<%
sql_z1="select sum(sjb) as z1 from zuo_mingxi where tjuser='"&myup&"' and count=1" 
Set rs_z1= Server.CreateObject("ADODB.Recordset") 
rs_z1.open sql_z1,conn7,1,1
%>
<%
sql_y1="select sum(sjb) as y1 from you_mingxi where tjuser='"&myup&"' and count=1" 
Set rs_y1= Server.CreateObject("ADODB.Recordset") 
rs_y1.open sql_y1,conn7,1,1
%>
<%
sql_z2="select sum(sjb) as z2 from zuo_mingxi where tjuser='"&myup&"' and count=2" 
Set rs_z2= Server.CreateObject("ADODB.Recordset") 
rs_z2.open sql_z2,conn7,1,1
%>
<%
sql_y2="select sum(sjb) as y2 from you_mingxi where tjuser='"&myup&"' and count=2" 
Set rs_y2= Server.CreateObject("ADODB.Recordset") 
rs_y2.open sql_y2,conn7,1,1
%>
<%
sql_z3="select sum(sjb) as z3 from zuo_mingxi where tjuser='"&myup&"' and count=3" 
Set rs_z3= Server.CreateObject("ADODB.Recordset") 
rs_z3.open sql_z3,conn7,1,1
%>
<%
sql_y3="select sum(sjb) as y3 from you_mingxi where tjuser='"&myup&"' and count=3" 
Set rs_y3= Server.CreateObject("ADODB.Recordset") 
rs_y3.open sql_y3,conn7,1,1
%>
<%
sql_z4="select sum(sjb) as z4 from zuo_mingxi where tjuser='"&myup&"' and count=4" 
Set rs_z4= Server.CreateObject("ADODB.Recordset") 
rs_z4.open sql_z4,conn7,1,1
%>
<%
sql_y4="select sum(sjb) as y4 from you_mingxi where tjuser='"&myup&"' and count=4" 
Set rs_y4= Server.CreateObject("ADODB.Recordset") 
rs_y4.open sql_y4,conn7,1,1
%>
<%
sql_z5="select sum(sjb) as z5 from zuo_mingxi where tjuser='"&myup&"' and count=5" 
Set rs_z5= Server.CreateObject("ADODB.Recordset") 
rs_z5.open sql_z5,conn7,1,1
%>
<%
sql_y5="select sum(sjb) as y5 from you_mingxi where tjuser='"&myup&"' and count=5" 
Set rs_y5= Server.CreateObject("ADODB.Recordset") 
rs_y5.open sql_y5,conn7,1,1
%>
<%
sql_z6="select sum(sjb) as z6 from zuo_mingxi where tjuser='"&myup&"' and count=6" 
Set rs_z6= Server.CreateObject("ADODB.Recordset") 
rs_z6.open sql_z6,conn7,1,1
%>
<%
sql_y6="select sum(sjb) as y6 from you_mingxi where tjuser='"&myup&"' and count=6" 
Set rs_y6= Server.CreateObject("ADODB.Recordset") 
rs_y6.open sql_y6,conn7,1,1
%>
<%
sql_z7="select sum(sjb) as z7 from zuo_mingxi where tjuser='"&myup&"' and count=7" 
Set rs_z7= Server.CreateObject("ADODB.Recordset") 
rs_z7.open sql_z7,conn7,1,1
%>
<%
sql_y7="select sum(sjb) as y7 from you_mingxi where tjuser='"&myup&"' and count=7" 
Set rs_y7= Server.CreateObject("ADODB.Recordset") 
rs_y7.open sql_y7,conn7,1,1
%>
<%
sql_z8="select sum(sjb) as z8 from zuo_mingxi where tjuser='"&myup&"' and count=8" 
Set rs_z8= Server.CreateObject("ADODB.Recordset") 
rs_z8.open sql_z8,conn7,1,1
%>
<%
sql_y8="select sum(sjb) as y8 from you_mingxi where tjuser='"&myup&"' and count=8" 
Set rs_y8= Server.CreateObject("ADODB.Recordset") 
rs_y8.open sql_y8,conn7,1,1
%>
<%
sql_z9="select sum(sjb) as z9 from zuo_mingxi where tjuser='"&myup&"' and count=9" 
Set rs_z9= Server.CreateObject("ADODB.Recordset") 
rs_z9.open sql_z9,conn7,1,1
%>
<%
sql_y9="select sum(sjb) as y9 from you_mingxi where tjuser='"&myup&"' and count=9" 
Set rs_y9= Server.CreateObject("ADODB.Recordset") 
rs_y9.open sql_y9,conn7,1,1
%>
<%
sql_z10="select sum(sjb) as z10 from zuo_mingxi where tjuser='"&myup&"' and count=10" 
Set rs_z10= Server.CreateObject("ADODB.Recordset") 
rs_z10.open sql_z10,conn7,1,1
%>
<%
sql_y10="select sum(sjb) as y10 from you_mingxi where tjuser='"&myup&"' and count=10" 
Set rs_y10= Server.CreateObject("ADODB.Recordset") 
rs_y10.open sql_y10,conn7,1,1
%>
<%
sql_z11="select sum(sjb) as z11 from zuo_mingxi where tjuser='"&myup&"' and count=11" 
Set rs_z11= Server.CreateObject("ADODB.Recordset") 
rs_z11.open sql_z11,conn7,1,1
%>
<%
sql_y11="select sum(sjb) as y11 from you_mingxi where tjuser='"&myup&"' and count=11" 
Set rs_y11= Server.CreateObject("ADODB.Recordset") 
rs_y11.open sql_y11,conn7,1,1
%>
<%
sql_z12="select sum(sjb) as z12 from zuo_mingxi where tjuser='"&myup&"' and count=12" 
Set rs_z12= Server.CreateObject("ADODB.Recordset") 
rs_z12.open sql_z12,conn7,1,1
%>
<%
sql_y12="select sum(sjb) as y12 from you_mingxi where tjuser='"&myup&"' and count=12" 
Set rs_y12= Server.CreateObject("ADODB.Recordset") 
rs_y12.open sql_y12,conn7,1,1
%>
<%
sql_z13="select sum(sjb) as z13 from zuo_mingxi where tjuser='"&myup&"' and count=13" 
Set rs_z13= Server.CreateObject("ADODB.Recordset") 
rs_z13.open sql_z13,conn7,1,1
%>
<%
sql_y13="select sum(sjb) as y13 from you_mingxi where tjuser='"&myup&"' and count=13" 
Set rs_y13= Server.CreateObject("ADODB.Recordset") 
rs_y13.open sql_y13,conn7,1,1
%>
<%
sql_z14="select sum(sjb) as z14 from zuo_mingxi where tjuser='"&myup&"' and count=14" 
Set rs_z14= Server.CreateObject("ADODB.Recordset") 
rs_z14.open sql_z14,conn7,1,1
%>
<%
sql_y14="select sum(sjb) as y14 from you_mingxi where tjuser='"&myup&"' and count=14" 
Set rs_y14= Server.CreateObject("ADODB.Recordset") 
rs_y14.open sql_y14,conn7,1,1
%>
<%
sql_z15="select sum(sjb) as z15 from zuo_mingxi where tjuser='"&myup&"' and count=15" 
Set rs_z15= Server.CreateObject("ADODB.Recordset") 
rs_z15.open sql_z15,conn7,1,1
%>
<%
sql_y15="select sum(sjb) as y15 from you_mingxi where tjuser='"&myup&"' and count=15" 
Set rs_y15= Server.CreateObject("ADODB.Recordset") 
rs_y15.open sql_y15,conn7,1,1
%>
<%
sql_z16="select sum(sjb) as z16 from zuo_mingxi where tjuser='"&myup&"' and count=16" 
Set rs_z16= Server.CreateObject("ADODB.Recordset") 
rs_z16.open sql_z16,conn7,1,1
%>
<%
sql_y16="select sum(sjb) as y16 from you_mingxi where tjuser='"&myup&"' and count=16" 
Set rs_y16= Server.CreateObject("ADODB.Recordset") 
rs_y16.open sql_y16,conn7,1,1
%>
<HTML>
<title>Game business - Query</title>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<BODY bgcolor="#FFFFFF" style="text-align: center" >
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">Personal information</A> </LI>
  <LI><a target="main" href="downtj.asp" style="text-decoration: none">Network Query</A> </LI>
  <LI><a target="main" href="mzff.asp" style="text-decoration: none">Financial Management</A> </LI>
  <LI><A>Message Management</A></LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">Exit the System</A> </LI>
</UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>Current position:<SPAN id=mTitle>Home</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:center">
	<div align="center">
	<table border="0" width="65%" id="table2" height="100">
	<tr>
	<td colspan="4" align="center" height="25">
	<table border="0" width="100%" id="table3">
	<tr>
	<td align="center" width="42%"><p align="left"><span style="font-size: 11pt">Current query Username:<b><font color="#FF0000"><%=myup%></font></b></span></td>
	<td align="center"><p align="left">　</td>
	<td align="center" width="35%"><p align="left"><span style="font-size: 11pt; font-weight:700"><a href="sgks01.asp?up=<%=username%>"><font color="#008000">Return to yourself:<%=username%></font></a></span></td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">Grand total</font></b></td>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">Upcoming settlement</font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="25">Left area</td>
			<td align="center" bgcolor="#FFFF97" height="25">Right area</td>
			<td align="center" bgcolor="#FFDDBB" height="25">Left area</td>
			<td align="center" bgcolor="#FFDDBB" height="25">Right area</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="26"><font color="#FF0000"><%=rs("zaq")%></font></td>
			<td align="center" bgcolor="#FFFF97" height="26"><font color="#FF0000"><%=rs("zbq")%></font></td>
			<td align="center" bgcolor="#FFDDBB" height="26"><font color="#FF0000"><%=rs("aq")%></font></td>
			<td align="center" bgcolor="#FFDDBB" height="26"><font color="#FF0000"><%=rs("bq")%></font></td>
		</tr>
	</table>
	<form method="POST" action="sgks01.asp" name="Form">
		<table border="0" width="65%" id="table5" height="30" bgcolor="#FFFFFF">
			<tr>
				<td width="80"><p align="center"><font size="2">Username:</font></td>
				<td width="132"><input type="text" name="up" size="15"></td>
				<td width="130"><input type="submit" value="Find the contact person" name="B1"></td>
				<td><p align="left"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="3">Back to Previous Page</font></a></p></td>
			</tr>
		</table>
	</form>
	<table border="0" width="65%" id="table4" height="535">
		<tr>
			<td align="center" bgcolor="#E9FFD2" colspan="4"><b><font size="2" color="#008000">(<%=myup%>)</font><font size="2" color="#FF0000">Within the current three-tier distribution</font></b></td>
			<td align="center" bgcolor="#FFE888" colspan="4"><b><font size="2" color="#008000">(<%=myup%>)</font><font size="2" color="#FF0000">The current 16 floors inner cap situation</font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#E9FFD2"><b>Coefficient</b></td>
			<td bgcolor="#E9FFD2"><b>User name</b></td>
			<td bgcolor="#E9FFD2"><b>Left total</b></td>
			<td bgcolor="#E9FFD2"><b>Right total</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>Layers</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>Left total</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>Right total</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>Zonal</b></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-1</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" face="宋体"><%if rsauid<>"" then%><a href="sgks01.asp?up=<%=rsauid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rsauid%>（<%=rsasjb%>）</a><%else%><a href="sgreg.asp?up=<%=myup%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsazaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsazaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsazbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsazbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>One</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z1("z1")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y1("y1")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-2</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" face="宋体"><%if rsbuid<>"" then%><a href="sgks01.asp?up=<%=rsbuid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rsbuid%>（<%=rsbsjb%>）</a><%else%><a href="sgreg.asp?up=<%=myup%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsbzaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsbzaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsbzbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsbzbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>Two</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z2("z2")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y2("y2")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-1</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs21auid<>"" then%><a href="sgks01.asp?up=<%=rs21auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs21auid%>（<%=rs21asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsauid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21azaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21azaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21azbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21azbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>Three</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z3("z3")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y3("y3")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-2</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs21buid<>"" then%><a href="sgks01.asp?up=<%=rs21buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs21buid%>（<%=rs21bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsauid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21bzaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21bzaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21bzbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21bzbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>Four</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z4("z4")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y4("y4")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-3</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs22auid<>"" then%><a href="sgks01.asp?up=<%=rs22auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs22auid%>（<%=rs22asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22azaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22azaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22azbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22azbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>Five</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z5("z5")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y5("y5")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-4</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs22buid<>"" then%><a href="sgks01.asp?up=<%=rs22buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs22buid%>（<%=rs22bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22bzaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22bzaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22bzbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22bzbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>Six</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z6("z6")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y6("y6")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-1</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs31auid<>"" then%><a href="sgks01.asp?up=<%=rs31auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs31auid%>（<%=rs31asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Seven</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z7("z7")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y7("y7")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-2</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs31buid<>"" then%><a href="sgks01.asp?up=<%=rs31buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs31buid%>（<%=rs31bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Eight</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z8("z8")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y8("y8")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-3</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs32auid<>"" then%><a href="sgks01.asp?up=<%=rs32auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs32auid%>（<%=rs32asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Nine</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z9("z9")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y9("y9")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-4</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs32buid<>"" then%><a href="sgks01.asp?up=<%=rs32buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs32buid%>（<%=rs32bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Ten</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z10("z10")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y10("y10")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-5</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs33auid<>"" then%><a href="sgks01.asp?up=<%=rs33auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs33auid%>（<%=rs33asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Eleven</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z11("z11")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y11("y11")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-6</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs33buid<>"" then%><a href="sgks01.asp?up=<%=rs33buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs33buid%>（<%=rs33bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Twelve</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z12("z12")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y12("y12")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-7</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs34auid<>"" then%><a href="sgks01.asp?up=<%=rs34auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs34auid%>（<%=rs34asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Thirteen</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z13("z13")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y13("y13")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-8</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs34buid<>"" then%><a href="sgks01.asp?up=<%=rs34buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs34buid%>（<%=rs34bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&bd=<%=bdid%>" style="text-decoration: none">Select vacancies</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>Fourteen</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z14("z14")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y14("y14")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF">3 layers within the current left and right total refers to the total under the user name is the cumulative total of all singular network</font></td>
			<td align="center" bgcolor="#FFF2BF"><b>Fifteen</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z15("z15")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y15("y15")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF">The 16 refers to the current layer is</font><b><font size="2" color="#008000">(<%=myup%>)</font></b><font color="#0000FF">Layers of left and right singular current total</font></td>
			<td align="center" bgcolor="#FFF2BF"><b>Sixteen</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_z16("z16")%></td>
			<td align="center" bgcolor="#FFF2BF"><%=rs_y16("y16")%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
	</table>
	<p>　</div>
	<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">Back to Previous Page</font></a></p>
</div></div>
</BODY>
</HTML>