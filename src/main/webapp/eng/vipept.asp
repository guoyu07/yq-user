<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   dquser=request.cookies("regid")
   password=request.cookies("password")
   myid=request("my")
end if
%>
<%
set rsb = Server.CreateObject("ADODB.Recordset")
sqlb="select * from gcuser where username ='"&dquser&"'"
rsb.open sqlb,conn2,1,1
if myid<>dquser then
   response.write "<script language='javascript'>"
   response.write "alert('Faulty operation, please log in again!');"
   response.write "top.location.replace('login.asp');"  
   response.write "</script>"
   response.end
end if
%>
<%
Dim allName
allName=myid
Call CalculateQ(allName,myid)
Function CalculateQ(allName,userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM gcuser where username = '"&userName&"'"	
	rs_Calculate.open sql_Calculate,conn2,1,1
	
	If rs_Calculate.eof Or rs_Calculate.bof Then
	rs_Calculate.close()
	'Response.write "没有数据<br>"
	Exit Function
	End If
	
	if rs_Calculate("username")=userName Then
	if rs_Calculate("vip")=1 Then
	allName=rs_Calculate("username")
	Exit Function
	End if  
	Call CalculateQ(allName,rs_Calculate("up"))
    'rs_Calculate.close()
	Else
	'rs_Calculate.close()
	'Response.write "错误的逻辑<br>"
	Exit Function'错误的逻辑
	End if
 
End Function
'Response.write allName
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&allName&"'"
rs.open sql,conn2,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jzpay.value=="") {      alert("Please fill out the transfer of one currency you want!");      return false;    } 
  if (Form.jzpay.value<99) {      alert("Transfer of a currency must be greater than or equal 100!");      return false;    } 
  //if (Form.indexOf(jzpay/100,".").value!==0) {      alert("每次转账的EP必须是100的倍整数如：100，200，300，400，500!");      return false;    } 
  if (Form.jzpay.value><%=rsb("pay")*0.05+rsb("pay")%>)    {   alert("Your transfer a currency can not exceed your remaining one currency <%=rsb("pay")%> Plus 5% service charge!");      return false;    } 
  if (Form.jzuser.value=="<%=dquser%>") {      alert("Can not be transferred to yourself!");      return false;    }
  if (Form.pa3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.pa3.value!=="<%=rsb("password3")%>") {      alert("Two password is incorrect!");      return false;    }
  if (Form.vipsq.value=="") {      alert("Please fill out the authorization code!");      return false;    }
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
<html>
<title>Team Service Center</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<SCRIPT src="main/correctPNG.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript>
function writeTitle(tit){
	//alert(tit)
  if(tit!=""){
    document.getElementById("mTitle").innerHTML=tit;
  }
  else{
    document.getElementById("mTitle").innerHTML="Home";
  }
}

</SCRIPT>

<SCRIPT src="main/leftNo.js"></SCRIPT>

<SCRIPT type=text/javascript src="main/jquery-1.2.6.min.js"></SCRIPT>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$("#wenzhang>dd>dl>dd").hide();
	$.each($("#wenzhang>dd>dl>dt"), function(){
		$(this).click(function(){
			$("#wenzhang>dd>dl>dd ").not($(this).next()).slideUp();
			$(this).next().slideToggle(500);
			//$(this).next().toggle();
		});
	});
});


</SCRIPT>
</head>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><A>Personal information</A> </LI>
  <LI><A>Query results</A> </LI>
  <LI><A>Financial Management</A> </LI>
  <LI><A>Message Management</A> </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">Exit the System</A> </LI>
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>Current position:<SPAN id=mTitle>Home</SPAN></DIV></DIV></DIV>
<DIV class=box_title>A currency change out fine</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <div align="center">
	<table border="0" width="60%" id="table1" height="209" cellspacing="3" cellpadding="2">
		<tr>
			<td align="right" width="32%">Team Service Center Number:</td>
			<td width="66%"><font color="#FF0000"><%=left(rs("username"),2)%>***</font></td>
		</tr>
		<tr>
			<td align="right" width="32%">Title:</td>
			<td width="66%"><font color="#0000FF"><%=rs("name")%></font></td>
		</tr>
		<tr>
			<td align="right" width="32%">Contact QQ:</td>
			<td width="66%"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=rs("qq")%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=rs("qq")%>:41" alt="Click here to send me a message" title="Click here to send me a message"></a><%=rs("qq")%></td>
		</tr>
		<tr>
			<td align="right" width="32%">Tel:</td>
			<td width="66%"><%=rs("call")%></td>
		</tr>
		<tr>
			<td align="right" width="32%">Accounts receivable:</td>
			<td width="66%"><%=rs("bank")%>-<%=rs("card")%></td>
		</tr>
		<tr>
			<td><p align="right">Bank location:</td>
			<td><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%>Subbranch</td>
		</tr>
		<tr>
			<td colspan="2"><p><b><font size="2" color="#008000">&nbsp;&nbsp;&nbsp; Consult the relevant business issues, such as you can not make the acquisition of EP's operations in currency markets or you want to omit the acquisition of a currency (for play money, the other side to confirm) the intermediate links, you can contact our service center team quickly purchase (a currency by 1000, the proportion of the payment will be 950 yuan)</font></b></td>
		</tr>
	</table>
	<form method="POST" name="Form" action="vipupok.asp" onSubmit="return checkdate()">
		<p>　</p>
		<p><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">Transfer to a service center team</font></p>
		<table border="0" width="75%" id="table2" height="249">
			<tr>
				<td align="right" colspan="2" height="151" bgcolor="#E1FFE1">
				<p align="left"><font size="3" color="#0000FF">Description:</font></p>
				<p align="left"><font size="2">This feature can be on the team service center to help you put a coin you need to open an account user name (the only team network) but need to be paid to the service center operator service charge of 5% (close transferor only); If you 1000 a currency requires a user name from a to B user name, user name you log a service center by following the operation to turn 1000 a currency (a currency system automatically deducts 50) a user name that you have a 1050 one currency expenditures to the team service center (50 or 5% of a currency as a central service fee), then turn the center receives a coin to B 1000 username (B 1000 actually received a username coins, this process is complete you need effect.)</font></p>
				<p align="left"><font size="3" color="#0000FF">Tip:</font></p>
				<p align="left"><font size="2">A service center via the roll-out of a currency can not apply to sell, can only be used to open an account, such as service centers to help you turn a coin into the 1000 B user name, user name that B received the 1000 one currency will not be published sold to a currency trading market.</font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="宋体" size="2">From the household（<%=dquser%>）Turn out a number of coins:</font></td>
				<td width="58%"><font face="宋体"><input type="text" name="jzpay" size="20"><input type="hidden" name="jzuser" size="20" value="<%=rs("username")%>" readonly></font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="宋体" size="2">The household（<%=dquser%>）the two passwords:</font></td>
				<td width="58%"><font face="宋体"><input type="password" name="pa3" size="20"></font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="宋体" size="2">Team Service Center Authorization Code:</font></td>
				<td width="58%"><font face="宋体"><input type="text" name="vipsq" size="20"><font size="2">Contact Centres</font></font></td>
			</tr>
		</table>
		<p>　</p>
		<p><input type="submit" value="Submit" name="B1"></p>
	</form>
	<p>　</div>
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a></p>
</body> 
</html>