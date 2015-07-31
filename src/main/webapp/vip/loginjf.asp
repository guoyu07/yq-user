<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
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
    document.getElementById("mTitle").innerHTML="首页";
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
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="90%" height="54%" id="AutoNumber1">
    <tr>
      <td width="93%" height="100%">
		<form method="POST" action="chkloginjf.asp" name="form">
			  <font size="3">
			  <div align="center"><b>积分竞猜规则</b><table border="0" width="75%" id="table1">
					<tr>
						<td><p align="left"><font size="2" face="宋体">一、竞猜共有四种结果（单、双、大、小），系统每10分钟开出一次结果，猜中则可以获得投注额的1.9倍奖励，如果投注“单”100积&nbsp; 分，开奖结果为“单”则为猜中，可获190积分；如果投注“大”100积分，开奖结果为“大”则为猜中，可获190积分；以此类推。</font><p align="left"><font face="宋体" size="2">二、积分投注每注最低为20积分起。</font><p align="left"><font face="宋体" size="2">三、竞猜游戏中没有100%的中奖，所投注的积分不管输赢，均无法撤销，本游戏不是赌博，请保持良好的游戏心态，量力而行。</font></td>
					</tr>
				</table>
				</div>
				<p align="center">
				<p align="center">
				<p align="center">
				</font><div align="center">
                    <center>
                  <table border="0" cellpadding="0" style="border:1px solid #008000; border-collapse: collapse" width="50%" id="AutoNumber4" height="112" bgcolor="#FFD7D7">
                    <tr> 
                      <td width="42%" height="40" align="right" bgcolor="#FFD7D7"> 
                      <font style="font-size: 11pt">用户名：</font></td>
                      <td width="57%" height="40" align="left" bgcolor="#FFD7D7"> 
						<font size="3"> <span style="font-size: 11pt"> 
						<INPUT name="m_username" size=12 value="<%=username%>" readonly></span></font></td>
                    </tr>
                    <tr> 
                      <td width="42%" height="40" align="right"> 
                      <font style="font-size: 11pt">二级密码：</font></td>
                      <td width="57%" height="40" align="left"> 
						<font size="3"> <span style="font-size: 11pt"> 
						<INPUT name="password3" size=12 type="password" ></span></font></td>
                    </tr>
                    <tr><td width="70%" height="40" align="center" colspan="2" bgcolor="#FFD7D7"> 
						<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						<font size="3"> 
                        <span style="font-size: 11pt"> 
                        <input type="submit" value="同意规则 " name="login" class="lkbtn"></span></font></td>
                    </tr>
                    </table>
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