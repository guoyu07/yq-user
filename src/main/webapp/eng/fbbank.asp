<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
jybh=request("fb")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn1,1,1
%>
<%
dim rs2,sql2
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 ="select * from gcuser where username ='"&rs("payusername")&"'"
rs2.open sql2,conn2,1,1
%>

<title>A currency - Trading - Release party account</title>
<blockquote>
	<p>¡¡</p>
	<p><span style="font-size: 11pt">The transaction publisher Username:</span><b><font color="#FF0000"><span style="font-size: 11pt"><%=rs("payusername")%></span></font></b></p>
	<p><span style="font-size: 11pt">Bank Account Account Name:</span><b><font color="#0000FF"><span style="font-size: 11pt"><%=rs("payname")%></span></font></b></p>
	<p><span style="font-size: 11pt">Their banks:</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paybank")%></span></font></p>
	<p><span style="font-size: 11pt">Bank account:</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paycard")%></span></font></p>
	<p><span style="font-size: 11pt">Bank location:<%=rs2("addsheng")%><%=rs2("addshi")%><%=rs2("addqu")%>Ö§ÐÐ</span></p>
	<p><span style="font-size: 11pt">You must<b><font color="#0000FF"><%=rs("rgdate")%></font></b>Before payment of not less than<b><font color="#FF0000"><%=rs("paynum9")%></font></b>yuan,Please notify the publisher after payment!</span></p>
	<p align="center"><b><a href="javascript:window.close();" style="text-decoration: none">Close this window</a></b></p>
</blockquote>