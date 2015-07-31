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
<p align="center"><b><font size="6">
<a href="bfcf0701.asp" style="text-decoration: none">已修复错误，点这里重新备份</a></font></b></p>