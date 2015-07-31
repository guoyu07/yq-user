<!--#include file="../shopmfh.asp"-->
<% 
jbkid=request("jbkid")
set rs0=server.CreateObject("adodb.recordset")
sql0="select * from ejbk where pdid = '"&jbkid&"'"
rs0.open sql0,conn0,2,3
rs0("up")=trim(request("up"))
rs0("bf2")=trim(request("bf2"))
rs0.update
response.Write "<script language=javascript>alert('资料修改成功！');location.href='jbkgluser.asp?jbkuser="&jbkid&"';</script>"
response.end
%>