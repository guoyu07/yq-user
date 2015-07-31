<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "location.replace('lgotgs.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<!--#include file="../mq0618.asp"-->
<% 
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fhname where fhuser ='"&regid&"'"
rs.open sql,conn7,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   zhpay=rs("ljfhpay")-rs("txfhpay")
end if
%>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jzpay.value=="") {      alert("Please fill in the amount you want to convert!");      return false;    } 
  if (Form.jzpay.value<100) {      alert("The amount must be greater than 100 to convert");      return false;    } 
  if (Form.jzpay.value><%=zhpay%>)    {   alert("Your transfer amount can not exceed the amount of your remaining bonus <%=zhpay%> ");      return false;    } 
  if (!chkinteger(Form.jzpay.value)){
	alert('The amount can only be converted to an integer word!');
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
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF"><font size="6" color="#008000">Your user name is </font><font color="#FF0000" size="6"><%=regid%></font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">Total consumption of dividend income as follows:<font color="#0000FF"><%=rs("ljfhpay")%></font> Has been converted successfully:<font color="#FF00FF"><%=rs("txfhpay")%></font> </p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">Currently the remaining convertible into - a currency balance is:<font color="#FF0000"><%=zhpay%></font></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">¡¡</p>
  <table width="627" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="81">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="627"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="fhtoepok.asp">
      <div align="center"><TABLE width="498" border=0 cellSpacing=1 height="80">
  <TBODY>
    <TR class=content>
      <TD width="169" bgColor=#ffffff align="right" height="43"><b><font style="font-size: 11pt"><font face="Tahoma">Please write the conversion amount</font>£º</font></b></TD>
      <TD width="322" bgColor=#ffffff height="43"><font color="#FF0000" size="3">&nbsp;<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="jzpay" size="10" maxlength="10"> ** </font><font color="#FF0000" size="2">(Hint: Each time a minimum of 100)</font></TD>
    </TR>
    <TR class=content>
      <TD colSpan=2 align=middle bgColor=#ffffff width="494" height="34"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="Determined to a currency conversion" name=submit2 style="font-size: 11pt" onClick="return confirm('Tip: Are you sure it?')" ></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
   </b><p style="margin-top: 0; margin-bottom: 0"><font color="#008000">The conversion is to a currency - accounts, a successful conversion to buy gold cards, consumer, upgraded to dual-zone member!</font></div>
</body>
</html>