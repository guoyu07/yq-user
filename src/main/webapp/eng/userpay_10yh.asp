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
end if
%>
<%
'if rs("payok")=1 or rs("txdate")>Now() then
if rs("payok")=1 then
   response.write "<script language='javascript'>"
   'response.write "alert('您好，您同一姓名账号或同一身份证号码账号已发布成功过；\n\n请耐心等待处理完成后或于<"&int(rs("txdate")-Now()*1+0.1)/1&"天>后再试发布第二笔；\n\n如果认购方已向您付款，请先确认收款再发布第二笔，谢谢！');"   
   response.write "alert('Hello, your account the same name or the same identity card number has been published succeeded account, please be patient after processing is complete release the second tranche, if the subscriber has your payment, please re-confirm receiving the second tranche release, thank you !');"
   response.write "location.replace('epmcjl.asp');"
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
  if (Form.txpay.value==0) {      alert("Please select the number of coins sold one!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('Only sell one currency for the whole word!');
	document.Form.txpay.focus;
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
  if (Form.txpay.value><%=rs("pay")%>) {      alert("Your publication is not greater than the rest of your <%=rs("pay")%> A currency Oh!");      return false;    } 
  if (Form.txpay.value<100) {      alert("Your publication can not be less than 100 a coin!");      return false;    } 
  if (Form.pa3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    } 
  return true;  }  
</script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0"><div align="center"><b>
     <p></p>
     <p></p>
	 <p><font color="#008000" face="隶书" style="font-size: 30pt">Publish a currency sell (ask now)</font></p>
	<table border="0" width="75%" id="table1" height="80" bgcolor="#FFEEEE">
	 <tr>
	 <td><b>Dear Players<font color="#FF0000"><%=rs("name")%></font>Hello! After you apply for release, to subscribe for one currency - the direction of your order within 2 hours after the hit on your payment account!</td>
	 </tr>
	 <tr>
	 <td>Your current surplus<b><font color="#008000"><%if rs("pay")<1 then%>0<%=rs("pay")%><%else%><%=rs("pay")%><%end if%></font></b> A currency&nbsp;Cumulative<b><font color="#0000FF"><%=rs("cbpay")%></font></b> A currency</td>
	 </tr>
	 </table>
	 <table width="75%" border="0" cellpadding="0" class="border" bgcolor="#800080">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="935"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="tgtxok.asp?txlb=1">
    <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
    <div align="center"><TABLE width="100%" border=0 height="220" cellpadding="2" bgcolor="#FFFFFF">
    <TBODY>
    <TR class=content><TD bgColor=#ffffff width="27" align="right" rowspan="9"><p align="center">　</TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="30"><font style="font-size: 11pt; font-weight:700">User Name：</font></TD>
    <TD width="571" bgColor=#ffffff height="30"><font color="#FF0000"><b><%=username%></b></font></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="29"><font style="font-size: 10pt">Sell a currency Quantity:</font></TD>
      <TD width="571" bgColor=#ffffff height="29"><font style="font-size: 9pt" color="#FF0000">
		<select size="1" name="txpay">
		<option selected value="0">=Choose to sell data=</option>
		<option value="200">200</option>
		<option value="500">500</option>
		</select>**</font></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="29"><font style="font-size: 10pt; ">Two passwords:</font></TD>
      <TD width="571" bgColor=#ffffff height="29"><font size="3"> <span style="font-size: 11pt"><INPUT name="pa3" size=15 type=password></span></font><font style="font-size: 9pt" color="#FF0000">**</font></TD>
    </TR>
    <TR class=content> 
		<TD width="897" bgColor=#ffffff align="right" height="26" colspan="2"><p align="left"><font size="2" color="#0000FF"><b>Caveat:</b></font><font color="#FF0000" size="2">Please carefully check the following collection of information, if any error please immediately<a href="dateuser.asp" style="text-decoration: none">Modify Profile</a>, Then release sold! If not carefully checked, resulting in the payment is unsuccessful, the extra will be sold frozen, thaw applications will be charged a 20% fee!</font></TD>
    </TR>
    <TR class=content> 
		<TD width="317" bgColor=#ffffff align="right" height="26"><span style="font-size: 10pt">Real name:</span></TD>
		<TD width="571" bgColor=#ffffff height="26"><font color="#800080"><%=rs("name")%></font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="28"><span style="font-size: 10pt">Satisfied by:</span></TD>
		<TD width="571" bgColor=#ffffff height="28"><font color="#800080"><%=rs("bank")%></font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="28"><span style="font-size: 10pt">Account number:</span></TD>
		<TD width="571" bgColor=#ffffff height="28"><b><font color="#800080"><%=rs("card")%></font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="30"><font size="2">Account Bank:</font></TD>
		<TD width="571" bgColor=#ffffff height="30"><font size="2"><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%>Subbranch--<font color="#0000FF"><b><a href="../vipadd.asp?addid=<%=username%>" style="text-decoration: none"><font color="#FF0000">Modification</font></a></b></font></font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="931" height="29"><p style="margin-top: 0; margin-bottom: 0"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="Publish sold out" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
  <p style="margin-top: 0; margin-bottom: 0">　</p>
  <table border="1" width="75%" id="table2" style="border-collapse: collapse" bgcolor="#E6FFFF">
  <tr>
  <td><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt" color="#FF0000">Published sold description:</font></p><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt">First, from a minimum of 100 credits posting to sell, each release to be on the other primary processing (you confirm payment is received) before they can launch a second time, after the release of our success to subscribe for one currency - the direction of your next single after 2 within hours of hitting on your payment account!</font></p>
  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt" color="#800080">Second,</font><font size="2" color="#800080">A currency to sell less than 500 (including 500), the transaction fee is: 15%.</font></p>
	</td>
	</tr>
	</table>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="5" color="#FF0000" face="楷体_GB2312">A currency - Money Trading Rules</font></p>
		<font size="3">
			  <table border="0" width="90%" id="table3">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						A Subscriber (payer) responsibility <br> 
1, more than "two hours" without success payments to the publisher's designated bank account, the system will be down to the integrity of the gold confiscation withheld, lifting the trade restrictions, and allow other users to complete this transaction. <br> 
2, there is no payment to the successful release party designated bank account in advance operation or malicious actions, affecting the normal transaction process, the system will confiscate gold integrity withheld down, lifted the trading restrictions, allowing other users to complete this transaction. <br> 
Second, the release sell side (receiving side, now seeking party) responsibility <br> 
1, when the successful operation of the payer, payee actually receive the funds, you must be logged platform points within "48 hours", "a currency - financial management" under the "one currency - selling Details" to see the status of the transaction and "I have received payments - notification System to a corresponding increase in the Subscriber currency - balances "operation! <br> 
2, release sell (ask now) before make sure their accounts receivable can be used normally, because your payment account errors or other reasons can not be properly receivable, the impact of normal trading hours payer, the payer to the customer complaint , the transaction will ribbon hair. <br> 
3, in order to deal fair, both parties have certain constraints, the system starts Kingmaker scheme, each user is initially "5", each time trading rules violation deduction "a star", when the rest of the "3 Stars" will is limited to publish or subscribe for one week, when the rest of the "two star", will be limited to publish or subscribe for two weeks, will not get the bonus balance within two weeks, when the rest of the "one star", will be limited to publish or subscribe for three weeks , three weeks will not get the bonus balance and leadership bonuses, when the rest of "0 Star", will be limited to publish or subscribe for 60 days, 60 days will not get the bonus balance and leadership bonus, your current is:<b><font color="#FF0000">“<%=rs("cxt")%>Star”</font></b>。</td>
					</tr>
				</table>
	<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</font></div>
</body>
</html>