<!--#include file="ctshop.asp"-->
<%
temusername=request("gguser")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&temusername&"'"
rs.open sql,conn2,1,1
if not rs.eof then
response.write "<script>alert('�Բ����û�����"&temusername&"���Ѿ���ע���ˣ�');location.href='javascript:self.close()'</script>"
else
response.write "<script>alert('��ϲ��������ע���û�����"&temusername&"');location.href='javascript:self.close()'</script>"
end if
%>