<!--#include file="ctshop.asp"-->
<%
temusername=request("gguser")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&temusername&"'"
rs.open sql,conn2,1,1
if not rs.eof then
response.write "<script>alert('对不起，用户名："&temusername&"，已经被注册了！');location.href='javascript:self.close()'</script>"
else
response.write "<script>alert('恭喜，您可以注册用户名："&temusername&"');location.href='javascript:self.close()'</script>"
end if
%>