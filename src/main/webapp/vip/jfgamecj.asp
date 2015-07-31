<%
if request.cookies("regid")="" then
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
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&regid&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<html>
<title>积分游戏</title>
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
<script language="JavaScript">
 function checkdate()  {  
  if (Form.cjpay.value=="") {      alert("请输入需要充值的数量!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("充值数量不能为零!");      return false;    }
  if (!chkinteger(Form.cjpay.value)){
	alert('充值数量只能为整字!');
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
  if (Form.cjpay.value<100) {      alert("每次充值不能小于100积分!");      return false;    }
  if (Form.cjpay.value><%=rs("jyg")%>) {      alert("你的充值数量不能大于你剩余的数量 <%=rs("jyg")%> 哦!");      return false;    } 
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("二级密码不正确!");      return false;    }
  return true;  }  
 </script>
<DIV class=daohang>
<DIV class=mainnav>
<DIV class=menu>
<UL>
  <LI>　</LI>
  <LI><a target="main" href="login2j.asp" style="text-decoration: none">个人信息</A> </LI>
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
<DIV class=box_title>积 分 游 戏</DIV>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
        <p align="center">
		<strong><font size="6" color="#000000">积 分 游 戏</font></strong><p align="center">
		　<p align="center">
		<img border="0" src="images/02.png" width="926" height="238"><p align="center">
		　<p align="center">
		<a href="http://p.cfjte.com/GameInfo.html"><font color="#FF0000" size="3">积分游戏介绍</font></a><font size="3">&nbsp;&nbsp;&nbsp;&nbsp; <font color="#FF0000">&nbsp;<a href="http://p.cfjte.com/FaqList.html"><font color="#FF0000">帮助中心</font></a>&nbsp;&nbsp;&nbsp;&nbsp; </font> </font>
		<p align="center">
		　<p align="center">
		<font size="3"><font color="#008000"><b>提示：</b></font><font color="#FF0000"><a target="_blank" href="http://p.cfjte.com/download/棋牌游戏中心.exe"><font color="#0000FF">首次游戏请先下载游戏大厅并安装</font></a></font></font><font color="#FF0000" size="3">（使用<a target="_blank" href="http://ie.sogou.com"><font color="#800000">搜狗浏览器</font></a>下载速度最佳）</font><p align="center">
		　<p align="center">
		<font size="3">游戏前先充值 当前游戏用户名是：<b><font color="#FF00FF"><%=regid%></font></b>&nbsp;&nbsp; 平台总积分为：<b><font color="#008000"><%=rs("jyg")%></font></b></font><p align="center">
		　<form method="POST" action="jtgameok.asp" name="Form" onSubmit="return checkdate()" >
			<div align="center">
				<table border="0" width="59%" id="table1" height="87">
					<tr>
						<td align="right" width="278"><font size="3">需要充值到游戏账户：</font></td>
						<td><input type="text" name="cjpay" size="20"></td>
					</tr>
					<tr>
						<td align="right" width="278"><font size="3">二级密码：</font></td>
						<td><input type="password" name="pa3" size="20"></td>
					</tr>
				</table>
			</div>
			<p align="center">　</p>
			<p align="center">
			<input type="submit" value="提交" name="B1" onClick="return confirm('提示：您确定了吗？')" style="font-size: 12pt" ></p>
		</form>
		<p align="center">
		　<p align="center">
		<font size="2">
		<a target="_blank" href="http://p.cfjte.com/Default.html">暂不充值！</a></font><p align="center">
		　<p align="center">
		　</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>