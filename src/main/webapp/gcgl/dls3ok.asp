<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dldiy=trim(request("s3"))
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&dldiy&"'"
rs1.open sql1,conn2,2,3
shi=rs1("addshi")
%>
<%
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from gcuser where addshi='"&shi&"'and jb=3 "
rs2.open sql2,conn2,1,1
if not rs2.eof then
   response.Write "<script language=javascript>alert('市级管理已被占用了！');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
   response.end
else
rs1("jb")=3
rs1("dldate")=now()
rs1("dqdate")=now()+90
rs1.update
end if
%>
<%
response.Write "<script language=javascript>alert('设置市级管理成功！');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
response.end
%>