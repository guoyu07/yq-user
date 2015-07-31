<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from fcxt where id =2 "
rs0.open sql0,conn2,2,3
mqbz=rs0("payadd")
%>
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM sgxt where aq>0 and bq>0"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
if rsTest("aq")=rsTest("bq") then
   jsq=rsTest("bq")
elseif rsTest("aq")<rsTest("bq") then
   jsq=rsTest("aq")
elseif rsTest("aq")>rsTest("bq") then
   jsq=rsTest("bq")
end if
if jsq*50>rsTest("fdpay") then
   rsTest("pay")=rsTest("fdpay")
   rsTest("cbpay")=rsTest("cbpay")+rsTest("fdpay")
   rsTest("aq")=0
   rsTest("bq")=0
   rsTest.update
else
   rsTest("pay")=jsq*50
   rsTest("cbpay")=jsq*50+rsTest("cbpay")
   rsTest("aq")=rsTest("aq")-jsq
   rsTest("bq")=rsTest("bq")-jsq
   rsTest.update
end if
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&rstest("username")&"'"
rs.open sql,conn2,2,3
if not rs.eof then
rs("pay")=rs("pay")+rsTest("pay")
rs("cbpay")=rs("cbpay")+rsTest("pay")
rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rstest("username")
rs_d1("regid")="双区业务"&jsq&"碰奖金"
rs_d1("syjz")=rsTest("pay")
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("bz")=rs0("payadd")
rs_d1.update
end if
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&rs("up")&"'"
rs1.open sql1,conn2,2,3
if not rs1.eof then
rs1("pay")=rsTest("pay")*0.1+rs1("pay")
rs1("cbpay")=rsTest("pay")*0.1+rs1("cbpay")
rs1.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs("up")
rs_d2("regid")=""&rstest("username")&"双区业务"&jsq&"碰领导奖"
rs_d2("syjz")=rsTest("pay")*0.1
rs_d2("pay")=rs1("pay")
rs_d2("jydb")=rs1("jydb")
rs_d2.update
end if
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
set rs_sgaq = Server.CreateObject("ADODB.Recordset")
sql_sgaq = "SELECT sum(aq) as syaq FROM sgxt"
rs_sgaq.open sql_sgaq,conn2,1,1
%>
<%
set rs_sgbq = Server.CreateObject("ADODB.Recordset")
sql_sgbq = "SELECT sum(bq) as sybq FROM sgxt"
rs_sgbq.open sql_sgbq,conn2,1,1
%>
<%
set rs_mq = Server.CreateObject("ADODB.Recordset")
sql_mq = "SELECT sum(syjz) as tjmq FROM datepay where bz = "&mqbz&""
rs_mq.open sql_mq,conn9,1,1
%>
<%
set rs_tj= Server.CreateObject("ADODB.Recordset")
sql_tj= "SELECT * FROM sgtj"
rs_tj.open sql_tj,conn2,2,3
rs_tj.addnew
rs_tj("aq")=rs_sgaq("syaq")
rs_tj("bq")=rs_sgbq("sybq")
rs_tj("zpay")=rs_mq("tjmq")
rs_tj("abp")=rs_mq("tjmq")/50
rs_tj("ldpay")=rs_mq("tjmq")*0.1
rs_tj("jsdate")=Now()
'rs_tj("bz")=0
rs_tj.update
%>
<%
rs0("payadd")=rs0("payadd")+1
rs0("jsdate")=rs0("jsdate")+7
rs0.update
response.Write "<script language=javascript>alert('双区业务结算成功！');window.location.replace('searchg0701.asp');</script>"
response.end
%>