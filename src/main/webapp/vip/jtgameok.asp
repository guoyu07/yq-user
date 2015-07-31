<!--#include file="../ct0618.asp"-->
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
end if
%>
<%
tgpay=request("cjpay")
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
elseif tgpay+0<0 or tgpay+0=0 or tgpay<100 then
   response.write "<script language='javascript'>"
   response.write "alert('你好，你充值数量不能小于零或单笔充值数量不能小于100积分，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('你好，你充值数量不能大于你剩余积分数量 "&rs("jyg")&" ，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-(tgpay+0)
   rs("ga")=rs("ga")+(tgpay+0)
   rs.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("mcsl")=tgpay
rs_d1("sysl")=rs("jyg")
rs_d1("bz")="游戏充值"
rs_d1("jy")=1
rs_d1.update
%>
<% 
response.redirect"http://p.cfjte.com/Manage/Pay/RuiPay/r.aspx?user="&username&"&paymoney="&tgpay&""
%>
