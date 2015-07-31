<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
'开始找空位安置myid
myid=request("my")
sjb=request("sjb")
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&myid&"'"
rs.open sql,conn2,1,1
%>
<%
if sjb=1 then
   fd=2000
   cfd=20
elseif sjb=2 then
   fd=4000
   cfd=40
elseif sjb=4 then
   fd=8000
   cfd=60
elseif sjb=10 then
   fd=20000
   cfd=80
elseif sjb=20 then
   fd=40000
   cfd=100
elseif sjb=40 then
   fd=80000
   cfd=150
elseif sjb=100 then
   fd=200000
   cfd=200
end if
%>
<%
'搜索新表最后一个用户名
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT top 1 * FROM sgxt order by id desc"
rs0.open sql0,conn2,1,1
%>
<%
'开始搜索已进入双轨系统的上级
set rs10=server.createobject("adodb.recordset")
  sql10="select * from gcuser where username = '"&rs("up")&"'"
  rs10.open sql10,conn2,1,1
%>
<%
set rs11=server.createobject("adodb.recordset")
  sql11="select * from gcuser where username = '"&rs10("up")&"'"
  rs11.open sql11,conn2,1,1
%>
<%
set rs12=server.createobject("adodb.recordset")
  sql12="select * from gcuser where username = '"&rs11("up")&"'"
  rs12.open sql12,conn2,1,1
%>
<%
set rs13=server.createobject("adodb.recordset")
  sql13="select * from gcuser where username = '"&rs12("up")&"'"
  rs13.open sql13,conn2,1,1
%>
<%
'最高到5级，如果还没有，那就取进入双轨最后一个，并放他下面
set rs14=server.createobject("adodb.recordset")
  sql14="select * from gcuser where username = '"&rs13("up")&"'"
  rs14.open sql14,conn2,1,1
%>
<%
if rs10("sjb")>0 then
   myup=rs10("username")
elseif rs11("sjb")>0 then
   myup=rs11("username")
elseif rs12("sjb")>0 then
   myup=rs12("username")
elseif rs13("sjb")>0 then
   myup=rs13("username")
elseif rs14("sjb")>0 then
   myup=rs14("username")
else
   myup=rs0("username")
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxt where username = '"&myup&"'"
rs.open sql,conn2,1,1
if rs("auid")<>"" then
   rsauid=rs("auid")
set rs21 = Server.CreateObject("ADODB.Recordset")
sql21 = "SELECT * FROM sgxt where username = '"&rs("auid")&"'"
rs21.open sql21,conn2,1,1
    rs21auid=rs21("auid")
    rs21buid=rs21("buid")
if rs("buid")<>"" then
    rsbuid=rs("buid")
set rs22 = Server.CreateObject("ADODB.Recordset")
sql22 = "SELECT * FROM sgxt where username = '"&rs("buid")&"'"
rs22.open sql22,conn2,1,1
    rs22auid=rs22("auid")
    rs22buid=rs22("buid")
end if
end if
%>
<%
if rs21auid<>"" then
set rs31 = Server.CreateObject("ADODB.Recordset")
sql31 = "SELECT * FROM sgxt where username = '"&rs21auid&"'"
rs31.open sql31,conn2,1,1
    rs31auid=rs31("auid")
    rs31buid=rs31("buid")
end if
%>
<%
if rs21buid<>"" then
set rs32 = Server.CreateObject("ADODB.Recordset")
sql32 = "SELECT * FROM sgxt where username = '"&rs21buid&"'"
rs32.open sql32,conn2,1,1
    rs32auid=rs32("auid")
    rs32buid=rs32("buid")
end if
%>
<%
if rs22auid<>"" then
set rs33 = Server.CreateObject("ADODB.Recordset")
sql33 = "SELECT * FROM sgxt where username = '"&rs22auid&"'"
rs33.open sql33,conn2,1,1
    rs33auid=rs33("auid")
    rs33buid=rs33("buid")
end if
%>
<%
if rs22buid<>"" then
set rs34 = Server.CreateObject("ADODB.Recordset")
sql34 = "SELECT * FROM sgxt where username = '"&rs22buid&"'"
rs34.open sql34,conn2,1,1
    rs34auid=rs34("auid")
    rs34buid=rs34("buid")
end if
%>
<%
'上面安置安置好后，在新表sgxtuser里增加我的一条记录
set rs_myid = Server.CreateObject("ADODB.Recordset")
sql_myid = "SELECT * FROM sgxt where username='"&myid&"'"
rs_myid.open sql_myid,conn2,2,3
If rs_myid.eof Or rs_myid.bof Then
rs_myid.addnew
rs_myid("username")=myid
rs_myid("sjb")=sjb '我的单数
rs_myid("fdpay")=fd'我的封顶奖金
rs_myid("cfd")=cfd
rs_myid.update
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<div align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>现在操作的是给 <font color="#FF0000"><%=myid%></font> 报单&nbsp; 一定要从左到右选择空位</b></p>
	<table border="0" width="90%" id="table1" height="199" cellspacing="5" cellpadding="3">
		<tr>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
			<td bgcolor="#DFDFDF" colspan="2" align="center" height="43"><b><%=myup%></b></td>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
		</tr>
		<tr>
			<td align="center" height="40">　</td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="41"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rsauid<>"" then%><a href="mlt2.asp?up=<%=rsauid%>&my=<%=myid%>" style="text-decoration: none"><%=rsauid%></a><%else%><a href="sgreg.asp?up=<%=myup%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" colspan="2"><b><font color="#FF0000" style="font-size: 11pt">记得从左到右选择</font></b></td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="41"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rsbuid<>"" then%><a href="mlt2.asp?up=<%=rsbuid%>&my=<%=myid%>" style="text-decoration: none"><%=rsbuid%></a><%else%><a href="sgreg.asp?up=<%=myup%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45">　</td>
		</tr>
		<tr>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs21auid<>"" then%><a href="mlt2.asp?up=<%=rs21auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs21auid%></a><%else%><a href="sgreg.asp?up=<%=rsauid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs21buid<>"" then%><a href="mlt2.asp?up=<%=rs21buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs21buid%></a><%else%><a href="sgreg.asp?up=<%=rsauid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs22auid<>"" then%><a href="mlt2.asp?up=<%=rs22auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs22auid%></a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs22buid<>"" then%><a href="mlt2.asp?up=<%=rs22buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs22buid%></a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
		</tr>
		<tr>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs31auid<>"" then%><a href="mlt2.asp?up=<%=rs31auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs31auid%></a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs31buid<>"" then%><a href="mlt2.asp?up=<%=rs31buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs31buid%></a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs32auid<>"" then%><a href="mlt2.asp?up=<%=rs32auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs32auid%></a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs32buid<>"" then%><a href="mlt2.asp?up=<%=rs32buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs32buid%></a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs33auid<>"" then%><a href="mlt2.asp?up=<%=rs33auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs33auid%></a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs33buid<>"" then%><a href="mlt2.asp?up=<%=rs33buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs33buid%></a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs34auid<>"" then%><a href="mlt2.asp?up=<%=rs34auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs34auid%></a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs34buid<>"" then%><a href="mlt2.asp?up=<%=rs34buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs34buid%></a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&my=<%=myid%>" style="text-decoration: none">选择空位</a><%end if%></td>
		</tr>
	</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><iframe name="I1" src="sdup.asp?my=<%=myid%>" width="800" height="148" marginwidth="1" marginheight="1" border="0" frameborder="0"></iframe></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</div>