<!--#include file="../ct0618222.asp"-->
<%
'需要单独拆分的几个户,lby1573,jyq1573a,csz1573
'--------------------------------------------------
Set rsTest0 = server.CreateObject("ADODB.Recordset")
StrSQL0 = "SELECT * FROM gcuser WHERE username='jyq1573a' "
rsTest0.Open StrSQL0,Conn2,2,3
   dqjyg15=rsTest0("jyg")
   rsTest0("jyg")=rsTest0("jyg")*1.23
   rsTest0("cfa")=rsTest0("cfa")+1
   rsTest0("cfb")=rsTest0("cfb")+1.23
   rsTest0("cfc")=rsTest0("cfc")+1
   rsTest0.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM gpjy"
rs_d2.open sql_d2,conn2,2,3
rs_d2.addnew
rs_d2("username")=rsTest0("username")
rs_d2("mysl")=rsTest0("jyg")-dqjyg15
rs_d2("sysl")=rsTest0("jyg")
rs_d2("bz")="拆分1.23倍"
rs_d2("abdate")=abcd
rs_d2("cgdate")="2015-3-1 14:23:33"
rs_d2("jy")=1
rs_d2.update
%>
<%
response.Write "<script language=javascript>alert('user_拆分成功！');location.replace('searchg0701.asp');</script>"
%>