<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
bduser=request("uid")
czy=request("czy")
cjpay=request("cj")
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&bduser&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof or rs("sjb")>0 then
   response.write "<script language='javascript'>"
   response.write "alert('该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
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
if cjpay=500 then
   zjjb=200
   sjb=1
   fd=2000
   zjgc=0
elseif cjpay=1000 then
   zjjb=400
   sjb=2
   fd=4000
   zjgc=10
elseif cjpay=2000 then
   zjjb=900
   sjb=4
   fd=8000
   zjgc=20
elseif cjpay=5000 then
   zjjb=2400
   sjb=10
   fd=20000
   zjgc=50
elseif cjpay=10000 then
   zjjb=5000
   sjb=20
   fd=40000
   zjgc=100
elseif cjpay=20000 then
   zjjb=11000
   sjb=40
   fd=80000
   zjgc=200
elseif cjpay=50000 then
   zjjb=30000
   sjb=100
   fd=200000
   zjgc=500
end if
%>
<%
'配送金币，增加记录
rs("sjb")=sjb '我的单数
rs("jydb")=zjjb+rs("jydb")
rs("cjtj")=rs("cjtj")+cjpay
rs("gdgc")=rs("gdgc")+zjgc
rs("gmdate")=now()
rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=bduser
rs_d1("regid")="消费"&cjpay&"送"&zjjb&"金币"
rs_d1("jyjz")=zjjb
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
%>
<%
if cjpay>500 then
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM gcfh"
rs_d3.open sql_d3,conn2,2,3
rs_d3.addnew
rs_d3("userid")=bduser
rs_d3("sygc")=zjgc
rs_d3("ljgc")=rs("gdgc")
rs_d3("bz")="充值"&cjpay&"赠送分红股权"
rs_d3.update
end if
%>
<%
set rs10=server.createobject("adodb.recordset")
  sql10="select * from gcuser where username = '"&rs("up")&"'"
  rs10.open sql10,conn2,2,3
  rs10("pay")=rs10("pay")+(0.1*cjpay)
  rs10("cbpay")=rs10("cbpay")+(0.1*cjpay)
  rs10.Update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs("up")
rs_d2("regid")="用户一"&bduser&"消费"&cjpay&""
rs_d2("syjz")=0.1*cjpay
rs_d2("pay")=rs10("pay")
rs_d2("jydb")=rs10("jydb")
rs_d2.update
%>
<%
response.cookies("lsyh")=""
response.cookies("fhgc")="110119"
'response.Write "<script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='mlt.asp?my="&bduser&"&sjb="&sjb&"'</script>"
'response.Write "<script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='http://ximenabc.5.100new.net/login/cjpay.asp?dl="&bduser&"&cj="&cjpay&"&cjtj="&rs("cjtj")&"&cz="&czy&"'</script>"
response.redirect "http://ximenabc.5.100new.net/login/cjpay.asp?dl="&bduser&"&cj="&cjpay&"&cjtj="&rs("cjtj")&"&cz="&czy&""
%>