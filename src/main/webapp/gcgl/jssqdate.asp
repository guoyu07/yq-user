<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dim rs_js,sql_js
set rs_js = Server.CreateObject("ADODB.Recordset")
sql_js="select * from fcxt where id =2 "
rs_js.open sql_js,conn2,1,1
if Now()>rs_js("jsdate") then
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "<center>"
   Response.write "<a onClick=""return confirm('提示：您确定了吗？')"" href='sgjs.asp';>执行双区计算</a> "
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
else
   response.write "<script language='javascript'>"
   response.write "alert('还没有到结算时间（每星期二22点后）！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>