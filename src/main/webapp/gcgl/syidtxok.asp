<!--#include file=../ct0618.asp-->
<%
user=request("userid")
if request("pa02")<>"yc201503yc" then
   response.write "<script language='javascript'>"
   response.write "alert('�������벻��ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from gcuser where username ='"&user&"'"
rs.open sql,conn2,2,3
rs("fhpay")=request("pdid")
rs("vippay")=request("vpay")
rs.update
end if
%>
<%
response.Write "<script language=javascript>alert('�޸ĳɹ���');location.replace('syidtx.asp?userid="&user&"');</script>"
%>