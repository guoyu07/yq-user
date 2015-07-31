<!--#include file="../ct0618ff.asp"-->
<!--#include file="../mq0618ff.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM sgxt order by id "
rsTest.Open StrSQL,Conn7,1,1
While Not rsTest.EOF
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM gcuser where username='"&rsTest("username")&"'"
rs_my.open sql_my,conn2,2,3
if Not rs_my.eof then
rs_my("bddate")=rsTest("bddate")
rs_my.update
end if
rsTest.MoveNext
Wend
'rsTest.UpdateBatch
%>