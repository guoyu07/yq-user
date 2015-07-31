<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
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
   jybh=request("id")
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where id ="&jybh&""
rs_my.open sql_my,conn2,2,3
mypay=rs_my("jypay")
mcsl=rs_my("mcsl")
if rs_my("jy")<>2 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('非法操作，请检查后再试！');location.href='gpjysc.asp'</script>"
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
elseif mypay+0<0 or mypay+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，金币余额不能小于零，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif mypay+0>rs("jydb") or rs("jydb")<1 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，本次交易金币大于您剩余金币 "&rs("jydb")&"，暂时不能交易，请充值或转换金币，谢谢！');"
   response.write "location.replace('jztojb.asp');"
   response.write "</script>" 
   response.end
else
   rs("jydb")=rs("jydb")-mypay
   rs("jyg")=rs("jyg")+mcsl
   rs.update
   rs_my("bz")="卖出成功"
   rs_my("cgdate")=Now()
   rs_my("jy")=1
   rs_my("dfuser")=username
   rs_my.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("mysl")=mcsl
rs_d1("sysl")=rs("jyg")
rs_d1("pay")=rs_my("pay")
rs_d1("jypay")=rs_my("jypay")
rs_d1("bz")="买入成功"
rs_d1("cgdate")=rs_my("cgdate")
rs_d1("jy")=1
rs_d1("dfuser")=rs_my("username")
rs_d1.update
%>
<%
if rs_my("pay")<1 then
   mcdj="0"&rs_my("pay")
else
   mcdj=rs_my("pay")
end if
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=rs("username")
rs_d2("dbjc")=mypay
rs_d2("pay")=rs("pay")
rs_d2("jydb")=rs("jydb")
rs_d2("regid")="买入"&rs_my("username")&"-积分"&mcsl&"-单价"&mcdj&""
rs_d2.update
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from gcuser where username ='"&rs_my("username")&"'"
rs_mc.open sql_mc,conn2,2,3
dqpay=rs_my("jypay")*0.9
mc70a=0.7*dqpay
mc70=int(mc70a*1+0.1)/1
mc30a=0.3*dqpay
mc30=int(mc30a*1+0.1)/1
rs_mc("pay")=rs_mc("pay")+mc70
'rs_mc("vippay")=rs_mc("vippay")+mc70
rs_mc("cbpay")=rs_mc("cbpay")+mc70
rs_mc("jydb")=rs_mc("jydb")+mc30
rs_mc("stopjyg")=rs_mc("stopjyg")-1
rs_mc.update
%>
<%
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM datepay"
rs_d3.open sql_d3,conn9,2,3
rs_d3.addnew
rs_d3("username")=rs_mc("username")
rs_d3("syjz")=mc70
rs_d3("pay")=rs_mc("pay")
rs_d3("jydb")=rs_mc("jydb")
rs_d3("jyjz")=mc30
rs_d3("regid")="卖出"&mcsl&"积分单价"&mcdj&"到"&username&""
rs_d3.update
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,2,3
rs1("syjygsl")=rs1("syjygsl")-mcsl
rs1("jygsl")=rs1("jygsl")+mcsl
rs1("jy5w")=rs1("jy5w")+mcsl
'rs1("jy5w")=20000
rs1.update
%>
<% 
response.Write "<script language=javascript>alert('买入"&mcsl&"积分成功！');location.replace('gpjysc.asp');</script>"
%>