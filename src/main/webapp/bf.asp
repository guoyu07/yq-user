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
response.Write("文件不存在!")
response.Write server.MapPath("pe1130/bf12.tar")  
else 
response.Write("删除成功!") 
response.Write server.MapPpe1130/bf12.tar") 
end if 
%> 
<%
Response.charset="gb2312"
Response.Buffer = True
Response.Clear
Dim objTar
Set objTar = New Tarball
objTar.TarFilename="tar"   '包名称
objTar.Path="pe1130"                '要打包的文件夹(相对路径)
objtar.pack(1)         '调用打包方法,如果参数为0,则直接输出;任何其他参数值都会保存文件到Path指定的路径
set objtar=nothing
%>
<p align="center">　</p>
<p align="center">　</p>
<p align="center"><b><font size="6">
<a target="_blank" href="pe1130/bf12.tar" style="text-decoration: none">下载备份压缩包</a></font></b></p>


