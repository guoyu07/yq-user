<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
<style>
.language a { display:block; float:left; color:#fff; font-family:"微软雅黑"; height:16px; line-height:16px; width:56px; text-align:center; margin-left:15px; border-radius:3px; margin-bottom:5px; margin-top:-5px; color:#fff; background:#8a97fb;}
.eng_user_info { height:24px; line-height:24px; }
.eng_user_info td { text-align:-left; }
.eng_user_info td span { margin-left:0px; }
/**
.language a:Hover { 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#90eeb935, endColorstr=#90f6c358);
background: -webkit-linear-gradient(top, #eeb935 0%,#f6c358 100%);
background: -moz-linear-gradient(top, #eeb935 0%,#f6c358 100%);
background: -o-linear-gradient(top, #eeb935 0%,#f6c358 100%);
background: -ms-linear-gradient(top, #eeb935 0%,#f6c358 100%);
background: linear-gradient(top, #eeb935 0%,#f6c358 100%);
}
**/
</style>
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
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
dim sql 
dim rs 
sql="select * from gcuser where username = '" & regid & "'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
acbpay=rs("cbpay")
atxpay=rs("txpay")
apay=rs("pay")
ajjpay=rs("jjpay")
argpay=rs("rgpay")
amcpay=rs("mcpay")
ajydb=rs("jydb")
ajyg=rs("jyg")
acfa=rs("cfa")
acfb=rs("cfb")
adqu=rs("dqu")
agdgc=rs("gdgc")
aljfh=rs("ljfh")
aname=rs("name")
aqq=rs("qq")
acall=rs("call")
auserid=rs("userid")
asjb=rs("sjb")
asybdb=rs("sybdb")
asyep=rs("syep")
avip=rs("vip")
acxt=rs("cxt")
rs.close
Set rs=Nothing
%>
<%
dim sql_sg
dim rs_sg
sql_sg ="select * from sgxt where username = '" & regid & "'" 
Set rs_sg= Server.CreateObject("ADODB.Recordset") 
rs_sg.open sql_sg,conn7,1,1
if not rs_sg.eof then
if rs_sg("fhbl")=0.005 then
   fbpay=0.5
   mqfh=rs_sg("mqfh")
elseif rs_sg("fhbl")=0.01 then
   fbpay=1
   mqfh=rs_sg("mqfh")
end if
end if
rs_sg.close
Set rs_sg=Nothing
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=2"
rs2.open sql2,conn2,1,1
ajygj=rs2("jygj")
rs2.close
Set rs2=Nothing
%>
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.0006 and jy=2"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
rsTest("jy")=0
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
if asjb=1 then
   fdpay=2000
elseif asjb=2 then
   fdpay=4000
elseif asjb=4 then
   fdpay=8000
elseif asjb=10 then
   fdpay=20000
elseif asjb=20 then
   fdpay=40000
elseif asjb=40 then
   fdpay=80000
elseif asjb=100 then
   fdpay=200000   
end if
%>
<DIV class=tips>
      <DIV id=main_left_main>
      
      <div class="language">
        	<a href="../vip/manager.asp" target="_top">中文版</a>
            <a href="manager.asp" target="_top">English</a>
        </div>
	  <table border="0" width="170" id="table1" height="100" class="eng_user_info">
		<tr>
			<td width="90" align="right"><span style="font-size: 10pt; font-family: 宋体">Username：</span></td>
			<td><font color="#FF0000" size="2"><b><a target="main" href="userlist.asp"><font color="#FF0000"><%=regid%></font></a></b></font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; font-family: 宋体">Total trading<span style="font-size:10pt;">:</span></span></td>
			<td><font size="2"><%if acbpay<1 then%>0<%=acbpay%><%else%><%=acbpay%><%end if%></font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; font-family: 宋体">Total use<span style="font-size:10pt;">:</span></span></td>
			<td><font size="2"><%=atxpay%></font></td>
		</tr>
		<tr>
			<td width="90" align="right"><span style="font-size: 9pt; font-family: 宋体; ">Current spend<span style="font-size:10pt;">:</span></span></td>
			<td><font color="#0000FF" size="2"><b><%if apay<1 then%>0<%=apay%><%else%><%=apay%><%end if%></b></font></td>
		</tr>
		</table>
      <DL id=wenzhang>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">Account Overview</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="datepay_jj.asp"><font color="#000000">Stakes a Coins：</font><font color="#FF0000"><%=ajjpay%></font></a>
            <LI><a target="main" href="datepay_rg.asp"><font color="#000000">Subscription：</font><font color="#008000"><%=argpay%></font></a>
            <LI><a target="main" href="datepay_mc.asp"><font color="#000000">Cumulative sell：</font><font color="#0000FF"><%=amcpay%></font></a>
            <LI>The remaining coins：<font color="#800080" size="2" face="宋体"><%=ajydb%></font>
            <LI>Points Price：<font color="#FF0000" size="2"><%if ajygj<1 then%>0<%=ajygj%><%else%><%=ajygj%><%end if%></font>
            <LI>Points Number：<font color="#0000FF"><font size="2"><%=ajyg%></font></font>
            <LI>Split Views：<font color="#800000"><font size="2"><%=acfa%></font></font>
            <LI>Split Ratio：<font color="#008000"><font size="2"><%=acfb%></font></font>
            </LI></UL></DD></DL>
          <DD>
          <DL>          
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">Personal information</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="/vgo/gg_eng.asp?jhid=<%=regid%>&dq=<%=adqu%>">Notice View</a>
            <LI><a target="main" href="tgurl.asp?tg=<%=regid%>">Rules of the game</a>
            <LI><a target="main" href="login2j.asp" style="text-decoration: none">Modify Information</a>
            <LI><a target="_blank" style="text-decoration: none; font-weight: 700" href="http://bbs.zgyce.com"><font color="#FF00FF">Learning Area</font></a>
            <LI><a target="main" href="gcbf.asp">bonus points：<font color="#FF0000"><%=agdgc%></font></a>
            <LI><a target="main" href="gcbftj.asp">Total dividend：<font color="#008000"><%=aljfh%></font></a>
            <LI><a target="main" href="http://yb.zgyce.com/User_Reg.asp?user=<%=regid%>&name=<%=aname%>&qq=<%=aqq%>&tel=<%=acall%>&userid=<%=auserid%>"><font color="#0000FF">Manage My Store</font></a>
            <LI>View VAS
            <LI><a target="main" href="/vgo/dldate_eng.asp?dl=<%=regid%>" style="text-decoration: none">View login log</a>
            <LI>
                <a target="main" href="http://english.zgybe.com/sfz_eng.asp" style="text-decoration: none">View agreement</a>
            </LI></UL></DD></DL>            
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">Query results</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="sgks01.asp?up=<%=regid%>" style="text-decoration: none">Game business</a>
            <LI>Game level：<font color="#0000FF"><%=asjb%></font>
            <LI>Declaration balance：<font color="#0000FF"><%=asybdb%></font>
            <LI><a target="main" href="datepay.asp">May account：<font color="#0000FF"><%=apay+asyep%></font></a>
            <LI><a target="main" href="vipup.asp?my=<%=regid%>" style="text-decoration: none">Contact Team</a>
            <LI><a target="main" href="bdbdate.asp" style="text-decoration: none">Declaration Details</a><%if avip=1 then%>--<b><a target="main" href="bdbjzpay.asp"><font size="2" color="#008000">Turn out</font></a></b><%end if%>
            <LI>Bonus：<font color="#0000FF"><%=fdpay%></font>
            <LI><font color="#FF0000">Income ratio：<%if fbpay<1 then%>0<%=fbpay%>%<%else%><%=fbpay%>%<%end if%></font>
            <LI><font color="#FF0000">Currently income：<%=mqfh%></font>
            <LI><a target="main" href="tgdown.asp" style="text-decoration: none">My client</a>
            <LI><a target="main" href="reg.asp" style="text-decoration: none">Add Account</a>
            </LI></UL></DD></DL>
	    <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">A coin Money</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="loginep.asp" style="text-decoration: none"><font color="#FF0000">A Coins quiz</font></a>
            <LI><a target="main" href="datepay.asp" style="text-decoration: none">A Coins breakdown</a>
            <LI><a target="main" href="ybcg/epcg.asp" style="text-decoration: none"><font color="#0000FF">A Coins buying</font></a>
            <LI><a target="main" href="login3j.asp" style="text-decoration: none">A Coins to sell</a><%if avip=1 then%>--<b><a target="main" href="vipjzpay.asp"><font size="2" color="#008000">Turn out</font></a></b><%end if%>
            <LI>A Coins Credit Star：<font color="#0000FF"><%=acxt%></font>
            <LI><a target="main" href="login8j.asp" style="text-decoration: none">exchange market</a>
            <LI><a target="main" href="loginmc.asp" style="text-decoration: none">Ask details</a>
            <LI><a target="main" href="loginmy.asp" style="text-decoration: none">Call Details</a>
            <LI><a target="main" href="login5j.asp" style="text-decoration: none">Share Gold Card</a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">Points Money</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="vipgo.asp" style="text-decoration: none">I want to recharge</a>
            <LI><a target="main" href="loginjf.asp" style="text-decoration: none"><font color="#FF0000">Integral quiz</font></a>
            <LI><a target="main" href="jfcg/0ycg.asp" style="text-decoration: none"><font color="#0000FF">Integral buying</font></a>
            <LI><a target="main" href="jfgame.asp" style="text-decoration: none"><font color="#0000FF">Points Game</font></a>
            <LI><a target="main" href="mysl.asp" style="text-decoration: none">Integral to buy (Buy)</a>
            <LI><a target="main" href="mcsl.asp" style="text-decoration: none">Integral sell (sell)</a>
            <LI><a target="main" href="gpjy.asp" style="text-decoration: none">Transaction details</a>
            <LI><a target="main" href="gpjysc.asp" style="text-decoration: none">Credit Market</a>
            <LI>Split Views：<font color="#800000"><font size="2"><%=acfa%></font></font>
            <LI>Multiples split：<font color="#008000"><font size="2"><%=acfb%></font></font>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT><b><A class=hide href="javascript:void(0);"><font size="2">Consumption</font></A></b> 
          <DD>
          <UL>
            <LI><a target="main" href="datepay.asp"><font size="2" color="#008080">Available Coins：</font><font size="2" color="#FF0000"><%=apay%></font></a>
			<LI><a target="main" href="ybhfcj.asp">Recharge(100)</a>
			<LI><a target="main" href="http://yb.zgyce.com/index.asp?vipid=<%=regid%>&vippa=<%=password%>"><font size="2" color="#008080">A Coin Redemption</font></a>
			<LI><a target="main" href="http://yb.zgyce.com/admin/ybhg_List.asp?hguser=<%=regid%>"><font size="2" color="#008080">A Coin Records</font></a>
            </LI></UL></DD></DL>
        <DD>
        <DL>
          <DT>
			<a style="text-decoration: none; font-weight:700" target="_top" href="logout.asp"><font size="2">Exit the System</font></A></DT></DL>

		  
		  </DD></DL></DIV></DIV>
<meta http-equiv=Refresh content="180; url=">