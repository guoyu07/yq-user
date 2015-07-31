<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM sgxt where sjb>10 and id>1076 and new>0"
rsTest.Open StrSQL,Conn7,1,1
While Not rsTest.EOF
Set rs_ld = Server.CreateObject("ADODB.Recordset") 
sql_ld ="select * from sgxtms where username ='"&rsTest("username")&"'"
rs_ld.open sql_ld,conn7,2,3
rs_ld("bddate")=rsTest("bddate")
rs_ld.update
rsTest.MoveNext
'Wend
'rsTest.UpdateBatch
%>
