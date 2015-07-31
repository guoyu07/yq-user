<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
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
   response.write "alert('操作错误，请重新登录！');"
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
  if (Form.jzpay.value=="") {      alert("请填写您要转账的一币!");      return false;    } 
  if (Form.jzpay.value<99) {      alert("转账的一币必须大于等于100!");      return false;    } 
  //if (Form.indexOf(jzpay/100,".").value!==0) {      alert("每次转账的EP必须是100的倍整数如：100，200，300，400，500!");      return false;    } 
  if (Form.jzpay.value><%=rsb("pay")*0.05+rsb("pay")%>)    {   alert("您的转账一币不能超过您剩余的一币 <%=rsb("pay")%> 加5%的服务费！");      return false;    } 
  if (Form.jzuser.value=="<%=dquser%>") {      alert("不能转给自己!");      return false;    }
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (Form.pa3.value!=="<%=rsb("password3")%>") {      alert("二级密码不正确!");      return false;    }
  if (Form.vipsq.value=="") {      alert("请填写授权码!");      return false;    }
  if (!chkinteger(Form.jzpay.value)){
	alert('转账一币只能为整字!');
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
<title>团队服务中心联系</title>
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
</head>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><A>个人信息</A> </LI>
  <LI><A>业绩查询</A> </LI>
  <LI><A>财务管理</A> </LI>
  <LI><A>消息管理</A> </LI>
  <LI><a style="text-decoration: none" target="_top" href="logout.asp">退出系统</A> </LI>
  </UL><!-- clear the floats if required -->
<DIV class=clear></DIV></DIV>
<DIV style="DISPLAY: none" class=Location>当前位置：<SPAN id=mTitle>首页</SPAN></DIV></DIV></DIV>
<DIV class=box_title>一 币 变 化 明 细</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">

  <div align="center">
	<table border="0" width="60%" id="table1" height="209" cellspacing="3" cellpadding="2">
		<tr>
			<td align="right" width="32%">团队服务中心编号：</td>
			<td width="66%"><font color="#FF0000"><%=left(rs("username"),2)%>***</font></td>
		</tr>
		<tr>
			<td align="right" width="32%">称谓：</td>
			<td width="66%"><font color="#0000FF"><%=rs("name")%></font></td>
		</tr>
		<tr>
			<td align="right" width="32%">联系QQ：</td>
			<td width="66%"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=rs("qq")%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=rs("qq")%>:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a><%=rs("qq")%></td>
		</tr>
		<tr>
			<td align="right" width="32%">联系电话：</td>
			<td width="66%"><%=rs("call")%></td>
		</tr>
		<tr>
			<td align="right" width="32%">收款账号：</td>
			<td width="66%"><%=rs("bank")%>-<%=rs("card")%></td>
		</tr>
		<tr>
			<td><p align="right">开户行所在地：</td>
			<td><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%>支行</td>
		</tr>
		<tr>
			<td colspan="2"><p><b><font size="2" color="#008000">&nbsp;&nbsp;&nbsp; 有关业务问题可咨询，如您无法在一币市场进行收购EP的操作或您想省去在收购一币中（打款，等对方确认）的中间环节，就可以联系本团队服务中心快速购买（按1000一币，付款950元的比例进行）</font></b></td>
		</tr>
	</table>
	<form method="POST" name="Form" action="vipupok.asp" onSubmit="return checkdate()">
		<p>　</p>
		<p><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">转账给团队服务中心</font></p>
		<table border="0" width="75%" id="table2" height="249">
			<tr>
				<td align="right" colspan="2" height="151" bgcolor="#E1FFE1">
				<p align="left"><font size="3" color="#0000FF">说明：</font></p>
				<p align="left"><font size="2">此功能可以通过团队服务中心帮您把一币转到您需要开户的用户名上（仅限团队网络内）但需要支付给服务中心5%的操作服务费（仅收转出方）；如您有1000一币需要从A用户名转到B用户名，您登录A用户名按下面操作向服务中心转1000一币（系统自动扣除50一币）即您的A用户名会有一笔1050一币支出到团队服务中心（50一币即5%作为中心服务费），中心收到后随即转1000一币到B用户名（B用户名实际收到1000一币，这个过程就完成了您所需要的效果。）</font></p>
				<p align="left"><font size="3" color="#0000FF">提示：</font></p>
				<p align="left"><font size="2">一经由服务中心转出的一币是不可申请卖出，只能用于开户，比如服务中心帮您转了1000一币到B用户名，那B用户名收到的这1000一币将不能发布卖出到一币交易市场。</font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="宋体" size="2">从本户（<%=dquser%>）转出一币数量：</font></td>
				<td width="58%"><font face="宋体"><input type="text" name="jzpay" size="20"><input type="hidden" name="jzuser" size="20" value="<%=rs("username")%>" readonly></font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="宋体" size="2">本户（<%=dquser%>）的二级密码：</font></td>
				<td width="58%"><font face="宋体"><input type="password" name="pa3" size="20"></font></td>
			</tr>
			<tr>
				<td align="right" width="41%"><font face="宋体" size="2">团队服务中心授权码：</font></td>
				<td width="58%"><font face="宋体"><input type="text" name="vipsq" size="20"><font size="2">请联系中心索取</font></font></td>
			</tr>
		</table>
		<p>　</p>
		<p><input type="submit" value="提交" name="B1"></p>
	</form>
	<p>　</div>
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>