<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "window.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="120"
   cjyh=request("uid")
   cjpay=request("cj")
   cjfs=request("fs")
   czy=request("czy")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM fcxt where cz01 = '"&czy&"' or cz02 = '"&czy&"' or cz03 = '"&czy&"' or cz04 = '"&czy&"' or cz05 = '"&czy&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作员不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&cjyh&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该会员不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
  rs("cjtj")=rs("cjtj")+cjpay
  rs("gmdate")=Now()
  rs.update
end if
%>
<%
if cjpay=5000 and rs("syep")>4999 then
  rs("syep")=rs("syep")-5000
  rs("ljbdb")=rs("ljbdb")+10000
  rs("sybdb")=rs("sybdb")+10000
  rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM bdbdate"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("zuser")=cjyh
rs_d1("sy")=10000
rs_d1("sybdb")=rs("sybdb")
rs_d1("ljbdb")=rs("ljbdb")
rs_d1("bz")="充值5000与EP5000生效"
rs_d1.update
elseif cjpay=10000 and rs("syep")=5000 then
  rs("syep")=rs("syep")-5000
  rs("ljbdb")=rs("ljbdb")+15000
  rs("sybdb")=rs("sybdb")+15000
  rs.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM bdbdate"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("zuser")=cjyh
rs_d2("sy")=15000
rs_d2("sybdb")=rs("sybdb")
rs_d2("ljbdb")=rs("ljbdb")
rs_d2("bz")="充值10000与EP5000生效"
rs_d2.update
elseif cjpay=10000 and rs("syep")>9999 then
  rs("syep")=rs("syep")-10000
  rs("ljbdb")=rs("ljbdb")+20000
  rs("sybdb")=rs("sybdb")+20000
  rs.update
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM bdbdate"
rs_d3.open sql_d3,conn9,2,3
rs_d3.addnew
rs_d3("zuser")=cjyh
rs_d3("sy")=20000
rs_d3("sybdb")=rs("sybdb")
rs_d3("ljbdb")=rs("ljbdb")
rs_d3("bz")="充值10000与EP10000生效"
rs_d3.update
elseif cjpay=15000 and rs("syep")=5000 then
  rs("syep")=rs("syep")-5000
  rs("ljbdb")=rs("ljbdb")+20000
  rs("sybdb")=rs("sybdb")+20000
  rs.update
set rs_d4 = Server.CreateObject("ADODB.Recordset")
sql_d4 = "SELECT * FROM bdbdate"
rs_d4.open sql_d4,conn9,2,3
rs_d4.addnew
rs_d4("zuser")=cjyh
rs_d4("sy")=20000
rs_d4("sybdb")=rs("sybdb")
rs_d4("ljbdb")=rs("ljbdb")
rs_d4("bz")="充值15000与EP5000生效"
rs_d4.update
elseif cjpay=15000 and rs("syep")=10000 then
  rs("syep")=rs("syep")-10000
  rs("ljbdb")=rs("ljbdb")+25000
  rs("sybdb")=rs("sybdb")+25000
  rs.update
set rs_d5 = Server.CreateObject("ADODB.Recordset")
sql_d5 = "SELECT * FROM bdbdate"
rs_d5.open sql_d5,conn9,2,3
rs_d5.addnew
rs_d5("zuser")=cjyh
rs_d5("sy")=25000
rs_d5("sybdb")=rs("sybdb")
rs_d5("ljbdb")=rs("ljbdb")
rs_d5("bz")="充值15000与EP10000生效"
rs_d5.update
elseif cjpay=15000 and rs("syep")>14999 then
  rs("syep")=rs("syep")-15000
  rs("ljbdb")=rs("ljbdb")+30000
  rs("sybdb")=rs("sybdb")+30000
  rs.update
set rs_d6 = Server.CreateObject("ADODB.Recordset")
sql_d6 = "SELECT * FROM bdbdate"
rs_d6.open sql_d6,conn9,2,3
rs_d6.addnew
rs_d6("zuser")=cjyh
rs_d6("sy")=30000
rs_d6("sybdb")=rs("sybdb")
rs_d6("ljbdb")=rs("ljbdb")
rs_d6("bz")="充值15000与EP15000生效"
rs_d6.update
elseif cjpay=20000 and rs("syep")=5000 then
  rs("syep")=rs("syep")-5000
  rs("ljbdb")=rs("ljbdb")+25000
  rs("sybdb")=rs("sybdb")+25000
  rs.update
set rs_d7 = Server.CreateObject("ADODB.Recordset")
sql_d7 = "SELECT * FROM bdbdate"
rs_d7.open sql_d7,conn9,2,3
rs_d7.addnew
rs_d7("zuser")=cjyh
rs_d7("sy")=25000
rs_d7("sybdb")=rs("sybdb")
rs_d7("ljbdb")=rs("ljbdb")
rs_d7("bz")="充值20000与EP5000生效"
rs_d7.update
elseif cjpay=20000 and rs("syep")=10000 then
  rs("syep")=rs("syep")-10000
  rs("ljbdb")=rs("ljbdb")+30000
  rs("sybdb")=rs("sybdb")+30000
  rs.update
set rs_d8 = Server.CreateObject("ADODB.Recordset")
sql_d8 = "SELECT * FROM bdbdate"
rs_d8.open sql_d8,conn9,2,3
rs_d8.addnew
rs_d8("zuser")=cjyh
rs_d8("sy")=30000
rs_d8("sybdb")=rs("sybdb")
rs_d8("ljbdb")=rs("ljbdb")
rs_d8("bz")="充值20000与EP10000生效"
rs_d8.update
elseif cjpay=20000 and rs("syep")>19999 then
  rs("syep")=rs("syep")-20000
  rs("ljbdb")=rs("ljbdb")+40000
  rs("sybdb")=rs("sybdb")+40000
  rs.update
set rs_d9 = Server.CreateObject("ADODB.Recordset")
sql_d9 = "SELECT * FROM bdbdate"
rs_d9.open sql_d9,conn9,2,3
rs_d9.addnew
rs_d9("zuser")=cjyh
rs_d9("sy")=40000
rs_d9("sybdb")=rs("sybdb")
rs_d9("ljbdb")=rs("ljbdb")
rs_d9("bz")="充值20000与EP20000生效"
rs_d9.update
elseif cjpay>4999 then
  rs("ljbdb")=rs("ljbdb")+cjpay
  rs("sybdb")=rs("sybdb")+cjpay
  rs.update
set rs_d10 = Server.CreateObject("ADODB.Recordset")
sql_d10 = "SELECT * FROM bdbdate"
rs_d10.open sql_d10,conn9,2,3
rs_d10.addnew
rs_d10("zuser")=cjyh
rs_d10("sy")=cjpay
rs_d10("sybdb")=rs("sybdb")
rs_d10("ljbdb")=rs("ljbdb")
rs_d10("bz")="充值"
rs_d10.update
else
  rs("pay")=rs("pay")+cjpay
  rs.update
set rs_d11 = Server.CreateObject("ADODB.Recordset")
sql_d11 = "SELECT * FROM datepay"
rs_d11.open sql_d11,conn9,2,3
rs_d11.addnew
rs_d11("username")=cjyh
rs_d11("regid")="充值"
rs_d11("syjz")=cjpay
rs_d11("pay")=rs("pay")
rs_d11("jydb")=rs("jydb")
rs_d11.update
end if
%>
<%
response.cookies("lsyh")=""
response.redirect "/vgo/xjcjpay.asp?dl="&cjyh&"&cj="&cjpay&"&cjtj="&rs("cjtj")&"&cz="&czy&"&fs="&cjfs&""
'response.Write "<script language=javascript>alert('恭喜充值成功。。。！');location.href=''</script>"
%>