<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn2,2,3
%>
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
    rsTest("pay")=rsTest("pay")+(0+Request("ff"))
    rsTest("cbpay")=rsTest("cbpay")+(0+Request("ff"))
    rsTest.Update
    rs_d1.addnew
    rs_d1("username")=rsTest("username")
    rs_d1("zff")=Request("ff")
    rs_d1("pay")=rsTest("pay")
    rs_d1("jydb")=rsTest("jydb")
    rs_d1("regid")="月分红"
    rsTest.MoveNext
Wend
rs_d1.UpdateBatch
rsTest.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('分红成功！');window.location.replace('vipgj.asp');</script>"
%>
