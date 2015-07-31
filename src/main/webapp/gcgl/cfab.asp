<!--#include file="../ct06185566.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser "
'StrSQL = "SELECT * FROM gcuser where id>1060 and id<12577"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
'rsTest("cfa")=rsTest("cfa")+1
rsTest("cfc")=rsTest("cfa")
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>