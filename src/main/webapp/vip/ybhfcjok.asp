<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="cfvip.asp"-->
<%
gwuser=request("gwuser")
sdcode=request("fhcode")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&gwuser&"'"
rs.open sql,conn2,2,3
if md5(rs("vipsq"))<>sdcode then
   response.write "<script language='javascript'>"
   response.write "alert('测试不成功。。！');"
   response.write "location.replace('datepay.asp');"
   response.write "</script>"
   response.end
elseif rs("hfcjdate")>date() then
   response.write "<script language='javascript'>"
   response.write "alert('正在入账，请您耐心等待！');"
   response.write "location.replace('datepay.asp');"
   response.write "</script>"
   response.end
elseif rs("pay")+0<100 or rs("pay")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，一币不足100，暂时不能充值，谢谢！');"
   response.write "top.location.replace('http://vip.zgyce.com/index.asp');"
   response.write "</script>"
   response.end
else
   rs("pay")=rs("pay")-110
   rs("vippay")=rs("vippay")-110
   rs("fhpay")=rs("fhpay")-100
   rs("txpay")=rs("txpay")+110
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=gwuser
rs_d1("jc")=110
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("regid")="话费-"&request("call")
rs_d1("newbz")=7
rs_d1.update
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=12"
rs2.open sql2,conn2,2,3
rs2("payadd")=rs2("payadd")-1
rs2.update
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where name='"&rs("name")&"' and userid='"&rs("userid")&"' order by id asc"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("hfcjdate")=date()+30
rsTest.MoveNext
Wend
rsTest.UpdateBatch
response.Write "<script language=javascript>alert('手机话费-"&request("call")&"-正在入账，请您耐心等待！');location.replace('datepay.asp');</script>"
%>