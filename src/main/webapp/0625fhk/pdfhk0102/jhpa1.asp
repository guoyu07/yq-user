<%
if request.cookies("regid")="" then
   session.timeout=30
   response.write "<script language='javascript'>"
   response.write "alert('�����������ù���');"
   response.redirect "gmjl.asp"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")   
end if
%>
<!--#include file="../shopmfh.asp"-->
<!--#include file="jk_md5.asp"-->
<%
pdid=request("id")
pdpa=request("pa")
fwid=request("fw")
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from mgmid where pdid = '"&pdid&"'" 
rs.open sql,conn0,3,2
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����ѱ�Ų����ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("gpa")=rs("gpa")+1
   rs("pdpamd5")=md5(pdpa)
   rs("fwidmd5")=md5(fwid)
   rs.update
end if
%>
<%
response.cookies("gpa")=""
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<p>��</p>
<div align="center">
	<p>��</p>
	<p>��</p>
	<p>��</p>
	<table border="0" width="43%" id="table1" height="120" cellspacing="1">
		<tr>
			<td>
			<p align="center"><font color="#0000FF">
			<a onClick="return confirm('��ʾ�����˼�����Լ�ʹ�ã��������������ͣ���ȷ������ ')" href="chklogin.asp?pdid=<%=pdid%>&pa=<%=pdpa%>&fw=<%=fwid%>" style="text-decoration: none">ȷ������������в�����</a></font></td>
		</tr>
	</table>
	<p align="center">��</p>
	<p align="center">��</p>
	<p><a href="gmjh.asp" style="text-decoration: none; font-weight: 700">
	<font size="4" color="#FF0000">�������</font></a></p>
	<p>��</div>