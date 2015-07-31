<!--#include file="../shopmfh.asp"-->
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM ejbk where up='gx001'"
rsTest.Open StrSQL, Conn0,2,3
While Not rsTest.EOF
    rsTest("up")="cgfhk"
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('É¾³ý·µÀû³É¹¦£¡');</script>"
response.end
%>