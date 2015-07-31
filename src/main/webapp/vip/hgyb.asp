<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="cfvip.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   djsl=request("yb")
   gwuser=request("gwuser")
   gwno=request("gwno")
   gwid=request("gwid")
end if
%>
<%
Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "01235678abcde"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getCode = strCode
End Function
%>
<%
ybsl=djsl*1.02
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if ybsl*1<0 then
   response.write "<script language='javascript'>"
   response.write "alert('订单信息有误，请重新提交！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('您好，该订单不是当前登录用户名提交，请重新登录，谢谢！');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>" 
   response.end
elseif rs("pay")+0<1 or rs("pay")+0=0 or ybsl+0>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，一币不足 "&ybsl&"，暂时不能换购，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("vipsq")=getcode(6)
   rs.update
end if
%>
<%
set rs_rj = Server.CreateObject("ADODB.Recordset")
sql_rj = "SELECT * FROM datepay where regid ='换购-"&gwno&"'"
rs_rj.open sql_rj,conn9,1,1
   if not rs_rj.eof then
   response.write "<script language='javascript'>"
   response.write "alert('该订单号已支付完成，请不要重要操作！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
function checkdate()  {
  if (Form.pa3.value=="") {      alert("请填入您的二级密码!");  Form.pa3.focus();      return false;    }
  if (hex_md5(Form.pa3.value) != "<%=md5(rs("password3"))%>")  {      alert("二级密码不正确!");  Form.pa3.focus();    return false;    }
  	
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
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="hgybok.asp" name="Form" id="Form">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	　<p>　</p>
	<p>　</p>
	<p><input type="hidden" name="ybsl" size="10" value="<%=ybsl%>"><input type="hidden" name="ybfw" size="10" value="<%=djsl*0.02%>"><input type="hidden" name="gwuser" size="10" value="<%=gwuser%>"><input type="hidden" name="gwid" size="10" value="<%=gwid%>"><input type="hidden" name="gwno" size="10" value="<%=gwno%>"></p>
	<table border="0" id="table1" height="289" width="620">
		<tr>
			<td width="210" align="right">用户名：</td>
			<td width="400" align="left" colspan="2"><b><font color="#0000FF"><%=gwuser%></font></b><input type="hidden" name="user" size="10" value="<%=gwuser%>" readonly></td>
			</tr>
		<tr>
			<td width="210" align="right">订单号：</td>
			<td width="400" align="left" colspan="2"><font color="#008000"><%=gwno%></font><input type="hidden" name="remark" size="8" value="9" readonly></td>
			</tr>
		<tr>
			<td width="210" align="right">订单金额：</td>
			<td width="400" align="left" colspan="2"><%=djsl%></td>
		</tr>
		<tr>
			<td width="210" align="right">服务费(2%)：</td>
			<td width="400" align="left" colspan="2"><%=int(djsl*0.02/1)%></td>
		</tr>
		<tr>
			<td width="210" align="right">合计一币：</td>
			<td width="400" align="left" colspan="2"><b><font color="#FF0000"><%=int(ybsl/1)%></font></b></td>
		</tr>
		<tr>
			<td width="210" align="right">手机号码：</td>
			<td width="400" align="left" colspan="2"><%=left(rs("call"),2)%>******<%=right(rs("call"),3)%></td>
		</tr>
		<tr>
			<td width="210" align="right" height="26">二级密码：</td>
			<td width="400" align="left" colspan="2" height="26"><span style="font-size: 9pt"><font size="1">
			<input type="password" name="pa3" size="15" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="210" align="right" height="35">手机验证码：</td>
			<td width="80" align="left" height="35">
			<input type="text" name="hgcode" size="10"></td>
			<td width="322" align="left" height="35"><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></td>
		</tr>
		<tr>
			<td width="210" align="right" height="40"><p align="center">　</td>
			<td width="400" align="right" height="40" colspan="2">
			<p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定支付" name="B1" onClick="{if(confirm('确定支付吗?')){this.style.visibility='hidden';return true;}return false;}" style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p align="center">　
	<p align="center"><b><font size="5" face="楷体_GB2312" color="#0000FF"><a href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=gwuser%>" style="text-decoration: none"><font color="#0000FF">返回换购记录列表</font></a></font></b></div>
</form>