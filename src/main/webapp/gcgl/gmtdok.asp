<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�Ѳ����������µ�¼��');"
   response.write "window.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="1200"
end if
%><!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
regid=request("id")
td=request("td")
sl=request("gmsl")
%>
<%
if sl=0 then
   response.write "<script language='javascript'>"
   response.write "alert('��ѡ����������лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM cfuser where username like '"&regid&"'"
rs.open sql,conn,3,2
   rs("gmjl")=sl
   rs("gmpay")=(sl*td)/10
   rs.update
%><p align="center">��</p>
	<p align="center"><b><font size="6" color="#0000FF">����Ա��</font><font size="6" color="#008000"><%=regid%></font><font size="6" color="#0000FF">����</font></b></p>
	<p align="center"><b><font size="6">��ѡ���ͨ����<font color="#FF0000"><%=td%></font></font></b></p>
	<p align="center"><b><font size="6">�����������<font color="#0000FF"><%=sl%></font>��</font></b></p>
<p align="center">��</p>
<p align="center"><font size="7">
<a onClick="return confirm('��ʾ����ȷ������ ')" href="gmuptq.asp?id=<%=regid%>&td=<%=td%>" style="text-decoration: none; font-weight:700">ȷ������</a></font></p>
<p align="center">��</p>