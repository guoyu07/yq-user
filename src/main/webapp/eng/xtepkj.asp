<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "12122121"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getCode = strCode
End Function
%>
<%
Function getkdx(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "43433434"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getkdx = strCode
End Function
%>
<%
Set rs_qi= Server.CreateObject("ADODB.Recordset")
sql_qi="select top 1 * from epkjdate where Now()>kjdate and bz=0 order by kid desc" 
rs_qi.open sql_qi,conn7,2,3
if rs_qi.eof and rs_qi.bof then
   response.redirect "newxtkj.asp"
end if
bqitz=rs_qi("dan")+rs_qi("shuang")+rs_qi("da")+rs_qi("xiao")
%>
<%
'if jtsy*0.9-bqitz=jtjc+0 then
if jtsy*0.9-bqitz>jtjc+0 then
   rs_qi("dskj")=getcode(1)
   rs_qi.update
else
if rs_qi("dan")<rs_qi("shuang") then
   rs_qi("dskj")=1
   rs_qi.update
elseif rs_qi("dan")>rs_qi("shuang") then
   rs_qi("dskj")=2
   rs_qi.update
else
   rs_qi("dskj")=getcode(1)
   rs_qi.update   
end if
end if
%>
<%
'if jtsy*0.9-bqitz=jtjc+0 then
if jtsy*0.9-bqitz>jtjc+0 then
   rs_qi("kdxj")=getkdx(1)
   rs_qi.update
else
if rs_qi("da")<rs_qi("xiao") then
   rs_qi("kdxj")=3
   rs_qi.update
elseif rs_qi("da")>rs_qi("xiao") then
   rs_qi("kdxj")=4
   rs_qi.update
else
   rs_qi("kdxj")=getkdx(1)
   rs_qi.update
end if
end if
%>
<%
if rs_qi("dskj")=1 then
   tzxma="Single"
elseif rs_qi("dskj")=2 then
   tzxma="Double"
end if
Dim StrSQL0, rs0
Set rs0 = server.CreateObject("ADODB.Recordset")
StrSQL0 = "SELECT * FROM eptzb where tzlba="&rs_qi("dskj")&""
rs0.Open StrSQL0, Conn7,2,3
While Not rs0.EOF
set rs_ds=server.CreateObject("adodb.recordset")
sql_ds="select * from gcuser where username = '"&rs0("tzuser")&"'"
rs_ds.open sql_ds,conn2,2,3
if not rs_ds.eof then
rs_ds("pay")=rs0("tzsla")*1.9+rs_ds("pay")
rs_ds("cbpay")=rs0("tzsla")*1.9+rs_ds("cbpay")
rs_ds.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs_ds("username")
rs_d1("regid")="Guess success-"&tzxma&"-"&rs0("tzsla")*0.9&""
rs_d1("syjz")=rs0("tzsla")*1.9
rs_d1("pay")=rs_ds("pay")
rs_d1("jydb")=rs_ds("jydb")
rs_d1("kjqi")=rs_qi("kid")
rs_d1.update
end if
    rs0.MoveNext
Wend
rs0.UpdateBatch
%>
<%
if rs_qi("kdxj")=3 then
   tzxmb="Big"
elseif rs_qi("kdxj")=4 then
   tzxmb="Small"
end if
Dim StrSQL1, rs1
Set rs1 = server.CreateObject("ADODB.Recordset")
StrSQL1 = "SELECT * FROM eptzb where tzlba="&rs_qi("kdxj")&""
rs1.Open StrSQL1, Conn7,2,3
While Not rs1.EOF
set rs_dx=server.CreateObject("adodb.recordset")
sql_dx="select * from gcuser where username = '"&rs1("tzuser")&"'"
rs_dx.open sql_dx,conn2,2,3
if not rs_dx.eof then
rs_dx("pay")=rs1("tzsla")*1.9+rs_dx("pay")
rs_dx("cbpay")=rs1("tzsla")*1.9+rs_dx("cbpay")
rs_dx.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs_dx("username")
rs_d2("regid")="Guess success-"&tzxmb&"-"&rs1("tzsla")*0.9&""
rs_d2("syjz")=rs1("tzsla")*1.9
rs_d2("pay")=rs_dx("pay")
rs_d2("jydb")=rs_dx("jydb")
rs_d2("kjqi")=rs_qi("kid")
rs_d2.update
end if
    rs1.MoveNext
Wend
rs1.UpdateBatch
%>
<%
conn7.Execute("delete * from eptzb")
rs_qi("bz")=1
rs_qi("kjdate")=Now()
rs_qi.update
Set rs_ep= Server.CreateObject("ADODB.Recordset")
sql_ep="select * from epkjdate" 
rs_ep.open sql_ep,conn7,2,3
rs_ep.addnew
rs_ep("bz")=0
'rs_ep("kjdate")=Now()+0.0008
rs_ep.update
%>
<%
response.redirect "xtjfkj.asp"
'response.redirect "dsdxxtkj.asp"
%>