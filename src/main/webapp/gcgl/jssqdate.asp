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
   Response.write "<a onClick=""return confirm('��ʾ����ȷ������')"" href='sgjs.asp';>ִ��˫������</a> "
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
   Response.write "</br>"
else
   response.write "<script language='javascript'>"
   response.write "alert('��û�е�����ʱ�䣨ÿ���ڶ�22��󣩣�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>