<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
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
elseif rs("pay")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('VIP players a currency account balance must be greater than or equal to 50,000!');"
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
  if (Form.jcname.value=="") {      alert("Please write transferred username!");      return false;    } 
  if (Form.jzpay.value><%=rs("sybdb")%>) {      alert("Username declaration turn out not greater than the remaining coins currency declaration form <%=rs("sybdb")%> , Thank you!");      return false;    }
  if (Form.jzpay.value<5000) {      alert("Transfer amount must be greater than 5000!");      return false;    } 
  if (Form.syuser.value=="") {      alert("Please fill out to receive a user name!");      return false;    }
  if (Form.jcname.value==Form.syuser.value) {      alert("Can not be transferred to yourself!");      return false;    }
  if (Form.pa3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    }
  if (!chkinteger(Form.jzpay.value)){
	alert('Transfer amount only for the whole word!');
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
<div align="center">
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"><span style="background-color: #FFFFFF"><font size="6" color="#008000">Declaration currency transfers</font></span></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<table width="533" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="533"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="bdbjzok.asp">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center"><TABLE width="495" border=0 cellSpacing=1 height="209">
  <TBODY>
    <tr>
      <TD width="185" bgColor=#ffffff align="right" height="39"><b><font face="Tahoma" color="#FF00FF" style="font-size: 11pt">Out Username:</font></b></TD>
      <TD width="297" bgColor=#ffffff height="39"><font color="#FF0000" size="3"> &nbsp;<input type="text" name="jcname" size="15" value="<%=regid%>" readonly> **</font></TD>
    </tr>
    <TR class=content> 
      <TD width="185" bgColor=#ffffff align="right" height="37"><b><font style="font-size: 11pt"><font face="Tahoma">Transfer the number of</font>£º</font></b></TD>
      <TD width="297" bgColor=#ffffff height="37"><font color="#FF0000">&nbsp;</font><font color="#FF0000" size="3"><select size="1" name="jzpay">
		<option selected value="10000">--10000--</option>
		<option value="20000">--20000--</option>
		<option value="30000">--30000--</option>
		</select> ** </font><font color="#008000" size="2">Remaining:</font><b><font color="#0000FF" size="2"><%=rs("sybdb")%></font></b></TD>
    </TR>
    <tr>
      <TD align=middle bgColor=#ffffff width="185" height="39"><b><p align="right"><font face="Tahoma" style="font-size: 11pt">Receive Username:</font></TD>
      <TD align=middle bgColor=#ffffff width="297" height="39"><p align="left">&nbsp;<input type="text" name="syuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </tr>
    <TR class=content> 
      <TD align=middle bgColor=#ffffff width="185" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt">Two passwords:</font></TD>
      <TD align=middle bgColor=#ffffff width="297" height="38"><p align="left">&nbsp;<input type="password" name="pa3" size="20"></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=2 align=middle bgColor=#ffffff width="487" height="48"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="Determining transfer account" name=submit2 style="font-size: 11pt" onClick="return confirm('Tip: Are you sure it?')" ></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
</div>
</body>
</html>