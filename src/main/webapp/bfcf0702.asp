<!--#include file=4008.asp-->
<!--#include file=gcgl/checkadmin.asp-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
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
<p align="center"><b><font size="6">
<a href="bfcf0701.asp" style="text-decoration: none">���޸����󣬵��������±���</a></font></b></p>