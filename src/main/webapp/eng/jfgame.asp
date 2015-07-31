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
<!--#include file="cfvip.asp"-->
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
'elseif rs("ga")>0 then
   'response.redirect"jfgamecj.asp"
end if
%>
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
  if (Form.pa.value=="") {      alert("Please enter your login password password!");      return false;    } 
  return true;  }  
 </script>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>¡¡</LI>
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
		¡¡<p align="center">
		<img border="0" src="images/02.png" width="926" height="238"><p align="center">
		¡¡<p align="center">
		<a href="http://p.cfjte.com/GameInfo.html"><font color="#FF0000" size="3">Points Game description</font></a>&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000" size="3">&nbsp;<a href="http://p.cfjte.com/FaqList.html"><font color="#FF0000">Help Center</font></a>&nbsp;&nbsp;&nbsp; </font><b> <font color="#008000" size="3">&nbsp;</font></b><p align="center">
		¡¡<p align="center">
		<b> <font color="#008000" size="3">Tip:</font></b><font color="#FF0000" size="3"><a target="_blank" href="http://p.cfjte.com/download/ÆåÅÆÓÎÏ·ÖÐÐÄ.exe"><font color="#0000FF">First game please download and install the game lobby</font></a>(Use<a target="_blank" href="http://ie.sogou.com"><font color="#800000">Sogou browser</font></a>Best download speed)</font><p align="center">
		¡¡<p align="center">
		<b><font color="#0000FF" size="3">You have not activated integral game, click here to activate!</font></b><form method="POST" action="jhgame.asp?ga=<%=rs("username")%>" name="Form" onSubmit="return checkdate()" >
			<p align="center">¡¡</p>
			<p align="center"><font size="6" color="#FF00FF">Recently, the game system will be fully upgraded, the inconvenience to you please understand!</font></p>
			<p align="center">¡¡</p>
			<p align="center"><input type="submit" value="Immediately activated" name="B1" onClick="return confirm('Tip: Are you sure it?')" ></p>
		</form>
		</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a></p>
<p align="center">
¡¡</p>
</body> 
</html>