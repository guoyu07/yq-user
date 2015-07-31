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
end if
%>
<%
sl=request("sl")
jo=request("jo")
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
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
elseif rs("jydb")=0 or rs("jydb")<0 or (jo+0)>rs("jydb") then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，金币不足，请检查输入是否正确！');"
   response.write "location.replace('jztojb.asp');"
   response.write "</script>" 
   response.end
else
   rs("jydb")=rs("jydb")-(jo+0)
   rs.update
end if
%>
<%
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,1,3
rs_d2.addnew
rs_d2("username")=rs("username")
rs_d2("dbjc")=jo
rs_d2("pay")=rs("pay")
rs_d2("jydb")=rs("jydb")
rs_d2("regid")="买入挂牌中"
rs_d2.update
%>
<%
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from datepay where username ='"&rs("username")&"' order by id desc"
rs0.open sql0,conn9,1,1
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,1,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("mysl")=sl
rs_d1("sysl")=rs("jyg")
rs_d1("pay")=request("gj")
rs_d1("bz")="买入挂牌中"
rs_d1("jypay")=int(sl*request("gj")*1+0.1)/1
rs_d1("jyid")=rs0("id")
rs_d1.update
%>
<% 
response.Write "<script language=javascript>alert('买入挂牌成功！');location.replace('gpjy.asp');</script>"
%>