<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
'��ʼ�ҿ�λ����myid
myid=request("my")
myup=request("up")
%>
<%
'��ʼ���±�sgxtuser�����ϼ�
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM sgxt where username = '"&myid&"'"
rs0.open sql0,conn7,2,3
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����˲����ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT * FROM sgxt where auid = '"&myid&"' or buid = '"&myid&"'"
rs1.open sql1,conn7,2,3
if not rs1.eof then
   response.write "<script language='javascript'>"
   response.write "alert('�������Ѱ��úã������ظ������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxt where username = '"&myup&"'"
rs.open sql,conn7,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�ϼ������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("auid")<>"" then
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
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<div align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>���ڲ������Ǹ� <font color="#FF0000"><%=myid%></font> ����&nbsp; һ��Ҫ������ѡ���λ</b></p>
	<table border="0" width="90%" id="table1" height="199" cellspacing="5" cellpadding="3">
		<tr>
			<td align="center" height="45">��</td>
			<td align="center" height="45">��</td>
			<td align="center" height="45">��</td>
			<td bgcolor="#DFDFDF" colspan="2" align="center" height="43"><b><%=myup%></b></td>
			<td align="center" height="45">��</td>
			<td align="center" height="45">��</td>
			<td align="center" height="45">��</td>
		</tr>
		<tr>
			<td align="center" height="40">��</td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="41"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rsauid<>"" then%><a href="mlt2.asp?up=<%=rsauid%>&my=<%=myid%>" style="text-decoration: none"><%=rsauid%></a><%else%><a href="sgreg.asp?up=<%=myup%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" colspan="2"><b><font color="#FF0000" style="font-size: 11pt">�ǵô�����ѡ��</font></b></td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="41"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rsbuid<>"" then%><a href="mlt2.asp?up=<%=rsbuid%>&my=<%=myid%>" style="text-decoration: none"><%=rsbuid%></a><%else%><a href="sgreg.asp?up=<%=myup%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45">��</td>
		</tr>
		<tr>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs21auid<>"" then%><a href="mlt2.asp?up=<%=rs21auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs21auid%></a><%else%><a href="sgreg.asp?up=<%=rsauid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs21buid<>"" then%><a href="mlt2.asp?up=<%=rs21buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs21buid%></a><%else%><a href="sgreg.asp?up=<%=rsauid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs22auid<>"" then%><a href="mlt2.asp?up=<%=rs22auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs22auid%></a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs22buid<>"" then%><a href="mlt2.asp?up=<%=rs22buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs22buid%></a><%else%><a href="sgreg.asp?up=<%=rsbuid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
		</tr>
		<tr>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs31auid<>"" then%><a href="mlt2.asp?up=<%=rs31auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs31auid%></a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs31buid<>"" then%><a href="mlt2.asp?up=<%=rs31buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs31buid%></a><%else%><a href="sgreg.asp?up=<%=rs21auid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs32auid<>"" then%><a href="mlt2.asp?up=<%=rs32auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs32auid%></a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs32buid<>"" then%><a href="mlt2.asp?up=<%=rs32buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs32buid%></a><%else%><a href="sgreg.asp?up=<%=rs21buid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs33auid<>"" then%><a href="mlt2.asp?up=<%=rs33auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs33auid%></a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs33buid<>"" then%><a href="mlt2.asp?up=<%=rs33buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs33buid%></a><%else%><a href="sgreg.asp?up=<%=rs22auid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs34auid<>"" then%><a href="mlt2.asp?up=<%=rs34auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs34auid%></a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs34buid<>"" then%><a href="mlt2.asp?up=<%=rs34buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs34buid%></a><%else%><a href="sgreg.asp?up=<%=rs22buid%>&my=<%=myid%>" style="text-decoration: none">ѡ���λ</a><%end if%></td>
		</tr>
	</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><iframe name="I1" src="sdup.asp?my=<%=myid%>" width="800" height="148" marginwidth="1" marginheight="1" border="0" frameborder="0"></iframe></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">��</div>