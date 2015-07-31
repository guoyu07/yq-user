<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('lgotgs.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<!--#include file="../ct0618.asp"-->
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&regid&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("vip")<>1 then
   response.write "<script language='javascript'>"
   response.write "alert('Only designated VIP players can use this feature!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jzpay.value=="") {      alert("Please fill out the transfer of one currency you want!");      return false;    } 
  if (Form.jzpay.value<99) {      alert("Transfer of a currency must be greater than or equal 100!");      return false;    } 
  if (Form.jzpay.value>10000) {      alert("Every transfer of a currency can not be more than 10,000!");      return false;    } 
  if (Form.jzpay.value><%=rs("pay")%>)    {   alert("Your transfer a currency can not exceed your remaining one currency <%=rs("pay")%>");      return false;    } 
  if (Form.jzuser.value=="") {      alert("Please fill in the user name you want to turn!");      return false;    }
  if (Form.jzuser.value=="<%=rs("username")%>") {      alert("Can not be transferred to yourself!");      return false;    }
  if (Form.pa3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    }
  if (!chkinteger(Form.jzpay.value)){
	alert('Transfer a currency can only be for the whole word!');
	document.Form.jzpay.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = true;
for (i=0; i<checkStr.length; i++) {
ch = checkStr.charAt(i);
if (checkOK.indexOf(ch) == -1) {
allValid = false;
break;
}
if ((ch == '+' || ch == '-') && i>0) {
allValid = false;
break;
}
}
return (allValid);
}
return true;  }  
</script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF">
	<font size="6" color="#008000">Your user name is </font><font color="#FF0000" size="6"><%=regid%></font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">Your remaining a currency as follows:<font color="#FF0000"><%=rs("pay")%></font></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p><table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="vipjzok.asp">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
    <TR class=content>
      <TD width="172" bgColor=#ffffff align="right" height="45"><b><font style="font-size: 11pt"><font face="Tahoma">Please write a currency transfers</font>£º</font></b></TD>
      <TD width="271" bgColor=#ffffff height="45"><font color="#FF0000" size="3"> &nbsp;<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="jzpay" size="15" maxlength="10"> **</font></TD>
    </TR>
    <TR class=content>
      <TD align=middle bgColor=#ffffff width="172" height="33"><b><p align="right"><font style="font-size: 11pt"><font face="Tahoma">Please write the name of the receiving user</font>£º</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="33"><p align="left">&nbsp;<input type="text" name="jzuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </TR>
    <tr><b>
      <TD align=middle bgColor=#ffffff width="172" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt">Two passwords:</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="38"><p align="left">&nbsp;<input type="password" name="pa3" size="20"></TD>
    	</tr>
    <TR class=content>
      <TD colSpan=2 align=middle bgColor=#ffffff width="439" height="40"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="Determining transfer account" name=submit2 style="font-size: 11pt" onClick="return confirm('Tip: Are you sure it?')" ></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
	<p style="margin-top: 0; margin-bottom: 0">¡¡</p>
	<p style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0" width="450" height="45" src="vipsq.asp?vip=<%=regid%>"></iframe>
</div>
</body>
</html>