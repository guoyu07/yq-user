<!--#include file="../ct0618.asp"-->
<%
if request.cookies("lktojb")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Has been operated, re-login!');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
elseif request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
gmsl=request("gmsl")
gmmj=request("mj")
dlsy=request("gmsl")*request("mj")
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('Note: Your one currency is less than 15, please recharge!');history.go(-1);</script>"
   response.end
elseif rs("pay")<dlsy*1.5 then
   response.write"<script>alert('Note: Your one currency is not enough for this card purchase, please recharge!');history.go(-1);</script>"
   response.end
end if
%>
<div align="center">
　<p>　</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">You are operating the</font><font style="font-size: 20pt; font-weight: 700" color="#008000">A currency conversion electronics gold card</font><font style="font-size: 20pt; font-weight: 700" color="#800000">Entry</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">Please look carefully to determine whether to buy</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#FF0000"><%=gmsl%>Zhang</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF">Par value<%if request("mj")=10 then %>10 gold (15 a credit / Zhang)<%elseif request("mj")=50 then %>50 gold (75 a credit / Zhang)<%elseif request("mj")=100 then %>100 gold coins (150 a credit / Zhang)<%elseif request("mj")=300 then %>300 gold coins (450 a credit / Zhang)<%elseif request("mj")=500 then %>500 gold coins (750 a credit / Zhang)<%elseif request("mj")=1000 then %>1000 gold (1500 a credit / Zhang)<%end if%></font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">Need</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=dlsy*1.5%>A currency</font><font style="font-size: 20pt; font-weight: 700" color="#800000">Cash</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">=</font><font style="font-size: 20pt; font-weight: 700" color="#008000"><%=dlsy/10%>Zhang</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">The nominal value of 10 gold card</font><font style="font-size: 20pt; font-weight: 700">Accumulated gold<%=dlsy%>倖</font></p>
<p>　</p>
<p><a onClick="return confirm('Tip: Are you sure it? ')" href="jztojb4.asp?mj=<%=request("mj")%>&jbpay=<%=dlsy%>&lksl=<%=gmsl%>">
<input type="button" value="Determined from one of my coins - deduction" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a> </p>
<p>　<p>  <b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Return to the previous step</font></a></div>