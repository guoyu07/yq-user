<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="cfvip.asp"-->
<%
ddyb=request("gwpay")
ybsl=cint(ddyb*1.02/1)
pa2=request("pa01")
pa5=md5(LCase(pa2))
if request("pid")=1 then
   paylb="购物-"&request("order")
   the_title="来自一币商城的订单"
else
   paylb="充值-"&request("order")
   the_title="来自一币商城的充值"
end if
set rs_rj = Server.CreateObject("ADODB.Recordset")
sql_rj = "SELECT * FROM datepay where regid ='"&paylb&"'"
rs_rj.open sql_rj,conn9,1,1
   if not rs_rj.eof then
   response.write "<script language='javascript'>"
   response.write "alert('该订单号已支付完成，请不要重要操作！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
if request("ybf")<>"" then
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&request("user")&"'"
rs1.open sql1,conn2,2,3
if ybsl*1<0 then
   response.write "<script language='javascript'>"
   response.write "alert('订单信息有误，请重新提交！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('输入的用户名不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("password")<>pa5 then
   response.write "<script language='javascript'>"
   response.write "alert('输入的登录密码不正确，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("password3")<>request("pa02") then
   response.write "<script language='javascript'>"
   response.write "alert('输入的二级密码不正确，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("pay")<ybsl*1 then
   response.write "<script language='javascript'>"
   response.write "alert('您的一币余额不足，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end     
else
   rs1("pay")=rs1("pay")-(ybsl+0)
   rs1("vippay")=rs1("vippay")-(ybsl+0)
   rs1("fhpay")=rs1("fhpay")-(ybsl+0)
   rs1("txpay")=rs1("txpay")+(ybsl+0)
   rs1.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs1("username")
rs_d1("jc")=ybsl
rs_d1("pay")=rs1("pay")
rs_d1("jydb")=rs1("jydb")
rs_d1("regid")=paylb
rs_d1("newbz")=10
rs_d1.update
end if

'支付订单成功返回
if request("pid")=1 then
sn=md5(request("order")&"$@@$"&request("gwpay"))
Response.Write "<script language=""JavaScript"">alert('支付成功！');location.replace('http://www.zgybe.com/shop/index.php?act=payment&op=returnyibi&sn="&sn&"&paycode=success&payamount="&request("gwpay")&"&pid=1&order_sn="&request("order")&"');</script>"
Response.End
end if

'支付充值成功返回
if request("pid")=2 then
sn=md5(request("order")&"$@@$"&request("gwpay"))
Response.Write "<script language=""JavaScript"">alert('充值成功！');location.replace('http://www.zgybe.com/shop/index.php?act=payment&op=returnyibi&sn="&sn&"&paycode=success&payamount="&request("gwpay")&"&pid=2&order_sn="&request("order")&"');</script>"
Response.End
end if

end if
%>
<head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
function checkdate()  {
  if (Form.user.value=="") {     alert("请填入您的用户名!");  Form.user.focus();      return false;    }
  if (Form.pa01.value=="") {      alert("请填入您的登录密码!");  Form.pa01.focus();      return false;    }
  if (Form.pa02.value=="") {      alert("请填入您的二级密码!");  Form.pa02.focus();      return false;    }
  	
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("sms.asp", data, function(data) {
		$("#btn").removeAttr("disabled");
		if (data != "success") { alert("手机验证码发送失败"); return false; }
		alert("手机验证码发送成功");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.mcygcode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.mcygcode.focus();   return false;    }
  return true;
} 
</script>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="ybpay.asp?ybf=actok" id="Form" name="Form">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	　<p><font size="6" color="#FF0000"><%=the_title%></font></p>
	<table border="0" id="table1" height="308" width="560">
		<tr>
			<td width="214" align="right">订单号：</td>
			<td width="336" align="left" colspan="2"><font color="#008000"><%=request("order")%><input type="hidden" name="order" size="20" value="<%=request("order")%>"></font></td>
			</tr>
		<tr>
			<td width="214" align="right">订单金额：</td>
			<td width="336" align="left" colspan="2"><input type="hidden" name="gwpay" size="20" value="<%=request("gwpay")%>" readonly><%=request("gwpay")%><input type="hidden" name="sid" size="20" value="<%=request("sid")%>" readonly><input type="hidden" name="pid" size="20" value="<%=request("pid")%>" readonly></td>
		</tr>
		<tr>
			<td width="214" align="right">服务费(2%)：</td>
			<td width="336" align="left" colspan="2"><%=cint(request("gwpay")*0.02/1)%></td>
		</tr>
		<tr>
			<td width="214" align="right">合计一币：</td>
			<td width="336" align="left" colspan="2"><b><font color="#FF0000"><%=cint(ybsl/1)%><input type="hidden" name="ybpay" size="20" value="<%=cint(ybsl/1)%>"></font></b></td>
		</tr>
		<tr>
			<td width="214" align="right">用户名：</td>
			<td width="336" align="left" colspan="2"><b><font color="#0000FF"><input type="text" name="user" size="20"><input type="hidden" name="remark" size="5" value="8" readonly></font></b></td>
			</tr>
		<tr>
			<td width="214" align="right">登录密码：</td>
			<td width="336" align="left" colspan="2"><input type="password" name="pa01" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right">二级密码：</td>
			<td width="336" align="left" colspan="2"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa02" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right" height="30">手机验证码：</td>
			<td width="81" align="right" height="30"><input type="text" name="hgcode" size="10"></td>
			<td width="252" align="right" height="30"><p align="left"><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="46"><p align="center">　</td>
			<td width="336" align="right" height="46" colspan="2"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定支付" name="B1" onClick="{if(confirm('确定支付吗?')){this.style.visibility='hidden';return true;}return false;}" style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p>请不要使用它人账户进行操作，一经发现3倍罚款！</p>
	</div>
</form>