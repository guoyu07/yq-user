<!--#include file=../zqcjimg.asp-->
<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�Ѳ����������µ�¼��');"
   response.write "top.location.replace('gcgl/ycbdcj.asp');"
   response.write "</script>"
   response.end
end if
%>
<%
dluser=request("dl")
cjpay=request("cj")
cjfs=request("fs")
cjtj=request("cjtj")
czy=request("cz")
%>
<%
dim rs,sql
set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datecj"
rs.open sql,conn1,2,3
rs.addnew
rs("cjuser")=dluser
rs("dqcj")=cjpay
rs("ljcj")=cjtj
rs("cjfs")=cjfs
rs("cz")=czy
rs("ip")=Request.ServerVariables("REMOTE_ADDR")
rs.update
%>
<%
response.cookies("lsyh01")=""
response.cookies("lsyh02")=""
response.cookies("lsyh")=""
response.Write "<script language=javascript>alert('��ϲ��ֵ�ɹ���������');location.href='/gcgl/ycbdcj.asp?dl="&czy&"'</script>"
response.end
%>