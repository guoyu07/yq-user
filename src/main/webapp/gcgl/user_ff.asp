<!--#include file="../ct0618000.asp"-->
<%
ffuser=request("ff")
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser order by id"
rsTest.Open StrSQL,Conn2,1,3
While Not rsTest.EOF
ffname=rsTest("username")
rsTest("dlpay")=rsTest("dlpay")+rsTest("jjpay")+rsTest("jbpay")+rsTest("jypay")
'rs.update
rsTest.MoveNext
Wend
rsTest.UpdateBatch
response.Write "�û������޸��ɹ���--"&ffname&""
response.end
%>