<%
if request.cookies("regid")="" or request.cookies("lsyh")="" then
   session.timeout=10
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请重试！！');"
   response.write "window.location.replace('gmjl.asp');"
   response.write "</script>" 
   response.end
else
   regid=request.cookies("regid")
end if
%>
<!--#include file="../shopmfh.asp"-->
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from cfuser where username ='"&regid&"'"
rs.open sql,conn1,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("dlgmjl")=0 or rs("dlgmjl")<0 then
   response.write "<script language='javascript'>"
   response.write "alert('你的实物卡库存为零不能办理销售和录入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("dlgmjl")<"&dlgm&" then
   response.write "<script language='javascript'>"
   response.write "alert('你的录入的数量不能大于现在实物卡库存数量！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end  
end if
%>
<%
user=request("sjuser")
dlgm=request("dlgm")
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from cfuser where username ='"&user&"'"
rs0.open sql0,conn1,1,1
if rs0.eof and rs0.bof or rs0("jb")<>1 then
   response.write "<script language='javascript'>"
   response.write "alert('该用户没有商家资格，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
if rs("jb")=3 and rs0("addshi")<>rs("addshi") then
   response.write "<script language='javascript'>"
   response.write "alert('不是您本市["&rs("addshi")&"]区域内的商家，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jb")=4 and rs0("addqu")<>rs("addqu") then
   response.write "<script language='javascript'>"
   response.write "alert('不是您本区/县["&rs("addqu")&"]区域内的商家，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<% 
response.cookies("lsyh")="120"
response.cookies("dlgm")=dlgm
%>
<html>
<head>
<title></title>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center">

　<p>　</p>

<p>　</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">你在操作的是销售录入</font><font style="font-size: 20pt; font-weight: 700" color="#008000">实物卡</font><font style="font-size: 20pt; font-weight: 700" color="#800000">，请再次确认以下资料是否正确。</font></p>
<table border="1" width="42%" id="table1" height="68" style="border-collapse: collapse">
	<tr>
		<td>
		<p align="left" style="line-height: 200%; margin-top: 2px; margin-bottom: 2px">
		<font size="4">供货代理商<b>(您)</b>编号：<b><font color="#FF0000"><%=regid%></font></b></font></td>
	</tr>
	<tr>
		<td>
		<p style="line-height: 200%; margin-top: 2px; margin-bottom: 2px" align="center">
		<font size="4">向商家<b><font color="#0000FF"><%=user%></font></b>销售<b><font color="#FF00FF"><%=dlgm%>张</font></b>实物卡</font></td>
	</tr>
	</table>
<p style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><b><font size="6">
<a onClick="return confirm('提示：您确定了吗？ ') " href="dllyok.asp?id=<%=user%>" style="text-decoration: none"><font size="5" face="黑体">确认无误</font></a></font></b><font color="#FF6600" style="font-size: 12pt; font-weight: 700">&nbsp;&nbsp;&nbsp;&nbsp; </font>
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></div>
</body>
</html>