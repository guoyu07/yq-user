<!--#include file="../ctshop.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dqu=rs("dqu")
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="�й�һ�����ٺš��ͷ�QQ��613697151"
   qq=613697151
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="�й�һ�����ںš��ͷ�QQ��613697152"
   qq=613697152
end if
%>
<p align="center"><b><font size="7" color="#008000">һ��-����ר��</font></b></p>
<p align="center"><span style="font-size: 11pt">���κ���������ϵ��<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"></a><b><font size="2" color="#FF0000">&nbsp;��Ҫ��ʾ������û��100%���н������������У�</font></b></p>
<p align="center"><b><font color="#008000">˵����</font><font size="2" color="#FF00FF">ÿ����һ�ν�Ϊ��1�����֣����ͼƬ�������������л�����ѻ�ã����к���������ϵ�ͷ��ύ�����ջ���ַ����������ѯ��</font></b></p>
<p align="center"><font size="2" color="#0000FF"><b>���²�Ʒ���ɵ����������ṩ�������ɹ����Ե�����ʵ�ʿ��Ϊ׼���޻��������Ʋ�Ʒ���ͣ���ƷͼƬΪ�ο�����ϸ��ʵ��Ϊ׼��</b></font></p>
<table border="1" width="100%" id="table9" cellpadding="2" height="260" bordercolor="#FF00FF">
	<tr>
		<td align="center"><iframe name="I61" src="epcp01.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I62" src="epcp02.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I63" src="epcp03.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I64" src="epcp04.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table1" cellpadding="2" height="260" bordercolor="#FFFF00">
	<tr>
		<td align="center"><iframe name="I1" src="epcp05.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I2" src="epcp06.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I3" src="epcp08.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I4" src="epcp09.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
<table border="1" width="100%" id="table2" cellpadding="2" height="260" bordercolor="#FF00FF">
	<tr>
		<td align="center"><iframe name="I5" src="epcp10.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I6" src="epcp11.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I7" src="epcp12.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
		<td align="center"><iframe name="I8" src="epcp13.asp" scrolling="no" border="0" frameborder="0" marginwidth="1" marginheight="1" height="260" width="100%"></iframe></td>
	</tr>
	</table>
	<p align="center"><b><font color="#008000">˵����</font><font size="2" color="#FF00FF">ÿ����һ�ν�Ϊ��1�����֣����ͼƬ�������������л�����ѻ�ã����к���������ϵ�ͷ��ύ�����ջ���ַ����������ѯ��</font></b></p>
	<p>��</p>
