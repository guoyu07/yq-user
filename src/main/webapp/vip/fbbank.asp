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
<title>һ�ҽ���-�������˺�</title>
<blockquote>
	<p>��</p>
	<p><span style="font-size: 11pt">���ν��׷������û�����</span><b><font color="#FF0000"><span style="font-size: 11pt"><%=rs("payusername")%></span></font></b></p>
	<p><span style="font-size: 11pt">�����˺Ż�����</span><b><font color="#0000FF"><span style="font-size: 11pt"><%=rs("payname")%></span></font></b></p>
	<p><span style="font-size: 11pt">�������У�</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paybank")%></span></font></p>
	<p><span style="font-size: 11pt">�����˺ţ�</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paycard")%></span></font></p>
	<p><span style="font-size: 11pt">�������ڵأ�<%=rs2("addsheng")%><%=rs2("addshi")%><%=rs2("addqu")%>֧��</span></p>
	<p><span style="font-size: 11pt">��������<b><font color="#0000FF"><%=rs("rgdate")%></font></b>ǰ�������<b><font color="#FF0000"><%=rs("paynum9")%></font></b>Ԫ���뼰ʱ�����֪ͨ��������</span></p>
	<p align="center"><b><a href="javascript:window.close();" style="text-decoration: none">�رձ�����</a></b></p>
</blockquote>