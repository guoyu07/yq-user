<!--#include file="../zqcjimg.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
</head>
<body bgcolor="#E8F1FF" text="#000000" topmargin="5" leftmargin="5">
<div id="Content">
	<div class="CurInfo" id="DetailInfo">
		<div id="DetailInfoContent">
			<table style="TABLE-LAYOUT: fixed; border-collapse:collapse" summary="宝贝描述" border="1" bordercolor="#006699" width="100%">
				<tr>
					<td id="ItemDesc" style="WORD-BREAK: break-all; LINE-HEIGHT: normal" bgcolor="#D9E6FF" height="26" background="images/admin_bg_1.gif">
					<p align="center">
					<span style="font-size: 11pt; font-weight: 700">后台管理系统</span></td>
				</tr>
				<tr>
					<td id="ItemDesc" style="WORD-BREAK: break-all; LINE-HEIGHT: normal" bgcolor="#D9E6FF">
					　</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>
<% set rs_pay=server.createobject("adodb.recordset")
   sql_pay="select * from txpay where payonoff='尚未转账'"
   rs_pay.open sql_pay,conn1,1,1
   if rs_pay.eof and rs_pay.bof then
   'response.write"<script>alert('没有会员申请提现!');</script>"
   else
   response.write"<script>alert('注意:有会员申请提现,请查看[会员提现管理]!');</script>"
   end if
%>