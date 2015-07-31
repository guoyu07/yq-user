<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
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
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.cjpay.value==0) {      alert("请选择您要充值的金额!");      return false;    } 
   return true;  }  
 </script>
<body  text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<DIV class="top_bg cBlue">
<DIV style="POSITION: relative; HEIGHT: 10px">
　</DIV>　</DIV>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><A>个人信息</A> </LI>
  <LI><A>业绩查询</A> 
  </LI>
  <LI><A>财务管理</A> 
  </LI>
  <LI><A>消息管理</A> 
  </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">退出系统</A> 
  </LI>
  
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title></DIV>
<DIV class=box>
<DIV class=box_con></DIV>
<b><font color="#008000" size="5" face="楷体_GB2312">您的用户名：</font></b> </font><font color="#FF0000" size="4"><%=regid%> </font></span></p>
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
		<font face="Tahoma" style="font-size: 11pt">请选择您要充值的金额：</font></b></TD>
      <TD width="278" bgColor=#ffffff height="45">  
              <p align="center">  
              <select size="1" name="cjpay">
				<option selected value="0">==请选择收到的充值金额==</option>
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
				<option value="10000">1万</option>
				<option value="12000">1万2千</option>
				<option value="15000">1万5千</option>
				<option value="18000">1万8千</option>
				<option value="20000">2万</option>
				<option value="30000">3万</option>
				<option value="50000">5万</option>
				</select><b><font color="#FF0000" size="3"> 
				**</font></TD>
      <TD width="140" bgColor=#ffffff height="45">  
              
                      <b>
              <INPUT class=normalButton type=submit value="确 定 充 值" name=submit2 style="font-size: 11pt"></TD>
      <TD width="196" bgColor=#ffffff height="45">  
              
                      <p align="center"><b><font size="3" color="#008000">
						<a href="login6j.asp"><font color="#008000">激活金币卡</font></a></font></b></TD>
    </TR>
  </TBODY>
</TABLE>
		<p align="center"><font color="#FF0000" size="2"><b>（注：每次充值最低100元，并以100元的整数递增，如200，300，400，同时需要加尾数）</b></font></div>
</form>
    </td>
    </tr>
  </table>
  	</div>
  <p style="margin-top: 0; margin-bottom: 0">
						<iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" src="/vgo/cjjl.asp?cj=<%=regid%>" border="0" frameborder="0">
						</iframe>
						</div></div>
</body>
</html>