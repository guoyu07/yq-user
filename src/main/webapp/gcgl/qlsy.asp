<!--#include file=../dt0618.asp-->
<!--#include file="checkadmin.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
jybh=request("paysy")
tx=request("tx")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn9,2,3
%>
<div align="center">
��<table border="0" width="50%" id="table2">
		<tr>
			<td><span style="font-size: 11pt">�û�����</span><b><font color="#FF0000"><span style="font-size: 11pt"><%=rs("payusername")%></span></font></b><p><span style="font-size: 11pt">�����˺Ż�����</span><b><font color="#0000FF"><span style="font-size: 11pt"><%=rs("payname")%></span></font></b></p>
			<p><span style="font-size: 11pt">�������У�</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paybank")%></span></font></p>
			<p><span style="font-size: 11pt">�����˺ţ�</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paycard")%></span></font></p>
			<p><span style="font-size: 11pt">���<b><font color="#FF0000"><%=rs("paynum9")%></font></b>Ԫ��</span><a onClick="return confirm('��ʾ����ȷ���������� ')" href="sytxok.asp?payid=<%=jybh%>&tx=<%=tx%>" style="text-decoration: none">�Ѹ���������</a></p>
			</td>
		</tr>
	</table>
</div>