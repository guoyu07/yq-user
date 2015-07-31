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
   jfsl=request("jfsl")
   epsl=request("epsl")
   gwuser=request("gwuser")
   gwno=request("gwno")
   gwid=request("gwid")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
syhg=rs("jjsy")*1
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
elseif syhg+0<10 or syhg+0=0 or epsl+0>syhg then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, insufficient consumption account balance "&epsl&"yuan,Temporarily unable to redeem, please contact customer service recharge, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")+0<1 or rs("jyg")+0=0 or jfsl+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, insufficient integration "&jfsl&"£¬Temporarily unable to redeem, thank you!');"
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
<body topmargin="0">
<form method="POST" action="hgepjfok.asp"  name="Form" onSubmit="return checkdate()">
	<div align="center">
	¡¡<p>¡¡</p>
	<p><input type="hidden" name="jfsl" size="10" value="<%=jfsl%>"><input type="hidden" name="epsl" size="10" value="<%=epsl%>"><input type="hidden" name="gwuser" size="10" value="<%=gwuser%>"><input type="hidden" name="gwid" size="10" value="<%=gwid%>"><input type="hidden" name="gwno" size="10" value="<%=gwno%>"></p>
	<table border="0" id="table1" height="221" width="566">
		<tr>
			<td width="203" align="right">Order number:</td>
			<td width="353" align="left"><font color="#008000"><%=gwno%></font></td>
			</tr>
		<tr>
			<td width="203" align="right">Username:</td>
			<td width="353" align="left"><b><font color="#FF0000"><%=gwuser%></font></b></td>
			</tr>
		<tr>
			<td width="203" align="right">Use consumer balance:</td>
			<td width="353" align="left"><font color="#0000FF"><%=epsl%></font></td>
		</tr>
		<tr>
			<td width="203" align="right">Use Points:</td>
			<td width="353" align="left"><font color="#0000FF"><%=jfsl%></font></td>
		</tr>
		<tr>
			<td width="203" align="right">Two passwords:</td>
			<td width="353" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="203" align="right" height="53"><p align="center">¡¡</td>
			<td width="353" align="right" height="53"><span style="font-size: 9pt"><font size="1"><input type="submit" value="Determine the payment" name="B1" style="font-family: ¿¬Ìå_GB2312; font-size: 18pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	<p align="center">¡¡
	<p align="center"><b><font size="5" face="¿¬Ìå_GB2312" color="#0000FF"><a href="http://jf.zgyce.com/admin/cfhg_List.asp?hguser=<%=gwuser%>" style="text-decoration: none"><font color="#0000FF">Return to Redemption Records list</font></a></font></b></div>
</form>