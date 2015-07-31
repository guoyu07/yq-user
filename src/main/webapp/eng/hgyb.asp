<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Please login!');"
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
ybsl=djsl*1.02
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Please login!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, this order is not the current logged-on user names submitted, please log in again, thank you!');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>" 
   response.end
elseif rs("pay")+0<1 or rs("pay")+0=0 or ybsl+0>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, less than one currency "&ybsl&"£¬Temporarily unable to redeem, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.pa3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    }
  return true;  }  
</script>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="hgybok.asp"  name="Form" onSubmit="return checkdate()">
	<div align="center">
	¡¡<p>¡¡</p>
	<p>¡¡</p>
	<p><input type="hidden" name="ybsl" size="10" value="<%=ybsl%>"><input type="hidden" name="ybfw" size="10" value="<%=djsl*0.02%>"><input type="hidden" name="gwuser" size="10" value="<%=gwuser%>"><input type="hidden" name="gwid" size="10" value="<%=gwid%>"><input type="hidden" name="gwno" size="10" value="<%=gwno%>"></p>
	<table border="0" id="table1" height="222" width="620">
		<tr>
			<td width="210" align="right">Username:</td>
			<td width="400" align="left"><b><font color="#0000FF"><%=gwuser%></font></b></td>
			</tr>
		<tr>
			<td width="210" align="right">Order number:</td>
			<td width="400" align="left"><font color="#008000"><%=gwno%></font></td>
			</tr>
		<tr>
			<td width="210" align="right">Order Amount:</td>
			<td width="400" align="left"><%=djsl%></td>
		</tr>
		<tr>
			<td width="210" align="right">Service fees(2%)£º</td>
			<td width="400" align="left"><%=int(djsl*0.02/1)%></td>
		</tr>
		<tr>
			<td width="210" align="right">Total a currency:</td>
			<td width="400" align="left"><b><font color="#FF0000"><%=int(ybsl/1)%></font></b></td>
		</tr>
		<tr>
			<td width="210" align="right">Two passwords:</td>
			<td width="400" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="210" align="right" height="43"><p align="center">¡¡</td>
			<td width="400" align="right" height="43">
			<p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="Determine the payment" name="B1" style="font-family: ¿¬Ìå_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p align="center">¡¡
	<p align="center"><b><font size="5" face="¿¬Ìå_GB2312" color="#0000FF"><a href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=gwuser%>" style="text-decoration: none"><font color="#0000FF">Return to Redemption Records list</font></a></font></b></div>
</form>