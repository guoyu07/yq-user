<%
'if request.cookies("jhjbkid")="" then
   'response.write "<script language='javascript'>"
   'response.write "alert('�˺Ż��������');"
   'response.write "gmjh.asp"
   'response.write "</script>"
   'response.end
'else
   jhjbkid=request.cookies("jhjbkid")
   response.cookies("gpa")="12345"
'end if
%>
<!--#include file="../shopmfh.asp"-->
<%
pdid=request("id")
pdpa=request("pa")
fwid=request("fw")
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from ejbk where pdid = '"&pdid&"'" 
rs.open sql,conn0,1,1
if rs("gpa")<2 then
   response.redirect "ckpa.asp?id="&pdid&"&pa="&pdpa&"&fw="&fwid&""
   response.end
elseif rs("gpa")>1 then
   response.Write "<script language=javascript>alert('���ϴ��Ѿ��鿴���ÿ����룬��������ѹ��������ͻ����벻Ҫ����������룡');</script>"
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<div align="center">
	��<p>��</p>
	<table border="0" width="52%" id="table1" height="120">
		<tr>
			<td><b>��ã����ϴ��Ѳ鿴�������ѱ��<font color="#FF0000"><%=pdid%></font>�ĵ�¼����</b><p>
			<b>����Ѿ�����������ͻ����ϣ��벻Ҫ����������롣</b>
			 
			</p>
			<p align="center">��<p align="center">
			<a href="czpa.asp?id=<%=pdid%>&pa=<%=pdpa%>&fw=<%=fwid%>" style="text-decoration: none">�ͻ�������������룬�Ҿ����ٴ�<font color="#FF0000">��������</font>��</a><p align="center">��<p align="center">
			<a href="gmjh.asp?jh=<%=jhjbkid%>" style="text-decoration: none; font-weight: 700"><font size="4" color="#FF0000">�����õ������</font></a></td>
		</tr>
	</table>
	<p align="center">��</p>
	<table border="0" width="45%" id="table2" cellspacing="1">
		<tr>
			<td width="204" rowspan="2">
			<img border="0" src="tixing.jpg" align="right"></td>
			<td>��</td>
		</tr>
		<tr>
			<td><font color="#008000"><b>&nbsp;</b></font><b><font color="#008000">�ñ�Ų�δ����</font></b></td>
			</tr>
		</table>
	</div>