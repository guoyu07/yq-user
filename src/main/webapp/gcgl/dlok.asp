<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dldiy=request("dldiy")
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&dldiy&"'"
rs1.open sql1,conn2,2,3
if rs1("dldate")<>"" or rs1("dqdate")<>"" then
rs1("jb")=trim(request("jb"))
rs1("dqdate")=trim(request("dqdate"))
rs1.update
else
response.Write "<script language=javascript>alert('还不是正式管理不可以修改！');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
response.end
end if
%>
<%
response.Write "<script language=javascript>alert('修改成功！');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
response.end
%>