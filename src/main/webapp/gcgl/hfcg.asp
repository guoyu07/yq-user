<!--#include file=../dt0618.asp-->
<!--#include file="checkadmin.asp"-->
<%
bh=request("cp")
dim rs_cp,sql_cp
set rs_cp = Server.CreateObject("ADODB.Recordset")
sql_cp="select * from jfcp where cpbh = "&bh&""
rs_cp.open sql_cp,conn9,2,3
if rs_cp("dqjf")<>0 then
   response.write "<script language='javascript'>"
   response.write "alert('还没抢购完成，暂时不可以恢复，目前为："&rs_cp("dqjf")&"！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_cp("dqjf")=rs_cp("zjfsl")
   rs_cp.update
end if
%>
<% 
response.Write "<script language=javascript>alert('恢复成功！');window.location.replace('cgcp.asp');</script>"
%>