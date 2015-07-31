<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
username=request.cookies("regid")
password=request.cookies("password")
myup=request("up")
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM gcuser where username = '"&myup&"'"
rs_my.open sql_my,conn2,1,1
if rs_my.eof and rs_my.bof or rs_my("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Not a dual-zone member, please check the input is correct or contact customer upgrades!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_sg = Server.CreateObject("ADODB.Recordset")
sql_sg = "SELECT * FROM sgxt where username = '"&myup&"'"
rs_sg.open sql_sg,conn7,1,1
if rs_sg.eof and rs_sg.bof or rs_sg("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Not a dual-zone member, please check the input is correct or contact customer upgrades!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_up = Server.CreateObject("ADODB.Recordset")
sql_up = "SELECT * FROM sgxt where auid = '"&myup&"' or buid = '"&myup&"'"
rs_up.open sql_up,conn7,1,1
if rs_up.eof and rs_up.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Not properly placed, please contact technical department treatment, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   downup=rs_up("username")
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxt where username = '"&myup&"'"
rs.open sql,conn7,1,1
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
<HTML>
<title></title>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="Home";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});


</SCRIPT>
<BODY bgcolor="#FFFFFF" style="text-align: center" >
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
¡¡</DIV>¡¡</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">Personal information</A> </LI>
  <LI><a target="main" href="downtj.asp" style="text-decoration: none">Network Query</A> 
  </LI>
  <LI><a target="main" href="mzff.asp" style="text-decoration: none">Financial Management</A> 
  </LI>
  <LI><A >Message Management</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">Exit the System</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>Current position:<SPAN 
id=mTitle>Home</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
	<div align="center">
	<table border="0" width="64%" id="table2" height="114">
		<tr>
	<td colspan="4" align="center" height="35" width="833">
	<table border="0" width="101%" id="table3">
	<tr>
	<td align="center" width="38%">
	<p align="left"><span style="font-size: 11pt">Current query Username:<b><font color="#FF0000"><%=myup%></font></b></span></td>
	<td align="center">
	<p align="left"><span style="font-size: 11pt; font-weight:700"><font color="#008000"><a href="glsgm.asp?up=<%=downup%>"><font color="#000080">Upper:<%=downup%></font></a></font></span></td>
	<td align="center" width="33%">
	<p align="left"><span style="font-size: 11pt; font-weight:700"><a href="glsgm.asp?up=<%=username%>"><font color="#008000">Return to yourself:<%=username%></font></a></span></td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">Grand total</font></b></td>
	<td align="center" bgcolor="#C1F2C4" colspan="2"><b><font size="2">Upcoming settlement</font></b></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="25" width="159">Left area</td>
			<td align="center" bgcolor="#FFFF97" height="25" width="156">Right area</td>
			<td align="center" bgcolor="#FFDDBB" height="25" width="175">Left area</td>
			<td align="center" bgcolor="#FFDDBB" height="25" width="117">Right area</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#FFFF97" height="26" width="159">
			<font color="#FF0000"><%=rs_sg("zaq")%></font></td>
			<td align="center" bgcolor="#FFFF97" height="26" width="156">
			<font color="#FF0000"><%=rs_sg("zbq")%></font></td>
			<td align="center" bgcolor="#FFDDBB" height="26" width="175">
			<font color="#FF0000"><%=rs_sg("aq")%></font></td>
			<td align="center" bgcolor="#FFDDBB" height="26" width="117">
			<font color="#FF0000"><%=rs_sg("bq")%></font></td>
		</tr>
	</table>
		<p>¡¡</div>
	<table border="0" width="90%" id="table1" height="241" cellspacing="5" cellpadding="3">
		<tr>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td bgcolor="#DFDFDF" colspan="2" align="center" height="25"><b>
			<font size="2"><%=myup%>£¨<%=rssjb%>£©</font></b></td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
		</tr>
		<tr>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td bgcolor="#DFDFDF" align="center" height="25"><font size="2">Left total</font><b><font size="2" color="#FF0000">£¨<%=rszaq%>£©</font></b></td>
			<td bgcolor="#DFDFDF" align="center" height="25"><font size="2">Right total</font><b><font size="2" color="#FF0000">£¨<%=rszbq%>£©</font></b></td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
		</tr>
		<tr>
			<td align="center" height="25">¡¡</td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="25">
			<font size="2"><%if rsauid<>"" then%><a href="glsgm.asp?up=<%=rsauid%>&my=<%=myid%>" style="text-decoration: none"><%=rsauid%>£¨<%=rsasjb%>£©</a><%end if%></font></td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="25">
			<font size="2"><%if rsbuid<>"" then%><a href="glsgm.asp?up=<%=rsbuid%>&my=<%=myid%>" style="text-decoration: none"><%=rsbuid%>£¨<%=rsbsjb%>£©</a><%end if%></font></td>
			<td align="center" height="25">¡¡</td>
		</tr>
		<tr>
			<td align="center" height="25">¡¡</td>
			<td bgcolor="#B5FFFF" align="center" height="25"><font size="2">Left total</font><b><font size="2" color="#FF0000">£¨<%=rsazaq%>£©</font></b></td>
			<td bgcolor="#B5FFFF" align="center" height="25"><font size="2">Right total</font><b><font size="2" color="#FF0000">£¨<%=rsazbq%>£©</font></b></td>
			<td align="center" height="25">¡¡</td>
			<td align="center" height="25">¡¡</td>
			<td bgcolor="#B5FFFF" align="center" height="25"><font size="2">Left total</font><b><font size="2" color="#FF0000">£¨<%=rsbzaq%>£©</font></b></td>
			<td bgcolor="#B5FFFF" align="center" height="25"><font size="2">Right total</font><b><font size="2" color="#FF0000">£¨<%=rsbzbq%>£©</font></b></td>
			<td align="center" height="25">¡¡</td>
		</tr>
		<tr>
			<td bgcolor="#FFFFA4" colspan="2" align="center" height="25">
			<font size="2"><%if rs21auid<>"" then%><a href="glsgm.asp?up=<%=rs21auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs21auid%>£¨<%=rs21asjb%>£©</a><%end if%></font></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center" height="25">
			<font size="2"><%if rs21buid<>"" then%><a href="glsgm.asp?up=<%=rs21buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs21buid%>£¨<%=rs21bsjb%>£©</a><%end if%></font></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center" height="25">
			<font size="2"><%if rs22auid<>"" then%><a href="glsgm.asp?up=<%=rs22auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs22auid%>£¨<%=rs22asjb%>£©</a><%end if%></font></td>
			<td bgcolor="#FFFFA4" colspan="2" align="center" height="25">
			<font size="2"><%if rs22buid<>"" then%><a href="glsgm.asp?up=<%=rs22buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs22buid%>£¨<%=rs22bsjb%>£©</a><%end if%></font></td>
		</tr>
		<tr>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Left total</font><b><font size="2" color="#FF0000">£¨<%=rs21azaq%>£©</font></b></td>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Right total</font><b><font size="2" color="#FF0000">£¨<%=rs21azbq%>£©</font></b></td>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Left total</font><b><font size="2" color="#FF0000">£¨<%=rs21bzaq%>£©</font></b></td>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Right total</font><b><font size="2" color="#FF0000">£¨<%=rs21bzbq%>£©</font></b></td>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Left total</font><b><font size="2" color="#FF0000">£¨<%=rs22azaq%>£©</font></b></td>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Right total</font><b><font size="2" color="#FF0000">£¨<%=rs22azbq%>£©</font></b></td>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Left total</font><b><font size="2" color="#FF0000">£¨<%=rs22bzaq%>£©</font></b></td>
			<td bgcolor="#FFFFA4" align="center" height="25"><font size="2">Right total</font><b><font size="2" color="#FF0000">£¨<%=rs22bzbq%>£©</font></b></td>
		</tr>
		<tr>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs31auid<>"" then%><a href="glsgm.asp?up=<%=rs31auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs31auid%>£¨<%=rs31asjb%>£©</a><%end if%></font></td>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs31buid<>"" then%><a href="glsgm.asp?up=<%=rs31buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs31buid%>£¨<%=rs31bsjb%>£©</a><%end if%></font></td>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs32auid<>"" then%><a href="glsgm.asp?up=<%=rs32auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs32auid%>£¨<%=rs32asjb%>£©</a><%end if%></font></td>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs32buid<>"" then%><a href="glsgm.asp?up=<%=rs32buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs32buid%>£¨<%=rs32bsjb%>£©</a><%end if%></font></td>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs33auid<>"" then%><a href="glsgm.asp?up=<%=rs33auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs33auid%>£¨<%=rs33asjb%>£©</a><%end if%></font></td>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs33buid<>"" then%><a href="glsgm.asp?up=<%=rs33buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs33buid%>£¨<%=rs33bsjb%>£©</a><%end if%></font></td>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs34auid<>"" then%><a href="glsgm.asp?up=<%=rs34auid%>&my=<%=myid%>" style="text-decoration: none"><%=rs34auid%>£¨<%=rs34asjb%>£©</a><%end if%></font></td>
			<td align="center" height="25" bgcolor="#FFCECE"><font size="2"><%if rs34buid<>"" then%><a href="glsgm.asp?up=<%=rs34buid%>&my=<%=myid%>" style="text-decoration: none"><%=rs34buid%>£¨<%=rs34bsjb%>£©</a><%end if%></font></td>
		</tr>
		</table>
	<p>¡¡</p>
	<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">Back to Previous Page</font></a></p>
	</div></div>
</BODY>
</HTML>