<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
payid=request("payid")
   dim sql
   dim rs
   set rs=server.createobject("adodb.recordset")
   sql="select * from txpay  where payid = '" & payid & "' "
   sql="update txpay set payonoff='已经转账',zftime=now(),clip='"&Request.ServerVariables("REMOTE_ADDR")&"',ep=0 where payid="&request("payid")&""
   rs.open sql,conn9,2,3
%>
<%
   dim sql1
   dim rs1
   set rs1=server.createobject("adodb.recordset")
   sql1="select * from txpay  where payid = " & payid & " "
   rs1.open sql1,conn9,1,1
%>
<%
   dim sql0
   dim rs0
   set rs0=server.createobject("adodb.recordset")
   sql0="select * from datepay  where id = " &rs1("qlid")& " "
   rs0.open sql0,conn9,2,3
   rs0("regid")=rs0("regid")&"-"&now()
   rs0("txbz")=0
   'rs0("regid")="退回-"&now()
   rs0.update
%>
<%
   set rs2=server.createobject("adodb.recordset")
   sql2="select * from gcuser where username = '" &rs1("payusername")& "'"
   rs2.open sql2,conn2,2,3
   rs2("payok")=0
   'rs2("txdate")=abcd
   rs2.Update
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where name='"&rs2("name")&"' and userid='"&rs2("userid")&"' order by id asc"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("payok")=0
'rsTest("txdate")=abcd
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<p align="center">　</p>
<p align="center">　</p>
<p align="center">　</p>
<p align="center"><span style="font-size: 20pt">已处理该会员</span><font color="#0000FF"><span style="font-size: 25pt; font-weight: 700"> <%=rs1("paynum")%> </span></font><span style="font-size: 20pt">元支付申请!</span></p>
<p align="center">　</p>
<p align="center"><span style="font-size: 20pt"><a href="<%=request("tx")%>.asp" style="text-decoration: none"><font color="#FF0000">返 回</font></a></span></p>