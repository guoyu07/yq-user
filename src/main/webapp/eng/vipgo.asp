<%
if request.cookies("regid")="" or request.cookies("password")="" then
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
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&regid&"'"
rs.open sql,conn2,1,1
%>
<html>
<head>
<title></title>
</head>
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
  if (Form.cjpay.value==0) {      alert("Please select the amount you want to recharge!");      return false;    } 
   return true;  }  
 </script>
<body  text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
��</DIV>��</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>��</LI>
  <LI><A>Personal information</A> </LI>
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
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con></DIV>
<b><font color="#008000" size="5" face="����_GB2312">Your username:</font></b> </font><font color="#FF0000" size="4"><%=regid%> </font></span></p>
  	<div align="center">
  <table width="100%" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="69">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="972"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="vipgook.asp?kf=<%=rs("dqu")%>">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="89%" border=0 cellSpacing=1 height="47">
  <TBODY>
    <TR class=content> 
      <TD width="239" bgColor=#ffffff align="right" height="45">
		<b>
		<font face="Tahoma" style="font-size: 11pt">Please select the amount you want to recharge:</font></b></TD>
      <TD width="278" bgColor=#ffffff height="45">  
              <p align="center">  
              <select size="1" name="cjpay">
				<option selected value="0">==Please select the recharge amount received==</option>
				<option value="100">100</option>
				<option value="200">200</option>
				<option value="300">300</option>
				<option value="400">400</option>
				<option value="500">500</option>
				<option value="600">600</option>
				<option value="700">700</option>
				<option value="800">800</option>
				<option value="900">900</option>
				<option value="1000">1000</option>
				<option value="1200">1200</option>
				<option value="1500">1500</option>
				<option value="1800">1800</option>
				<option value="2000">2000</option>
				<option value="2200">2200</option>
				<option value="2500">2500</option>
				<option value="3000">3000</option>
				<option value="4000">4000</option>
				<option value="5000">5000</option>
				<option value="6000">6000</option>
				<option value="7000">7000</option>
				<option value="8000">8000</option>
				<option value="9000">9000</option>
				<option value="10000">10000</option>
				<option value="12000">12000</option>
				<option value="15000">15000</option>
				<option value="18000">18000</option>
				<option value="20000">20000</option>
				<option value="30000">30000</option>
				<option value="50000">50000</option>
				</select><b><font color="#FF0000" size="3"> 
				**</font></TD>
      <TD width="140" bgColor=#ffffff height="45">  
              
                      <b>
              <INPUT class=normalButton type=submit value="Value determined charge" name=submit2 style="font-size: 11pt"></TD>
      <TD width="196" bgColor=#ffffff height="45">  
              
                      <p align="center"><b><font size="3" color="#008000">
						<a href="login6j.asp"><font color="#008000">Gold Card Activation</font></a></font></b></TD>
    </TR>
  </TBODY>
</TABLE>
		<p align="center"><font color="#FF0000" size="2"><b>(Note: Each recharge a minimum of $ 100 and $ 100 increments an integer, such as 200,300,400, also need to add endian)</b></font></div>
</form>
    </td>
    </tr>
  </table>
  	</div>
  <p style="margin-top: 0; margin-bottom: 0">
						<iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" src="/vgo/cjjl_eng.asp?cj=<%=regid%>" border="0" frameborder="0">
						</iframe>
						</div></div>
</body>
</html>