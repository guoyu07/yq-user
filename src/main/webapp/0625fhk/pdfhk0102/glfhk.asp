<%
'if request.cookies("jhjbkid")="" then
   'response.write "<script language='javascript'>"
   'response.write "alert('账号或密码错误！');"
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
   response.Write "<script language=javascript>alert('你上次已经查看过该卡密码，如果密码已过给发给客户，请不要随便重置密码！');</script>"
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<div align="center">
	　<p>　</p>
	<table border="0" width="52%" id="table1" height="120">
		<tr>
			<td><b>你好，你上次已查看过该消费编号<font color="#FF0000"><%=pdid%></font>的登录密码</b><p>
			<b>如果已经把密码给到客户手上，请不要随便重置密码。</b>
			 
			</p>
			<p align="center">　<p align="center">
			<a href="czpa.asp?id=<%=pdid%>&pa=<%=pdpa%>&fw=<%=fwid%>" style="text-decoration: none">客户真的忘记了密码，我决定再次<font color="#FF0000">重置密码</font>！</a><p align="center">　<p align="center">
			<a href="gmjh.asp?jh=<%=jhjbkid%>" style="text-decoration: none; font-weight: 700"><font size="4" color="#FF0000">不重置点击返回</font></a></td>
		</tr>
	</table>
	<p align="center">　</p>
	<table border="0" width="45%" id="table2" cellspacing="1">
		<tr>
			<td width="204" rowspan="2">
			<img border="0" src="tixing.jpg" align="right"></td>
			<td>　</td>
		</tr>
		<tr>
			<td><font color="#008000"><b>&nbsp;</b></font><b><font color="#008000">该编号并未激活</font></b></td>
			</tr>
		</table>
	</div>