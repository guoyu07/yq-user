<!--#include file008.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<% 
dim FSO
set FSO=server.CreateObject("Scripting.FileSystemObject") 
if FSO.DeleteFile(server.MapPath("pe1130/bf12.tar")) then           
FSO.DeleteFile   
server.MapPath(Furl),true             
set FSO=nothing  
response.Write("�ļ�������!")
response.Write server.MapPath("pe1130/bf12.tar")  
else 
response.Write("ɾ���ɹ�!") 
response.Write server.MapPpe1130/bf12.tar") 
end if 
%> 
<%
Response.charset="gb2312"
Response.Buffer = True
Response.Clear
Dim objTar
Set objTar = New Tarball
objTar.TarFilename="tar"   '������
objTar.Path="pe1130"                'Ҫ������ļ���(���·��)
objtar.pack(1)         '���ô������,�������Ϊ0,��ֱ�����;�κ���������ֵ���ᱣ���ļ���Pathָ����·��
set objtar=nothing
%>
<p align="center">��</p>
<p align="center">��</p>
<p align="center"><b><font size="6">
<a target="_blank" href="pe1130/bf12.tar" style="text-decoration: none">���ر���ѹ����</a></font></b></p>


