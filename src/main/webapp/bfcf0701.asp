<!--#include file=4008.asp-->
<!--#include file=gcgl/checkadmin.asp-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
dim FSO1
set FSO1=server.CreateObject("Scripting.FileSystemObject")
if FSO1.DeleteFile(server.MapPath("001/cf9dl.zip")) then     
FSO1.DeleteFile
server.MapPath(Furl),true
set FSO1=nothing
response.Write("�ļ�������!")
response.Write server.MapPath("001/cf9dl.zip")
else
response.Write("ɾ���ɹ�!")
response.Write server.MapPath("001/cf9dl.zip")
end if
%>
<% 
dim FSO2
set FSO2=server.CreateObject("Scripting.FileSystemObject")
if FSO2.DeleteFile(server.MapPath("001/cftogo.zip")) then
FSO2.DeleteFile
server.MapPath(Furl),true
set FSO2=nothing
response.Write("�ļ�������!")
response.Write server.MapPath("001/cftogo.zip")
else
response.Write("ɾ���ɹ�!")
response.Write server.MapPath("001/cftogo.zip")
end if
%>
<%
Response.charset="gb2312"
Response.Buffer = True
Response.Clear
Dim objTar1
Set objTar1 = New Tarball
'objTar1.TarFilename="gcuser.zip"   '������
objTar1.Path="cf9dl"                'Ҫ������ļ���(���·��)
objTar1.OutPath="001"		'ѹ���ļ�����Ŀ¼
objTar1.TarFilename="cf9dl.zip" 'ѹ���ļ������ļ� ���������ڸ�ʽ����������滻
objtar1.pack(1)         '���ô������,�������Ϊ0,��ֱ�����;�κ���������ֵ���ᱣ���ļ���Pathָ����·��====
set objtar1=nothing
%>
<%
Response.charset="gb2312"
Response.Buffer = True
Response.Clear
Dim objTar2
Set objTar2 = New Tarball
'objTar2.TarFilename="gcuser.zip"   '������
objTar2.Path="cftogo"                'Ҫ������ļ���(���·��)
objTar2.OutPath="001"		'ѹ���ļ�����Ŀ¼
objTar2.TarFilename="cftogo.zip" 'ѹ���ļ������ļ� ���������ڸ�ʽ����������滻
objtar2.pack(1)         '���ô������,�������Ϊ0,��ֱ�����;�κ���������ֵ���ᱣ���ļ���Pathָ����·��====
set objtar2=nothing
%>
<p align="center">��</p>
<p align="center">��</p>
<p align="center"><b><font size="6"><a href="001/cf9dl.zip" style="text-decoration: none">���ر���ѹ����(1)</a></font></b></p>
<p align="center"><b><font size="6"><a href="001/cftogo.zip" style="text-decoration: none">���ر���ѹ����(2)</a></font></b></p>