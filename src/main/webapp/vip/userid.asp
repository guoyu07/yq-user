<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   gwuser=request("sgid")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>" 
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('您好，用户名有误，请重新登录，谢谢！');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>"
   response.end
end if
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.call.value=="") {      alert("请填入您的手机号码!");  Form.call.focus();      return false;    }
  if (Form.call.value.length<11) {      alert("手机号码至少为11位数!"); Form.call.focus();     return false;    } 
  if (Form.call.value.length>11) {      alert("手机号码至多为11位数!"); Form.call.focus();     return false;    }  
  if (Form.userid.value=="") {      alert("请填入您的身份证号码!");  Form.userid.focus();      return false;    }
  if (Form.userid.value.length<18) {      alert("身份证号码至少为18位数!"); Form.userid.focus();     return false;    } 
  if (Form.userid.value.length>18) {      alert("身份证号码至多为18位数!"); Form.userid.focus();     return false;    }  
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("二级密码不正确!");      return false;    }
  return true;  }  
</script>
<body topmargin="0">
<form method="POST" action="useridok.asp?sgid=<%=rs("username")%>"  name="Form" onSubmit="return checkdate()">
	<div align="center">
	<p>　</p>
	<p><b><font color="#FF0000">为了方便综合您的游戏账户，请补充您的身份证信息！</font></b></p>
	<p><font color="#0000FF">请保持您的联系手机是本人的并是正常使用中的！</font></p>
	<p><font color="#008000">请确保您的姓名与身份证号码是一致的！</font></p>
	<table border="0" id="table1" height="222" width="600">
		<tr>
			<td width="203" align="right">用户名：</td>
			<td width="353" align="left"><b><font color="#FF0000"><%=gwuser%></font></b></td>
			</tr>
		<tr>
			<td width="203" align="right">姓名：</td>
			<td width="353" align="left"><%=rs("name")%></td>
		</tr>
		<tr>
			<td width="203" align="right">联系手机：</td>
			<td width="353" align="left">
			<input type="text" name="call" size="20" maxlength="11" value="<%=rs("call")%>"></td>
		</tr>
		<tr>
			<td width="203" align="right">身份证号码：</td>
			<td width="353" align="left"><font color="#0000FF"><input type="text" name="userid" size="20" maxlength="18"></font><font size="2" color="#FF0000"> 海外身份证请联系客服</font></td>
		</tr>
		<tr>
			<td width="203" align="right">二级密码：</td>
			<td width="353" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="203" align="right" height="53"><p align="center">　</td>
			<td width="353" align="right" height="53"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定更新" name="B1" style="font-family: 楷体_GB2312; font-size: 16pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
<p align="center">
</div>
</form>