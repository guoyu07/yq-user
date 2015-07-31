<!--#include file="../ct0618gg.asp"-->
<%
'需要单独拆分的几个户,lby1573,jyq1573a,csz1573
'--------------------------------------------------
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=10"
rs2.open sql2,conn2,1,1
%>
<%
Dim StrSQL0,rsTest0
Set rsTest0 = server.CreateObject("ADODB.Recordset")
StrSQL0 = "SELECT * FROM gcuser WHERE jyg > 0 "
rsTest0.Open StrSQL0,Conn2,2,3
While Not rsTest0.EOF
if rsTest0("regtime")>rs2("jsdate")+3 then
   dqjyg15=rsTest0("jyg")
   rsTest0("jyg")=rsTest0("jyg")*1.46
   rsTest0("cfa")=rsTest0("cfa")+1
   rsTest0("cfb")=rsTest0("cfb")+1.46
   rsTest0("cfc")=rsTest0("cfc")+1
   rsTest0.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM gpjy"
rs_d2.open sql_d2,conn2,2,3
rs_d2.addnew
rs_d2("username")=rsTest0("username")
rs_d2("mysl")=rsTest0("jyg")-dqjyg15
rs_d2("sysl")=rsTest0("jyg")
rs_d2("bz")="拆分1.46倍"
rs_d2("abdate")=abcd
rs_d2("cgdate")=Now()
rs_d2("jy")=1
rs_d2.update
end if
   rsTest0.MoveNext
Wend
rsTest0.UpdateBatch
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where id =2 "
rs.open sql,conn2,2,3
rs("jygj")=0.77
rs("zgj")=0.77
rs("zdj")=0.77
rs.update
%>
<%
response.Write "<script language=javascript>alert('拆分成功！');location.replace('searchg0701.asp');</script>"
%>