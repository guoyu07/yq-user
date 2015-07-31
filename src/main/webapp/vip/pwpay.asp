<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="http://vip.zgyce.com/vip/kypwe.asp" name="Form">
	<div align="center">
	　<p><font size="6" color="#FF0000">票务接口</font></p>
	<table border="0" id="table1" height="184" width="560">
		<tr>
			<td width="214" align="right">订单号：</td>
			<td width="336" align="left"><font color="#008000"><%=request("order")%><input type="text" name="order" size="20" value="<%=request("order")%>" readonly></font></td>
			</tr>
		<tr>
			<td width="214" align="right">订单金额：</td>
			<td width="336" align="left"><input type="text" name="gwpay" size="20" value="<%=request("gwpay")%>" readonly><%=request("gwpay")%></td>
		</tr>
		<tr>
			<td width="214" align="right">操作事项：</td>
			<td width="336" align="left"><input type="text" name="pid" size="10" value="<%=request("pid")%>" readonly><font size="2">注：1为支付/2为充值</font></td>
		</tr>
		<tr>
			<td width="214" align="right" height="54"><p align="center">　</td>
			<td width="336" align="right" height="54"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定支付" name="B1" onClick="return confirm('提示：您确定了吗？')"  style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	</div>
</form>