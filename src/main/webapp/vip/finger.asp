<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="cfvip.asp"-->
<%
ddyb=request("gwpay")
ybsl=cint(ddyb*1.02/1)
pa2=request("pa01")
pa5=md5(LCase(pa2))
if request("ybf")<>"" then
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&request("gwuser")&"'"
rs1.open sql1,conn2,2,3
if rs1.eof and rs1.bof then
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
else
   rs1("fingerid")=request("pid")
   rs1.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM dateip"
rs_d1.open sql_d1,conn1,1,3
rs_d1.addnew
rs_d1("user")=rs1("username")
rs_d1("dlfs")="指纹录入"
rs_d1.update
end if
response.Write "<script language=javascript>alert('录入操作成功！');location.replace('finger.asp');</script>"
response.end
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="finger.asp?ybf=actok"  name="Form">
	<input type="hidden" name="ybpay" size="20" value="<%=int(ybsl/1)%>">
	<div align="center">
	　<p><font size="6" color="#FF0000">指纹系统测试页面</font></p>
	<table border="0" id="table1" height="210" width="560">
		<tr>
			<td width="214" align="right">操作标识：</td>
			<td width="336" align="left"><input type="text" name="sid" size="20" value="<%=request("sid")%>">0录入1登录2消费</td>
			</tr>
		<tr>
			<td width="214" align="right">指纹信息：</td>
			<td width="336" align="left"><input type="text" name="pid" size="20" value="<%=request("pid")%>"></td>
			</tr>
		<tr>
			<td width="214" align="right">用户名：</td>
			<td width="336" align="left"><b><font color="#0000FF"><%=gwuser%><input type="text" name="gwuser" size="20"></font></b></td>
			</tr>
		<tr>
			<td width="214" align="right">登录密码：</td>
			<td width="336" align="left"><input type="password" name="pa01" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right">二级密码：</td>
			<td width="336" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa02" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right" height="31"><p align="center">　</td>
			<td width="336" align="right" height="31"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定录入" name="B1" style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p>请不要使用它人账户进行操作，一经发现3倍罚款！</p>
	</div>
</form>