<!--#include file="jbk0718.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
Response.charset="gb2312"
Response.Buffer = True
Response.Clear
Dim objTar
Set objTar = New Tarball
objTar.TarFilename="2012.tar"   '包名称
objTar.Path="jbkno"                '要打包的文件夹(相对路径)
objtar.pack(1)         '调用打包方法,如果参数为0,则直接输出;任何其他参数值都会保存文件到Path指定的路径
set objtar=nothing
%>
<p align="center">　</p>
<p align="center">　</p>
<p align="center"><b><font size="6">
<a target="_blank" href="jbkno/2012.tar" style="text-decoration: none">下载备份压缩包</a></font></b></p>