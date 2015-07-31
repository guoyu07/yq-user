<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
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
StrSQL1 = "SELECT * FROM sgxt where DateDiff('d',date(),bddate)<0 and new=2 and mqfh<zfh order by id"
rsTest1.Open StrSQL1,Conn7,2,3
While Not rsTest1.EOF
   sjfh1=rsTest1("sjb")*500
   rsTest1("mqfh")=sjfh1*rsTest1("fhbl")+rsTest1("mqfh")
   rsTest1.Update
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&rstest1("username")&"'"
rs1.open sql1,conn2,2,3
if not rs1.eof and rs1("txlb")=0 then
rs1("pay")=sjfh1*rsTest1("fhbl")+rs1("pay")
rs1("vippay")=sjfh1*rsTest1("fhbl")+rs1("vippay")
rs1("fhpay")=sjfh1*rsTest1("fhbl")+rs1("fhpay")
rs1("cbpay")=sjfh1*rsTest1("fhbl")+rs1("cbpay")
rs1.update
elseif not rs1.eof and rs1("txlb")>0 then
rs1("pay")=sjfh1*rsTest1("fhbl")+rs1("pay")
rs1("fhpay")=sjfh1*rsTest1("fhbl")+rs1("fhpay")
rs1("cbpay")=sjfh1*rsTest1("fhbl")+rs1("cbpay")
rs1.update
end if
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
   rsTest1.MoveNext
Wend
rsTest1.UpdateBatch
%>
<%
Dim StrSQL2,rsTest2
Set rsTest2 = server.CreateObject("ADODB.Recordset")
StrSQL2 = "SELECT * FROM sgxt where DateDiff('d',date(),bddate)<0 and new=3 and mqfh<zfh order by id"
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
sql_nd="select sum(sjb) as ljnd from sgxt where DateDiff('d',date(),bddate)=-1 and new>0 " 
Set rs_nd= Server.CreateObject("ADODB.Recordset") 
rs_nd.open sql_nd,conn7,1,1
%>
<% 
sql_cb="select sum(zfh) as ljcb from sgxt where new>0 and mqfh<zfh" 
Set rs_cb= Server.CreateObject("ADODB.Recordset") 
rs_cb.open sql_cb,conn7,1,1
%>
<% 
sql_mq="select sum(mqfh) as ljmq from sgxt where new>0 " 
Set rs_mq= Server.CreateObject("ADODB.Recordset") 
rs_mq.open sql_mq,conn7,1,1
%>
<%
set rs_tj= Server.CreateObject("ADODB.Recordset")
sql_tj= "SELECT * FROM mtfhtj"
rs_tj.open sql_tj,conn2,2,3
rs_tj.addnew
rs_tj("fhdate")=date()-1
rs_tj("newd")=rs_nd("ljnd")*500
rs_tj("zfh")=rs_cb("ljcb")
rs_tj("mqfh")=rs_mq("ljmq")
rs_tj.update
%>
<%
response.Write "<script language=javascript>alert('每天返还结算成功！');location.replace('mtfhjl.asp');</script>"
%>