<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
regid=request("diyid")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&regid&"'"
rs.open sql,conn2,2,3
rs("gwuid")=request("sjid")
rs.update
if rs("gwuid")=0 then
   response.Write "<script language=javascript>alert('���ù�����ҳɹ���');location.href='searchg0701.asp';</script>"
   response.end
elseif rs("gwuid")>0 then
   response.Write "<script language=javascript>alert('���ú�����ҳɹ���');location.href='searchg0701.asp';</script>"
   response.end
end if
%>