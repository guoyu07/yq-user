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
Dim StrSQL2,rsTest2
Set rsTest2 = server.CreateObject("ADODB.Recordset")
StrSQL2 = "SELECT * FROM sgxt where DateDiff('d',date(),bddate)<0 and new=3 and mqfh<zfh and id>9000 and id<12000 order by id"
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
rs2("fhpay")=sjfh2*rsTest2("fhbl")+rs2("fhpay")
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
end if
   rsTest2.MoveNext
Wend
rsTest2.UpdateBatch
%>
<%
response.redirect "sgnew01.asp"
%>