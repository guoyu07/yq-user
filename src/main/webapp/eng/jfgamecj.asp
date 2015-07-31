<%
if request.cookies("regid")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<!--#include file="../ct0618.asp"-->
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&regid&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<html>
<title>Points Game</title>
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
<script language="JavaScript">
 function checkdate()  {  
  if (Form.cjpay.value=="") {      alert("Please enter the number need to recharge!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("Recharge the number can not be zero!");      return false;    }
  if (!chkinteger(Form.cjpay.value)){
	alert('Only recharge the number for the whole word!');
	document.Form.cjpay.focus;
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
  if (Form.cjpay.value<100) {      alert("Each recharge can not be less than 100 points!");      return false;    }
  if (Form.cjpay.value><%=rs("jyg")%>) {      alert("Recharge your number is not greater than the rest of your number <%=rs("jyg")%> Oh!");      return false;    } 
  if (Form.pa3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    }
  return true;  }  
 </script>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">Personal information</A> </LI>
  <LI><A>Query results</A> 
  </LI>
  <LI><A>Financial Management</A> 
  </LI>
  <LI><A>Message Management</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">Exit the System</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>Current position:<SPAN id=mTitle>Home</SPAN></DIV></DIV></DIV>
<DIV class=box_title>Plot of the game</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
        <p align="center">
		<strong><font size="6" color="#000000">Plot of the game</font></strong><p align="center">
		　<p align="center">
		<img border="0" src="images/02.png" width="926" height="238"><p align="center">
		　<p align="center">
		<a href="http://p.cfjte.com/GameInfo.html"><font color="#FF0000" size="3">Points Game description</font></a><font size="3">&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000">&nbsp;<a href="http://p.cfjte.com/FaqList.html"><font color="#FF0000">Help Center</font></a>&nbsp;&nbsp;&nbsp;&nbsp; </font> </font>
		<p align="center">
		　<p align="center">
		<font size="3"><font color="#008000"><b>Tips:</b></font><font color="#FF0000"><a target="_blank" href="http://p.cfjte.com/download/棋牌游戏中心.exe"><font color="#0000FF">First game please download and install the game lobby</font></a></font></font><font color="#FF0000" size="3">(Use<a target="_blank" href="http://ie.sogou.com"><font color="#800000">Sogou browser</font></a>Best download speed)</font><p align="center">
		　<p align="center">
		<font size="3">Playing the game before the first recharge current user name is:<b><font color="#FF00FF"><%=regid%></font></b>&nbsp;&nbsp; Platform for the total score:<b><font color="#008000"><%=rs("jyg")%></font></b></font><p align="center">
		　<form method="POST" action="jtgameok.asp" name="Form" onSubmit="return checkdate()" >
			<div align="center">
				<table border="0" width="59%" id="table1" height="87">
					<tr>
						<td align="right" width="278"><font size="3">Need to recharge to the game account:</font></td>
						<td><input type="text" name="cjpay" size="20"></td>
					</tr>
					<tr>
						<td align="right" width="278"><font size="3">Two passwords:</font></td>
						<td><input type="password" name="pa3" size="20"></td>
					</tr>
				</table>
			</div>
			<p align="center">　</p>
			<p align="center">
			<input type="submit" value="Submit" name="B1" onClick="return confirm('Tip: Are you sure it?')" style="font-size: 12pt" ></p>
		</form>
		<p align="center">
		　<p align="center">
		<font size="2">
		<a target="_blank" href="http://p.cfjte.com/Default.html">Temporarily recharge!</a></font><p align="center">
		　<p align="center">
		　</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a></p>
</body> 
</html>