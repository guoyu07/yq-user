<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM mqfh where sjb=0 and mqpay<50 and DateDiff('d',date(),pddate)<0"
rsTest.Open StrSQL, Conn7,2,3
While Not rsTest.EOF
    rsTest("ctpay")=rsTest("mqpay")
    rsTest.update
    rsTest("dqpay")=request("fh")*rsTest("pdlb")
    rsTest("mqpay")=request("fh")*rsTest("pdlb")+rsTest("mqpay")
    rsTest("ljpay")=request("fh")*rsTest("pdlb")+rsTest("ljpay")
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
sql2="select * from fhdate where id = "&request("pdid")&"" 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn7,2,3
  rs2("bz")=2
  rs2.update
%>
<%
response.Write "<script language=javascript>alert('执行普通会员用户分红成功！');location.href='fhjl.asp'</script>"
%>