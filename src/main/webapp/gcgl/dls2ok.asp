<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dldiy=trim(request("s2"))
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gcuser where username = '"&dldiy&"'"
rs1.open sql1,conn2,2,3
sheng=rs1("addsheng")
%>
<%
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from gcuser where addsheng='"&sheng&"'and jb=2 "
rs2.open sql2,conn2,1,1
if not rs2.eof then
   response.Write "<script language=javascript>alert('ʡ�������ѱ�ռ���ˣ�');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
   response.end
else
rs1("jb")=2
rs1("dldate")=now()
rs1("dqdate")=now()+180
rs1.update
end if
%>
<%
response.Write "<script language=javascript>alert('����ʡ������ɹ���');location.href='dluser.asp?dldiy="&dldiy&"';</script>"
response.end
%>