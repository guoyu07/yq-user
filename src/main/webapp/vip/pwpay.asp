<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="http://vip.zgyce.com/vip/kypwe.asp" name="Form">
	<div align="center">
	��<p><font size="6" color="#FF0000">Ʊ��ӿ�</font></p>
	<table border="0" id="table1" height="184" width="560">
		<tr>
			<td width="214" align="right">�����ţ�</td>
			<td width="336" align="left"><font color="#008000"><%=request("order")%><input type="text" name="order" size="20" value="<%=request("order")%>" readonly></font></td>
			</tr>
		<tr>
			<td width="214" align="right">������</td>
			<td width="336" align="left"><input type="text" name="gwpay" size="20" value="<%=request("gwpay")%>" readonly><%=request("gwpay")%></td>
		</tr>
		<tr>
			<td width="214" align="right">�������</td>
			<td width="336" align="left"><input type="text" name="pid" size="10" value="<%=request("pid")%>" readonly><font size="2">ע��1Ϊ֧��/2Ϊ��ֵ</font></td>
		</tr>
		<tr>
			<td width="214" align="right" height="54"><p align="center">��</td>
			<td width="336" align="right" height="54"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="ȷ��֧��" name="B1" onClick="return confirm('��ʾ����ȷ������')"  style="font-family: ����_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	</div>
</form>