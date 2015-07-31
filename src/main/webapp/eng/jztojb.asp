<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
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
elseif rs("pay")<15 then
   response.write"<script>alert('Note: Your one currency is less than 15, please recharge!');history.go(-1);</script>"
   response.end
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
response.cookies("lktojb")="1200"
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmmj.value==0) {      alert("Please select the nominal value of gold card you want to buy!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>A currency transfer gold card</title>
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
		¡¡</td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
			<table border="0" width="81%" id="table3" cellspacing="1" height="133" bgcolor="#FFFFFF">
			<tr>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33"><b><font color="#669933">A currency - gold card purchase</font></td>
				</tr>
				<b>
				<tr>
					<td height="97">

<div align="center">

<table width="636" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="136">
  
  <tr>
    <td align="center" valign="top" width="632" style="color: #304618; font-size: 12px" bordercolor="#669933"> 
      <form method="POST" align="center" action="jztojb2.asp" name="Form" onSubmit="return checkdate()">
      <div align="center">
      <TABLE width="610" border=0 cellPadding=5 cellSpacing=1 id="table5" height="52">
  <TBODY>
    <TR class=content> 
      <TD width="266" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		<p align="right" style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3" color="#FF0000">Please select the nominal value of gold card to purchase:</font></b></TD>
      <TD width="321" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
              <p style="line-height: 200%; margin-top: 0; margin-bottom: 0">  
              <font size="3">  
              <select size="1" name="gmmj">
				<option value="0" selected>==Please select the nominal value of gold card==</option>
				<option value="1">10 gold (15 a credit / Zhang)</option>
				<option value="5">50 gold (75 a credit / Zhang)</option>
				<option value="10">100 gold coins (150 a credit / Zhang)</option>
				<option value="30">300 gold coins (450 a credit / Zhang)</option>
				<option value="50">500 gold coins (750 a credit / Zhang)</option>
				<option value="100">1000 gold (1500 a credit / Zhang)</option>
				</select>
				</font>
				<font color="#FF0000" style="font-size: 11pt">** </font><b>&nbsp;<INPUT class=normalButton type=submit value="Submit" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><font size="2">Tip: Your a currency surplus<font color="#FF0000"><%=rs("pay")%></font></font><p style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<font style="font-size: 11pt">Press<font color="#FF0000">15 - a coin - 10 gold coins to buy</font>The proportion of successful shows the corresponding gold card</font><p style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<font style="font-size: 11pt">Then<font color="#0000FF"><b>Points Money</b></font>ÏÂ<font color="#0000FF"><b>I want to recharge</b></font>-Get to activate or copy!</font></div>
</form>
    </td>
    </tr>
</table>
					</div>
					</td>
				</tr>
			</table>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0">¡¡</p>
<p><a href="javascript:history.back();" style="text-decoration: none"><font color="#000000" style="font-weight: 700" size="6">Back to Previous Page</font></a></p>

		</div>
		</td>
	</tr>
</table></div>