<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
regid=trim(request("z5"))
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from cfuser where username like '"&regid&"'"
rs1.open sql1,conn,2,3
zhen=rs1("addzhen")
%>
<%
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from cfuser where addzhen like '"&zhen&"' and dljb=1 "
rs2.open sql2,conn,1,1
if not rs2.eof then
   response.Write "<script language=javascript>alert('镇级代理已被占用了！');location.href='dluser.asp?regid="&regid&"';</script>"
   response.end
else
rs1("dljb")=1
rs1("dldate")=now()
rs1.update
end if
%>
<%
response.Write "<script language=javascript>alert('设置镇级代理成功！');location.href='dluser.asp?regid="&regid&"';</script>"
response.end
%>