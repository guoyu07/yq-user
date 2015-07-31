<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
sql2="select * from mtfhtj order by tjid desc" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn2,1,1
if date()-rs2("fhdate")=1 then
   response.write "<script language='javascript'>"
   response.write "alert('还没有到结算时间！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
Dim StrSQL1,rsTest1
Set rsTest1 = server.CreateObject("ADODB.Recordset")
StrSQL1 = "SELECT * FROM sgxt where DateDiff('d',date(),bddate)<0 and new=1 and down<2 and mqfh<zfh order by id"
rsTest1.Open StrSQL1,Conn7,2,3
While Not rsTest1.EOF
   sjfh1=rsTest1("sjb")*500
   rsTest1("mqfh")=sjfh1*rsTest1("fhbl")+rsTest1("mqfh")
   rsTest1.Update
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&rstest1("username")&"'"
rs1.open sql1,conn2,2,3
if not rs1.eof then
rs1("pay")=sjfh1*rsTest1("fhbl")+rs1("pay")
rs1("vippay")=sjfh1*rsTest1("fhbl")+rs1("vippay")
rs1("cbpay")=sjfh1*rsTest1("fhbl")+rs1("cbpay")
rs1.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rstest1("username")
rs_d1("regid")="游戏收益"
rs_d1("syjz")=sjfh1*rsTest1("fhbl")
rs_d1("pay")=rs1("pay")
rs_d1("jydb")=rs1("jydb")
rs_d1.update
if rsTest1("mqfh")=rsTest1("sjb")*500 then
   rsTest1("mqfh")=rsTest1("zfh")
   rsTest1.Update
   rs1("ljep")=sjfh1/2+rs1("ljep")
   rs1("syep")=sjfh1/2+rs1("syep")
   rs1.Update
set rs_d1a = Server.CreateObject("ADODB.Recordset")
sql_d1a = "SELECT * FROM datepay"
rs_d1a.open sql_d1a,conn9,2,3
rs_d1a.addnew
rs_d1a("username")=rstest1("username")
rs_d1a("regid")="收益额满-另50%转为预备报单币"
rs_d1a("syjz")=sjfh1/2
rs_d1a("jc")=sjfh1/2
rs_d1a("pay")=rs1("pay")
rs_d1a("jydb")=rs1("jydb")
rs_d1a.update
set rs_d10 = Server.CreateObject("ADODB.Recordset")
sql_d10 = "SELECT * FROM bdbdate"
rs_d10.open sql_d10,conn9,2,3
rs_d10.addnew
rs_d10("zuser")=rstest1("username")
rs_d10("sy")=sjfh1/2
rs_d10("sybdb")=rs1("sybdb")
rs_d10("ljbdb")=rs1("ljbdb")
rs_d10("bz")="收益额满-另50%转为报单-充值可生效"&sjfh1
rs_d10.update
end if
end if
   rsTest1.MoveNext
Wend
rsTest1.UpdateBatch
%>
<%
Dim StrSQL2,rsTest2
Set rsTest2 = server.CreateObject("ADODB.Recordset")
StrSQL2 = "SELECT * FROM sgxt where DateDiff('d',date(),bddate)<0 and new=1 and down>1.9 and mqfh<zfh order by id"
rsTest2.Open StrSQL2,Conn7,2,3
While Not rsTest2.EOF
   sjfh2=rsTest2("sjb")*500
   rsTest2("mqfh")=sjfh2*rsTest2("fhbl")+rsTest2("mqfh")
   rsTest2.Update
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from gcuser where username = '"&rstest2("username")&"'"
rs2.open sql2,conn2,2,3
if not rs2.eof then
rs2("pay")=sjfh2*rsTest2("fhbl")+rs2("pay")
rs2("vippay")=sjfh2*rsTest2("fhbl")+rs2("vippay")
rs2("cbpay")=sjfh2*rsTest2("fhbl")+rs2("cbpay")
rs2.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rstest2("username")
rs_d2("regid")="游戏收益"
rs_d2("syjz")=sjfh2*rsTest2("fhbl")
rs_d2("pay")=rs2("pay")
rs_d2("jydb")=rs2("jydb")
rs_d2.update
if rsTest2("mqfh")=rsTest2("sjb")*500 then
   rsTest2("mqfh")=rsTest2("zfh")
   rsTest2.Update
   rs2("ljep")=sjfh2/2+rs2("ljep")
   rs2("syep")=sjfh2/2+rs2("syep")
   rs2.Update
set rs_d2a = Server.CreateObject("ADODB.Recordset")
sql_d2a = "SELECT * FROM datepay"
rs_d2a.open sql_d2a,conn9,2,3
rs_d2a.addnew
rs_d2a("username")=rstest2("username")
rs_d2a("regid")="收益额满-另50%转为预备报单币"
rs_d2a("syjz")=sjfh2/2
rs_d2a("jc")=sjfh2/2
rs_d2a("pay")=rs2("pay")
rs_d2a("jydb")=rs2("jydb")
rs_d2a.update
set rs_d20 = Server.CreateObject("ADODB.Recordset")
sql_d20 = "SELECT * FROM bdbdate"
rs_d20.open sql_d20,conn9,2,3
rs_d20.addnew
rs_d20("zuser")=rstest2("username")
rs_d20("sy")=sjfh2/2
rs_d20("sybdb")=rs2("sybdb")
rs_d20("ljbdb")=rs2("ljbdb")
rs_d20("bz")="收益额满-另50%转为报单-充值可生效"&sjfh2
rs_d20.update
end if
end if
   rsTest2.MoveNext
Wend
rsTest2.UpdateBatch
%>
<%
response.redirect "sgnew07.asp"
%>