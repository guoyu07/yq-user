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
response.Write("文件不存在!")
response.Write server.MapPath("001/cf9dl.zip")
else
response.Write("删除成功!")
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
response.Write("文件不存在!")
response.Write server.MapPath("001/cftogo.zip")
else
response.Write("删除成功!")
response.Write server.MapPath("001/cftogo.zip")
end if
%>
<%
Response.charset="gb2312"
Response.Buffer = True
Response.Clear
Dim objTar1
Set objTar1 = New Tarball
'objTar1.TarFilename="gcuser.zip"   '包名称
objTar1.Path="cf9dl"                '要打包的文件夹(相对路径)
objTar1.OutPath="001"		'压缩文件保存目录
objTar1.TarFilename="cf9dl.zip" '压纹文件保存文件 可以用日期格式随机数自行替换
objtar1.pack(1)         '调用打包方法,如果参数为0,则直接输出;任何其他参数值都会保存文件到Path指定的路径====
set objtar1=nothing
%>
<%
Response.charset="gb2312"
Response.Buffer = True
Response.Clear
Dim objTar2
Set objTar2 = New Tarball
'objTar2.TarFilename="gcuser.zip"   '包名称
objTar2.Path="cftogo"                '要打包的文件夹(相对路径)
objTar2.OutPath="001"		'压缩文件保存目录
objTar2.TarFilename="cftogo.zip" '压纹文件保存文件 可以用日期格式随机数自行替换
objtar2.pack(1)         '调用打包方法,如果参数为0,则直接输出;任何其他参数值都会保存文件到Path指定的路径====
set objtar2=nothing
%>
<p align="center">　</p>
<p align="center">　</p>
<p align="center"><b><font size="6"><a href="001/cf9dl.zip" style="text-decoration: none">下载备份压缩包(1)</a></font></b></p>
<p align="center"><b><font size="6"><a href="001/cftogo.zip" style="text-decoration: none">下载备份压缩包(2)</a></font></b></p>