<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
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
   jybh=request("ep")
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from txpay where payid ="&jybh&""
rs_mc.open sql_mc,conn1,2,3
txpay=rs_mc("paynum")
fbuser=rs_mc("payusername")
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you are not dual-zone player, you can not use a temporary currency finance function!');"
   response.write "location.replace('vipup.asp?my="&username&"');"
   response.write "</script>" 
   response.end
elseif rs("sjb")+0<20 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you have not reached the D package, temporarily unable to use a currency finance function! \n \n You can contact the team operates service centers in 95 percent of the purchase price of a currency after!');"
   response.write "location.replace('vipup.asp?my="&username&"');"
   response.write "</script>" 
   response.end
elseif rs("username")=fbuser then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, can not own a subscription currency, please choose other users, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")+0<txpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, insufficient number of your points"&txpay&"(Call a gold coins as integrity),You can not use a temporary currency finance function!\n\nYou can contact the team operates service centers in 95 percent of the purchase price of a currency after!');"
   response.write "location.replace('vipup.asp?my="&username&"');"
   response.write "</script>" 
   response.end
end if
%>
<%
dqu=rs("dqu")
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="China Yichuan [No.①]  Service QQ：613697151"
   qq=613697151
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="China Yichuan [No.②]  Service QQ：613697152"
   qq=613697152
end if
%>
<%
if rs_mc("ep")>0 or rs_mc("zftime")<>"" or rs_mc("kjygid")<>0 then
   response.Write "<script language=javascript>alert('The EP transaction or transactions by its people has been a success, can not be repeated, please choose other deals!');location.href='epjysc.asp'</script>"
   response.end
else
   rs_mc("ep")=1
   rs_mc("rgdate")=now()
   rs_mc.update
end if
%>
<script language="JavaScript"> 
  function checkdate()  { 
  if (Form.epnm3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.epnm3.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    }
  return true;  }  
 </script>

<p align="center">　</p>
<p align="center">The transaction left countdown<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> Second,Timeout did not confirm the transaction will be canceled automatically!</p>
<p align="center">　</p>
<p align="center"><font size="6">The number one currency to subscribe:<font color="#FF0000"><%=rs_mc("paynum")%></font></font><b><font color="#FF00FF" size="5" face="楷体">-Will be added to your "one currency - balances"</font></b></p>
<p align="center"><b><font color="#800000" face="楷体" style="font-size: 20pt">Actually only need to release party</font><font color="#000080" face="楷体" style="font-size: 20pt"><%=rs_mc("payusername")%></font><font color="#800000" face="楷体" style="font-size: 20pt">Payment:</font><font color="#FF0000" face="楷体" style="font-size: 20pt"><%=rs_mc("paynum9")%></font><font face="楷体" style="font-size: 20pt">yuan</font></b></p>
<div align="center">
	<table border="0" width="80%" id="table1" cellspacing="1" bgcolor="#EFEFEF" height="135">
	<tr>
	<td><b><font color="#FF0000">Important Tip:</font><font color="#0000FF">(Release party payment method used is "</font><font color="#008000"><%=rs_mc("paybank")%></font><font color="#0000FF">")</font></b><p>
	The order shall be in your user name (Subscriber):<b><font color="#008000"><%=rs("username")%> </font></b>The points account withheld<b><font color="#FF0000"><%=txpay%></font></b>The transaction integrity as gold!<p>
	In order to be successful after "<font color="#FF0000">2 hours</font>"Introverted publisher<font color="#0000FF"><%=rs_mc("payusername")%></font>Into the designated bank account of not less than<b><font color="#FF0000"><%=rs_mc("paynum9")%></font></b>yuan!Meanwhile in the registry platform point - under "a coin Money," "Call Details" to see the transaction status - publisher<font color="#0000FF"><%=rs_mc("payusername")%></font>Accounts receivable, and "I have paid<b><font color="#FF0000"><%=rs_mc("paynum9")%></font></b>-Notify release party confirmation "operation!</td>
	</tr>
	</table>
<table border="0" width="100%" id="table2" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">According to the region that you chose when registering users, the service center to provide you with personal service, in order to improve efficiency!</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">Have anything please contact me:<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="Click here to send me a message" title="Click here to send me a message"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">Each department service center personnel division, a person can not repeat plus, not a problem to consult with everyone in the same period</font></td>
		</tr>
		</table>
	</div>
<p align="center">　</p>
<form method="POST" action="epmyok.asp?ep=<%=jybh%>"  name="Form" onSubmit="return checkdate()">
	<div align="center">
		<table border="0" width="55%" id="table3">
			<tr>
				<td align="center"><p align="right"><span style="font-size: 11pt">Subscribers<font color="#FF0000"><%=rs("username")%></font>'s the two passwords:</span></td>
				<td align="center" width="176"><span style="font-size: 11pt"><input type="password" name="epnm3" size="20"></span></td>
				<td align="center" width="146"><input type="submit" value="Determine the correct" name="B1" style="font-size: 11pt; color: #0000FF; font-weight: bold; float:left"></a></td>
			</tr>
		</table>
	</div>
</form>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('Tip: You can determine cancel this deal? ')" href="qxepjy.asp?ep=<%=jybh%>"><font color="#008000">Return to Market</font></a></b></p>
<p align="center">　</p>
<script>
var secs = 60;  //6为倒计时秒数
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
   window.location="qxepjy.asp?ep=<%=jybh%>";  //2.htm为到时跳转的页面URL
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>