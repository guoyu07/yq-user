<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<% 
sql_fhg="select sum(gdgc) as ljfhg from gcuser" 
Set rs_fhg= Server.CreateObject("ADODB.Recordset") 
rs_fhg.open sql_fhg,conn2,1,1
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser WHERE gdgc > 0 and sjb>0"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
   bqfh=rsTest("gdgc")*0.015
   rsTest("ljfh")=rsTest("ljfh")+bqfh
   rsTest("cbpay")=rsTest("cbpay")+bqfh
   rsTest("pay")=rsTest("pay")+bqfh
   rsTest.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gcfh"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("userid")=rsTest("username")
rs_d1("jtljgc")=rs_fhg("ljfhg")
rs_d1("sygc")=rsTest("gdgc")
rs_d1("ljgc")=rsTest("gdgc")
rs_d1("fhpay")=0.015
rs_d1("syfh")=bqfh
rs_d1("ljfhtj")=rsTest("ljfh")
rs_d1("bz")="月分红-"&rsTest("gdgc")&"股双区会员每股0.015"
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
rs_d2("regid")="月分红-"&rsTest("gdgc")&"股双区会员每股0.015"
rs_d2.update
   rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
Dim StrSQL0, rsTest0
Set rsTest0 = server.CreateObject("ADODB.Recordset")
StrSQL0 = "SELECT * FROM gcuser WHERE gdgc > 0 and sjb>0 "
rsTest0.Open StrSQL0, Conn2,2,3
While Not rsTest0.EOF
   bqfh2=rsTest0("gdgc")*0.1
   rsTest0("jyg")=rsTest0("jyg")+bqfh2
   rsTest0.update
set rs_d10 = Server.CreateObject("ADODB.Recordset")
sql_d10 = "SELECT * FROM gpjy"
rs_d10.open sql_d10,conn2,2,3
rs_d10.addnew
rs_d10("username")=rsTest0("username")
rs_d10("mysl")=bqfh2
rs_d10("sysl")=rsTest0("jyg")
rs_d10("bz")=rsTest0("gdgc")&"股-双区会员每股0.1"
rs_d10("jy")=1
rs_d10.update
   rsTest0.MoveNext
Wend
rsTest0.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('双区会员[分红+积分]成功！');window.location.replace('searchg0701.asp');</script>"
%>