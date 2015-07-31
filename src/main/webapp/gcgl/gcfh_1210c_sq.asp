<!--#include file="../77ct0618.asp"-->
<!--#include file="../88dt0618.asp"-->
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=10"
rs2.open sql2,conn2,1,1
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser WHERE gdgc>0 and sjb>0"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
if rsTest("regtime")<rs2("jsdate")+2 then
   bqfh=rsTest("gdgc")*0.01
   rsTest("ljfh")=rsTest("ljfh")+bqfh
   rsTest("pay")=rsTest("pay")+bqfh
   rsTest("cbpay")=rsTest("cbpay")+bqfh
   rsTest.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gcfh"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("userid")=rsTest("username")
rs_d1("sygc")=rsTest("gdgc")
rs_d1("fhpay")=0.01
rs_d1("syfh")=bqfh
rs_d1("ljfhtj")=rsTest("ljfh")
rs_d1("bz")="月分红-每点0.01"
rs_d1("lb")=1
rs_d1.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rsTest("username")
rs_d2("syjz")=bqfh
rs_d2("pay")=rsTest("pay")
rs_d2("jydb")=rsTest("jydb")
rs_d2("regid")="月分红-每点0.01"
rs_d2.update
end if
   rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('2012年10月前双区会员[分红]成功！');location.replace('searchg0701.asp');</script>"
%>