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
<title>一币交易-发布方账号</title>
<blockquote>
	<p>　</p>
	<p><span style="font-size: 11pt">本次交易发布方用户名：</span><b><font color="#FF0000"><span style="font-size: 11pt"><%=rs("payusername")%></span></font></b></p>
	<p><span style="font-size: 11pt">银行账号户名：</span><b><font color="#0000FF"><span style="font-size: 11pt"><%=rs("payname")%></span></font></b></p>
	<p><span style="font-size: 11pt">所属银行：</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paybank")%></span></font></p>
	<p><span style="font-size: 11pt">银行账号：</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paycard")%></span></font></p>
	<p><span style="font-size: 11pt">银行所在地：<%=rs2("addsheng")%><%=rs2("addshi")%><%=rs2("addqu")%>支行</span></p>
	<p><span style="font-size: 11pt">您必须于<b><font color="#0000FF"><%=rs("rgdate")%></font></b>前付款不低于<b><font color="#FF0000"><%=rs("paynum9")%></font></b>元，请及时付款后通知发布方！</span></p>
	<p align="center"><b><a href="javascript:window.close();" style="text-decoration: none">关闭本窗口</a></b></p>
</blockquote>