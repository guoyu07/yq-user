<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jfsl=request("jfsl")
   epsl=request("epsl")
   gwuser=request("gwuser")
   pa3=request("pa3")
   gwno=request("gwno")
   gwid=request("gwid")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
syhg=rs("jjsy")*1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('您好，该订单不是当前登录用户名提交，请重新登录，谢谢！');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>" 
   response.end
elseif rs("password3")<>pa3 then
   response.write "<script language='javascript'>"
   response.write "alert('你好，你二级密码不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif syhg+0<10 or syhg+0=0 or epsl+0>syhg then
   response.write "<script language='javascript'>"
   response.write "alert('您好，消费账户余额不足，暂时不能换购，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")+0<1 or rs("jyg")+0=0 or jfsl+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，积分不足，暂时不能换购，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-(jfsl+0)
   rs("jjsy")=rs("jjsy")-(epsl+0)
   rs("sytx")=rs("sytx")+(epsl+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("mcsl")=jfsl
rs_d1("sysl")=rs("jyg")
rs_d1("abdate")=abcd
rs_d1("bz")="换购-"&gwno
rs_d1("jy")=1
rs_d1("cgdate")=Now()
rs_d1.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM gcfh"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("userid")=rs("username")
rs_d2("syfh")="-"&epsl
rs_d2("ljfhtj")=rs("jjsy")
rs_d2("bz")="换购-"&gwno
rs_d2("sf")=1
rs_d2.update
end if
%>
<%
response.redirect"http://jf.zgyce.com/admin/cfhg_pay.asp?order_info_id="&gwid&""
%>