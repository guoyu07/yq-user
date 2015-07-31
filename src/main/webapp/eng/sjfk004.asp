<!--#include file="../ct0618.asp"-->
<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Has been operated, re-login!');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
elseif request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jb")<>5 then
   response.write"<script>alert('Note: You are not cooperative businesses, businesses can operate only cooperation! Thank you!');history.go(-1);'</script>"
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('Note: Your one currency is less than 15, please recharge!');history.go(-1);</script>"
   response.end
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
lkid=request("lkid")
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from gcuser where username ='"&lkid&"'"
rs0.open sql0,conn2,1,1
if  rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('The user does not exist, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
response.cookies("lsyh")="120"
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmsl.value==0) {      alert("Please select the number you want to buy!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>Management issuing</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<body bgcolor="#99CCFF">

<div align="center">
<table border="0" width="100%" id="table1" cellspacing="1" height="700">
	<tr>
		<td height="71">
		　</td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
			<table border="0" width="81%" id="table3" cellspacing="1" height="98" bgcolor="#FFFFFF">
				<tr>
	<b>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33">
	　</td>
				</tr>
				<b>
				<tr>
					<td height="62">

<div align="center">

<table width="619" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="70">
  
  <tr>
    <td align="center" valign="top" width="615" style="color: #304618; font-size: 12px" bordercolor="#669933"> 
      <form method="POST" align="center" action="sjfk005.asp?lkid=<%=lkid%>" name="Form" onSubmit="return checkdate()">
      <div align="center">
      <TABLE width="542" border=0 cellPadding=5 cellSpacing=1 id="table5" height="20">
  <TBODY>
    <TR class=content> 
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		<p align="right"><b><font size="3" color="#FF0000">Each were chosen as follows:</font></b></TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">
		<b><font size="2" color="#0000FF"><%if request("gmmj")=1 then %>10 gold (15 a credit / Zhang)<%elseif request("gmmj")=5 then %>50 gold (75 a credit / Zhang)<%elseif request("gmmj")=10 then %>100 gold coins (150 a credit / Zhang)<%elseif request("gmmj")=30 then %>300 gold coins (450 a credit / Zhang)<%elseif request("gmmj")=50 then %>500 gold coins (750 a credit / Zhang)<%elseif request("gmmj")=100 then %>1000 gold (1500 a credit / Zhang)<%end if%></font></b></TD>
    </TR>
    <tr>
	<b>
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		<p align="right" style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3">Please select the number you want to buy:</font></b></TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
              <p style="line-height: 200%; margin-top: 0; margin-bottom: 0">  
              <font size="3">  
              <select size="1" name="gmsl">
				<option value="0" selected>==Please select the number of==</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				</select>
				</font>
				<font color="#FF0000" style="font-size: 11pt">** </font><b>
				<input type="text" name="mj" size="5" value="<%=request("gmmj")%>0" readonly></TD>
    </tr>
    <TR class=content> 
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		　</TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
              　</TD>
    </TR>
    <TR class=content> 
      <TD width="213" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		　</TD>
      <TD width="304" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
    <b><INPUT class=normalButton type=submit value="Submitted" name=submit2 style="font-size: 11pt"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">&nbsp; </font><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Return to the previous step</font></a></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
					</div>
					</td>
				</tr>
			</table>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><a href="sjfk001.asp" style="text-decoration: none; font-weight:700"><font color="#000000" size="6">Back to Search</font></a></div>
		</td>
	</tr>
</table></div>