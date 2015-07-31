<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("ep")
   epnm=request("epnm3")
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from txpay where payid ="&jybh&""
rs_mc.open sql_mc,conn1,2,3
txpay=rs_mc("paynum")
fbuser=rs_mc("payusername")
if rs_mc("ep")<>1 or rs_mc("kjygid")<>0 or rs_mc("zftime")<>"" then
   response.Write "<script language=javascript>alert('The EP transaction or transactions by its people has been a success, can not be repeated, please choose other deals!');location.href='epjysc.asp'</script>"
   response.end
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("password3")<>epnm then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you two password is incorrect, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you are not dual-zone player is temporarily unavailable EP finance function!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("jyg")+0<txpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, insufficient number of your points"&txpay&"(Subscription EP's integrity as gold), is temporarily unable to function using EP Money!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   'rs("pay")=rs("pay")+rs_mc("paynum")
   rs("jyg")=rs("jyg")-txpay
   rs.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("mcsl")=txpay
rs_d1("sysl")=rs("jyg")
rs_d1("bz")="Freeze - Call a currency-"&rs_mc("paynum")&"Honesty gold-"&rs_mc("payusername")&""
rs_d1("cgdate")=Now()
rs_d1("jy")=1
rs_d1("dfuser")=rs_mc("payid")
rs_d1("newjy")=1
rs_d1.update
%>
<%
rs_mc("ep")=1
rs_mc("rgdate")=Now()+0.083
rs_mc("dfuser")=rs("username")
rs_mc("kjygid")=txpay
rs_mc.update
%>
<%
response.Write "<script language=javascript>alert('Call a single currency-"&rs_mc("paynum")&"Successful, your timely payments, establish credibility trading channels!');location.replace('epmyjl.asp');</script>"
response.end
%>