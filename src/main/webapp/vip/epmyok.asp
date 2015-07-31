<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
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
   response.Write "<script language=javascript>alert('该一币交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！');location.href='epjysc.asp'</script>"
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
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("password3")<>epnm then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您的二级密码不正确，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您还不是双区玩家，暂时不能使用一币理财功能！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("jyg")+0<txpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您的积分数量不足"&txpay&"（认购一币作为诚信金），暂时不能使用一币理财功能！');"
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
rs_d1("bz")="冻结-认购一币-"&rs_mc("paynum")&"诚信金-"&rs_mc("payusername")&""
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
rs.close
set rs=Nothing
rs_mc.close
set rs_mc=Nothing
conn1.close
set conn1=nothing
conn2.close
set conn2=nothing
response.Write "<script language=javascript>alert('下单认购一币-"&txpay&"成功，请您及时付款，建立诚信交易渠道！');location.replace('epmyjl.asp');</script>"
response.end
%>