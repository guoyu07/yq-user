<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account or password error!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<HTML>
<title></title>
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
<BODY bgcolor="#FFFFFF" >
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
　</DIV>　</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV style="DISPLAY: none" class=Location>Current position:<SPAN id=mTitle>Home</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="90%" height="54%" id="AutoNumber1">
    <tr>
      <td width="93%" height="100%"><form method="POST" action="chklogin3j.asp">
	  <font size="3">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="center">
		<b>
		<font size="5" color="#FF0000" face="楷体_GB2312">A currency - Money Trading Rules</font></b></p>
			  <table border="0" width="100%" id="table1">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						A Subscriber (payer) responsibility <br> 
1, more than "two hours" without success payments to the publisher's designated bank account, the system will be down to the integrity of the gold confiscation withheld, lifting the trade restrictions, and allow other users to complete this transaction. <br> 
2, there is no payment to the successful release party designated bank account in advance operation or malicious actions, affecting the normal transaction process, the system will confiscate gold integrity withheld down, lifted the trading restrictions, allowing other users to complete this transaction. <br> 
Second, the release sell side (receiving side, now seeking party) responsibility <br> 
1, when the successful operation of the payer, payee actually receive the funds, you must be logged platform points within "48 hours", "a currency - financial management" under the "one currency - selling Details" to see the status of the transaction and "I have received payments - notification System to a corresponding increase in the Subscriber currency - balances "operation! <br> 
2, release sell (ask now) before make sure their accounts receivable can be used normally, because your payment account errors or other reasons can not be properly receivable, the impact of normal trading hours payer, the payer to the customer complaint , the transaction will ribbon hair. <br> 
3, in order to deal fair, both parties have certain constraints, the system starts Kingmaker scheme, each user is initially "5", each time trading rules violation deduction "a star", when the rest of the "3 Stars" will is limited to publish or subscribe for one week, when the rest of the "two star", will be limited to publish or subscribe for two weeks, will not get the bonus balance within two weeks, when the rest of the "one star", will be limited to publish or subscribe for three weeks , three weeks will not get the bonus balance and leadership bonuses, when the rest of "0 Star", will be limited to publish or subscribe for 60 days, 60 days will not get the bonus balance and leadership bonuses.</td>
					</tr>
				</table>
				<p align="center"></font><div align="center">
                    <center>
                  <table border="0" cellpadding="0" style="border:1px solid #008000; border-collapse: collapse" width="50%" id="AutoNumber4" height="112" bgcolor="#FFD7D7">
                    <tr> 
                      <td width="42%" height="40" align="right" bgcolor="#FFD7D7"><font style="font-size: 11pt">Username</font></td>
                      <td width="57%" height="40" align="left" bgcolor="#FFD7D7"><font size="3"> <span style="font-size: 11pt"><INPUT name="m_username" size=12 value="<%=username%>" readonly></span></font></td>
                    </tr>
                    <tr> 
                      <td width="42%" height="40" align="right"><font style="font-size: 11pt">Two passwords:</font></td>
                      <td width="57%" height="40" align="left"><font size="3"> <span style="font-size: 11pt"><INPUT name="password3" size=12 type="password" ></span></font></td>
                    </tr>
                    <tr><td width="70%" height="40" align="center" colspan="2" bgcolor="#FFD7D7"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="3"><span style="font-size: 11pt"><input type="submit" value=" Log Management " name="login" class="lkbtn"></span></font></td>
                    </tr>
                    </table>
                    <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><%=request("ts")%></font></p>
                    </center>
              </div>
        </form>      
      </td>
    </tr>
  </table>
  </center>
</div></div>
</BODY>
</HTML>