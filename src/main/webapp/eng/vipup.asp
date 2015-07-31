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
   response.write "location.replace('login.asp');"  
   response.write "</script>"
   response.end
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='xtgc001'"
rs.open sql,conn2,1,1
%>
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
  <LI>¡¡</LI>
  <LI><A>Personal information</A> </LI>
  <LI><A>Query results</A> </LI>
  <LI><A>Financial Management</A> </LI>
  <LI><A>Message Management</A> </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">Exit the System</A> </LI>
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>Current position:<SPAN id=mTitle>Home</SPAN></DIV></DIV></DIV>
<DIV class=box_title>Team Service Center</DIV>
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
			<td colspan="2"><p><b><font size="2" color="#008000">&nbsp;&nbsp;&nbsp; Consult the relevant business issues, such as you can not be in a money market operations or the acquisition of a currency that you want to omit the closing of a currency (for play money, the other side to confirm) the intermediate links, you can contact our service center team Quick purchase (a currency by 1000, the proportion of the payment will be 950 yuan)</font></b></td>
		</tr>
	</table>
	</div>
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a></p>
</body> 
</html>