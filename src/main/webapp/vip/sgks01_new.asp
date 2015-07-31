<!--#include file="../mq0618.asp"-->
<%
'if request.cookies("regid")="" or request.cookies("password")="" then
   'response.write "<script language='javascript'>"
   'response.write "alert('账号或密码错误！');"
   'response.write "history.go(-1);"
   'response.write "</script>"
   'response.end
'else
   'username=request.cookies("regid")
   'password=request.cookies("password")
   myup=request("up")
'end if
%>
<%
'if username<>myup then
'sql_zuo="select * from zuo_mingxi where tjuser ='"&username&"' and down = '" &myup&"'"
'set rs_zuo =conn7.execute(sql_zuo)
'if rs_zuo.eof and rs_zuo.bof then
'sql_you="select * from you_mingxi where tjuser ='"&username&"' and down = '" &myup&"'"
'set rs_you =conn7.execute(sql_you)
'if rs_you.eof and rs_you.bof then
'   response.write "<script language='javascript'>"
'   response.write "alert('用户名输入错误或不属于自己团队的玩家，请检查后再试！');"
'   response.write "history.go(-1);"
'   response.write "</script>"
'   response.end
'end if
'rs_zuo.close()
'set rs_zuo=Nothing
'rs_you.close()
'set rs_you=Nothing
'end if
'end if
%>
<%
sql = "SELECT * FROM sgxt where username = '"&myup&"'"
set rs = conn7.execute(sql)
   rscfd=rs("cfd")
   rssjb=rs("sjb")
   rszaq=rs("zaq")
   rszbq=rs("zbq")
   aaq=rs("aq")
   abq=rs("bq")
   z1ab=rs("1z")
   y1ab=rs("1y")
   z2ab=rs("2z")
   y2ab=rs("2y")
   z3ab=rs("3z")
   y3ab=rs("3y")
   z4ab=rs("4z")
   y4ab=rs("4y")
   z5ab=rs("5z")
   y5ab=rs("5y")
   z6ab=rs("6z")
   y6ab=rs("6y")
   z7ab=rs("7z")
   y7ab=rs("7y")
   z8ab=rs("8z")
   y8ab=rs("8y")
   z9ab=rs("9z")
   y9ab=rs("9y")
   z10ab=rs("10z")
   y10ab=rs("10y")
   z11ab=rs("11z")
   y11ab=rs("11y")
   z12ab=rs("12z")
   y12ab=rs("12y")
   z13ab=rs("13z")
   y13ab=rs("13y")
   z14ab=rs("14z")
   y14ab=rs("14y")
   z15ab=rs("15z")
   y15ab=rs("15y")
   z16ab=rs("16z")
   y16ab=rs("16y")
if rs("auid")<>"" then
   rsauid=rs("auid")
sql21 = "SELECT * FROM sgxt where username = '"&rs("auid")&"'"
set rs21 = conn7.execute(sql21)
    rs21auid=rs21("auid")
    rs21buid=rs21("buid")
    rs21.close()
    set rs21=Nothing
if rs("buid")<>"" then
    rsbuid=rs("buid")
sql22 = "SELECT * FROM sgxt where username = '"&rs("buid")&"'"
set rs22 = conn7.execute(sql22)
    rs22auid=rs22("auid")
    rs22buid=rs22("buid")
    rs22.close()
    set rs22=Nothing
end if
end if
rs.close()
set rs=Nothing
%>
<%
if rs21auid<>"" then
sql31 = "SELECT * FROM sgxt where username = '"&rs21auid&"'"
set rs31 = conn7.execute(sql31)
    rs31auid=rs31("auid")
    rs31buid=rs31("buid")
rs31.close()
set rs31=Nothing    
end if
%>
<%
if rs21buid<>"" then
sql32 = "SELECT * FROM sgxt where username = '"&rs21buid&"'"
set rs32 = conn7.execute(sql32)
    rs32auid=rs32("auid")
    rs32buid=rs32("buid")
rs32.close()
set rs32=Nothing    
end if
%>
<%
if rs22auid<>"" then
sql33 = "SELECT * FROM sgxt where username = '"&rs22auid&"'"
set rs33 = conn7.execute(sql33)
    rs33auid=rs33("auid")
    rs33buid=rs33("buid")
rs33.close()
set rs33=Nothing    
end if
%>
<%
if rs22buid<>"" then
sql34 = "SELECT * FROM sgxt where username = '"&rs22buid&"'"
set rs34 = conn7.execute(sql34)
    rs34auid=rs34("auid")
    rs34buid=rs34("buid")
rs34.close()
set rs34=Nothing    
end if
%>
<%
if rsauid<>"" then
sqla = "SELECT * FROM sgxt where username = '"&rsauid&"'"
set rsa = conn7.execute(sqla)
rsasjb=rsa("sjb")
rsazaq=rsa("zaq")
rsazbq=rsa("zbq")
rsa.close()
set rsa=Nothing
end if
%>
<%
if rsbuid<>"" then
sqlb = "SELECT * FROM sgxt where username = '"&rsbuid&"'"
set rsb = conn7.execute(sqlb)
rsbsjb=rsb("sjb")
rsbzaq=rsb("zaq")
rsbzbq=rsb("zbq")
rsb.close()
set rsb=Nothing
end if
%>
<%
if rs21auid<>"" then
sql21a = "SELECT * FROM sgxt where username = '"&rs21auid&"'"
set rs21a = conn7.execute(sql21a)
rs21asjb=rs21a("sjb")
rs21azaq=rs21a("zaq")
rs21azbq=rs21a("zbq")
rs21a.close()
set rs21a=Nothing
end if
%>
<%
if rs21buid<>"" then
sql21b = "SELECT * FROM sgxt where username = '"&rs21buid&"'"
set rs21b = conn7.execute(sql21b)
rs21bsjb=rs21b("sjb")
rs21bzaq=rs21b("zaq")
rs21bzbq=rs21b("zbq")
rs21b.close()
set rs21b=Nothing
end if
%>
<%
if rs22auid<>"" then
sql22a = "SELECT * FROM sgxt where username = '"&rs22auid&"'"
set rs22a = conn7.execute(sql22a)
rs22asjb=rs22a("sjb")
rs22azaq=rs22a("zaq")
rs22azbq=rs22a("zbq")
rs22a.close()
set rs22a=Nothing
end if
%>
<%
if rs22buid<>"" then
sql22b = "SELECT * FROM sgxt where username = '"&rs22buid&"'"
set rs22b = conn7.execute(sql22b)
rs22bsjb=rs22b("sjb")
rs22bzaq=rs22b("zaq")
rs22bzbq=rs22b("zbq")
rs22b.close()
set rs22b=Nothing
end if
%>
<%
if rs31auid<>"" then
sql31a = "SELECT * FROM sgxt where username = '"&rs31auid&"'"
set rs31a = conn7.execute(sql31a)
rs31asjb=rs31a("sjb")
rs31a.close()
set rs31a=Nothing
end if
%>
<%
if rs31buid<>"" then
sql31b = "SELECT * FROM sgxt where username = '"&rs31buid&"'"
set rs31b = conn7.execute(sql31b)
rs31bsjb=rs31b("sjb")
rs31b.close()
set rs31b=Nothing
end if
%>
<%
if rs32auid<>"" then
sql32a = "SELECT * FROM sgxt where username = '"&rs32auid&"'"
set rs32a = conn7.execute(sql32a)
rs32asjb=rs32a("sjb")
rs32a.close()
set rs32a=Nothing
end if
%>
<%
if rs32buid<>"" then
sql32b = "SELECT * FROM sgxt where username = '"&rs32buid&"'"
set rs32b = conn7.execute(sql32b)
rs32bsjb=rs32b("sjb")
rs32b.close()
set rs32b=Nothing
end if
%>
<%
if rs33auid<>"" then
sql33a = "SELECT * FROM sgxt where username = '"&rs33auid&"'"
set rs33a = conn7.execute(sql33a)
rs33asjb=rs33a("sjb")
rs33a.close()
set rs33a=Nothing
end if
%>
<%
if rs33buid<>"" then
sql33b = "SELECT * FROM sgxt where username = '"&rs33buid&"'"
set rs33b = conn7.execute(sql33b)
rs33bsjb=rs33b("sjb")
rs33b.close()
set rs33b=Nothing
end if
%>
<%
if rs34auid<>"" then
sql34a = "SELECT * FROM sgxt where username = '"&rs34auid&"'"
set rs34a = conn7.execute(sql34a)
rs34asjb=rs34a("sjb")
rs34a.close()
set rs34a=Nothing
end if
%>
<%
if rs34buid<>"" then
sql34b = "SELECT * FROM sgxt where username = '"&rs34buid&"'"
set rs34b = conn7.execute(sql34b)
rs34bsjb=rs34b("sjb")
rs34b.close()
set rs34b=Nothing
end if
%>
<%
conn7.close()
set conn7=nothing
%>
<HTML>
<title>游戏业务-查询</title>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>
<BODY bgcolor="#FFFFFF" style="text-align: center" >
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">个人信息</A> </LI>
  <LI><a target="main" href="downtj.asp" style="text-decoration: none">网络查询</A> </LI>
  <LI><a target="main" href="mzff.asp" style="text-decoration: none">财务管理</A> </LI>
  <LI><A>消息管理</A></LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">退出系统</A> </LI>
</UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:center">
	<div align="center">
	<table border="0" width="65%" id="table2" height="100">
	<tr>
	<td colspan="4" align="center" height="25">
	<table border="0" width="100%" id="table3">
	<tr>
	<td align="center" width="42%"><p align="left"><span style="font-size: 11pt">当前查询用户名：<b><font color="#FF0000"><%=myup%></font></b></span></td>
	<td align="center"><p align="left">　</td>
	<td align="center" width="35%"><p align="left"><span style="font-size: 11pt; font-weight:700"><a href="sgks01.asp?up=<%=username%>"><font color="#008000">返回自己：<%=username%></font></a></span></td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">累计</font></b></td>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">即将结算</font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="25">左区</td>
			<td align="center" bgcolor="#FFFF97" height="25">右区</td>
			<td align="center" bgcolor="#FFDDBB" height="25">左区</td>
			<td align="center" bgcolor="#FFDDBB" height="25">右区</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="26"><font color="#FF0000"><%=rszaq%></font></td>
			<td align="center" bgcolor="#FFFF97" height="26"><font color="#FF0000"><%=rszbq%></font></td>
			<td align="center" bgcolor="#FFDDBB" height="26"><font color="#FF0000"><%=aaq%></font></td>
			<td align="center" bgcolor="#FFDDBB" height="26"><font color="#FF0000"><%=abq%></font></td>
		</tr>
	</table>
	<form method="POST" action="sgks01.asp" name="Form">
		<table border="0" width="65%" id="table5" height="30" bgcolor="#FFFFFF">
			<tr>
				<td width="80"><p align="center"><font size="2">用户名：</font></td>
				<td width="132"><input type="text" name="up" size="15"></td>
				<td width="130"><input type="submit" value="查找接点人" name="B1"></td>
				<td><p align="left"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="3">返回上一页</font></a></p></td>
			</tr>
		</table>
	</form>
	<table border="0" width="65%" id="table4" height="535">
		<tr>
			<td align="center" bgcolor="#E9FFD2" colspan="4"><b><font size="2" color="#008000">(<%=myup%>)</font><font size="2" color="#FF0000">当前3层内分布情况</font></b></td>
			<td align="center" bgcolor="#FFE888" colspan="4"><b><font size="2" color="#008000">(<%=myup%>)</font><font size="2" color="#FF0000">当前十六层内层封顶情况</font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#E9FFD2"><b>系数</b></td>
			<td bgcolor="#E9FFD2"><b>用户名</b></td>
			<td bgcolor="#E9FFD2"><b>左总</b></td>
			<td bgcolor="#E9FFD2"><b>右总</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>层数</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>左总</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>右总</b></td>
			<td align="center" bgcolor="#FFF2BF"><b>层封</b></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-1</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" face="宋体"><%if rsauid<>"" then%><a href="sgks01.asp?up=<%=rsauid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rsauid%>（<%=rsasjb%>）</a><%else%><a href="sgreg.asp?up=<%=myup%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsazaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsazaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsazbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsazbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>一</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z1ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y1ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#E3E3E3"><b>1-2</b></td>
			<td width="143" bgcolor="#E3E3E3"><font size="2" face="宋体"><%if rsbuid<>"" then%><a href="sgks01.asp?up=<%=rsbuid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rsbuid%>（<%=rsbsjb%>）</a><%else%><a href="sgreg.asp?up=<%=myup%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsbzaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsbzaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#E3E3E3"><font face="宋体" size="2"><%if rsbzbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rsbzbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>二</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z2ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y2ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-1</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs21auid<>"" then%><a href="sgks01.asp?up=<%=rs21auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs21auid%>（<%=rs21asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsauid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21azaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21azaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21azbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21azbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>三</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z3ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y3ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-2</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs21buid<>"" then%><a href="sgks01.asp?up=<%=rs21buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs21buid%>（<%=rs21bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsauid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21bzaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21bzaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs21bzbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs21bzbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>四</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z4ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y4ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-3</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs22auid<>"" then%><a href="sgks01.asp?up=<%=rs22auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs22auid%>（<%=rs22asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22azaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22azaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22azbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22azbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>五</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z5ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y5ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#FFFFE1"><b>2-4</b></td>
			<td width="143" bgcolor="#FFFFE1"><font size="2" face="宋体"><%if rs22buid<>"" then%><a href="sgks01.asp?up=<%=rs22buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs22buid%>（<%=rs22bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22bzaq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22bzaq%></font></b><font size="2"><%end if%></font></font></td>
			<td width="72" bgcolor="#FFFFE1"><font face="宋体" size="2"><%if rs22bzbq<>"" then%></font><font face="宋体"><b><font size="2" color="#FF0000"><%=rs22bzbq%></font></b><font size="2"><%end if%></font></font></td>
			<td align="center" bgcolor="#FFF2BF"><b>六</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z6ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y6ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-1</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs31auid<>"" then%><a href="sgks01.asp?up=<%=rs31auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs31auid%>（<%=rs31asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>七</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z7ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y7ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-2</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs31buid<>"" then%><a href="sgks01.asp?up=<%=rs31buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs31buid%>（<%=rs31bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>八</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z8ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y8ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-3</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs32auid<>"" then%><a href="sgks01.asp?up=<%=rs32auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs32auid%>（<%=rs32asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>九</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z9ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y9ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-4</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs32buid<>"" then%><a href="sgks01.asp?up=<%=rs32buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs32buid%>（<%=rs32bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z10ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y10ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-5</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs33auid<>"" then%><a href="sgks01.asp?up=<%=rs33auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs33auid%>（<%=rs33asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十一</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z11ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y11ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-6</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs33buid<>"" then%><a href="sgks01.asp?up=<%=rs33buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs33buid%>（<%=rs33bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十二</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z12ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y12ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-7</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs34auid<>"" then%><a href="sgks01.asp?up=<%=rs34auid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs34auid%>（<%=rs34asjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十三</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z13ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y13ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="80" bgcolor="#C7FCFC"><b>3-8</b></td>
			<td width="143" bgcolor="#C7FCFC"><font size="2" face="宋体"><%if rs34buid<>"" then%><a href="sgks01.asp?up=<%=rs34buid%>&bd=<%=bdid%>" style="text-decoration: none"><%=rs34buid%>（<%=rs34bsjb%>）</a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&bd=<%=bdid%>" style="text-decoration: none">选择空位</a><%end if%></font></td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td width="72" bgcolor="#C7FCFC">　</td>
			<td align="center" bgcolor="#FFF2BF"><b>十四</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z14ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y14ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF">当前3层内的左总与右总指的是该用户名网络下全部累计总单数</font></td>
			<td align="center" bgcolor="#FFF2BF"><b>十五</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z15ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y15ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
		<tr>
			<td align="center" width="367" bgcolor="#E3E3E3" colspan="4"><p align="left"><font color="#0000FF">当前16层内指的是</font><b><font size="2" color="#008000">(<%=myup%>)</font></b><font color="#0000FF">各层左与右目前的总单数</font></td>
			<td align="center" bgcolor="#FFF2BF"><b>十六</b></td>
			<td align="center" bgcolor="#FFF2BF"><%=z16ab%></td>
			<td align="center" bgcolor="#FFF2BF"><%=y16ab%></td>
			<td align="center" bgcolor="#FFF2BF"><font color="#FF0000"><%=rscfd%></font></td>
		</tr>
	</table>
	<p>　</div>
	<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">返回上一页</font></a></p>
</div></div>
</BODY>
</HTML>