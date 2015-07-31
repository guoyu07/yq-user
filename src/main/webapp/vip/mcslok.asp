<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
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
tgpay=request("sl")
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
elseif rs("bddate")+100>Now() and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM sgxt where username = '"&username&"'"
rs_my.open sql_my,conn7,2,3
if not rs_my.eof then
if rs_my("mqfh")>0 and rs_my("mqfh")<rs_my("zfh") and rs_my("new")>0 and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
%>
<%
if rs("stopjyg")>19 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 or tgpay>2000 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您卖出数量不能小于零或单笔卖出数量不能大于2000积分，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您卖出数量不能大于您剩余积分数量 "&rs("jyg")&" ，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-(tgpay+0)
   rs("stopjyg")=rs("stopjyg")+1
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
rs_d1("pay")=request("gj")
rs_d1("bz")="卖出挂牌中"
rs_d1("jypay")=int(tgpay*request("gj")*1+0.1)/1
rs_d1.update
%>
<% 
response.Write "<script language=javascript>alert('卖出挂牌成功！');location.replace('gpjy.asp');</script>"
%>