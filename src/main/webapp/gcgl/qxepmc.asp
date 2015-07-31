<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->   
<%
jybh=request("qx")
tx=request("tx")
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from txpay where payid ="&jybh&""
rs_mc.open sql_mc,conn9,2,3
txpay=rs_mc("paynum")
fbuser=rs_mc("payusername")
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&fbuser&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
if rs_mc("ep")>0 or rs_mc("zftime")<>"" or rs_mc("kjygid")<>0 then
   response.Write "<script language=javascript>alert('该EP交易进行中或已经由它人交易成功，暂时不能撤销，或稍后再试！');location.href='"&tx&".asp'</script>"
   response.end
else
   rs("pay")=rs("pay")+(rs_mc("paynum")*1)
   rs("txpay")=rs("txpay")-(rs_mc("paynum")*1)
   rs("mcpay")=rs("mcpay")-(rs_mc("paynum")*1)
   rs("payok")=0
   'rs("txdate")=abcd
   rs.update
dim rs_th,sql_th
set rs_th = Server.CreateObject("ADODB.Recordset")
sql_th="select * from datepay where id ="&rs_mc("qlid")&""
   rs_th.open sql_th,conn9,2,3
   rs_th("regid")=rs_th("regid")&"-已退回(账号有误)"
   rs_th.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("regid")="退回卖出(账号有误)"
rs_d1("syjz")=rs_mc("paynum")
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
   rs_mc("ep")=0
   rs_mc("rgdate")=now()
   rs_mc("payonoff")="已经转账"
   rs_mc("zftime")=now()
   rs_mc("dfuser")="退回"
   rs_mc("clip")=Request.ServerVariables("REMOTE_ADDR")
   rs_mc.update
end if
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where name='"&rs("name")&"' and userid='"&rs("userid")&"' order by id asc"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("payok")=0
'rsTest("txdate")=abcd
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('管理员撤销成功！');location.replace('"&tx&".asp');</script>"
%>