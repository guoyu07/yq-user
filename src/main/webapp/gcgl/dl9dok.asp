<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dldiy=trim(request("9d"))
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&dldiy&"'"
rs1.open sql1,conn2,2,3
dq=rs1("dqu")
%>
<%
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from gcuser where dqu='"&dq&"' and jb=1 "
rs2.open sql2,conn2,1,1
if not rs2.eof then
   response.Write "<script language=javascript>alert('大区级管理已被占用了！');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
   response.end
else
rs1("jb")=1
rs1("dldate")=now()
rs1("dqdate")=now()+180
rs1.update
end if
%>
<%
response.Write "<script language=javascript>alert('设置大区级管理成功！');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
response.end
%>