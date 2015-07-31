<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"--><head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("id")
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM sgxt where username = '"&username&"'"
rs_my.open sql_my,conn7,2,3
if not rs_my.eof then
if rs_my("mqfh")>0 and rs_my("mqfh")<rs_my("zfh") and rs_my("new")>0 then
   response.write "<script language='javascript'>"
   response.write "alert('Game revenue is not complete, integral to temporarily stop selling transaction is completed automatically open after earnings!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
%>
<%
sql_nd="select * from sgxt where username = '"&username&"' and DateDiff('d',date(),bddate)=0 " 
Set rs_nd= Server.CreateObject("ADODB.Recordset") 
rs_nd.open sql_nd,conn7,1,1
if not rs_nd.eof then
   response.write "<script language='javascript'>"
   response.write "alert('Game revenue is not complete, integral to temporarily stop selling transaction is completed automatically open after earnings!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from gpjy where id ="&jybh&""
rs_mc.open sql_mc,conn2,2,3
mypay=rs_mc("jypay")
mcsl=rs_mc("mysl")
dqpay=mypay*0.9
mc70a=0.7*dqpay
mc70=int(mc70a*1+0.1)/1
mc30a=0.3*dqpay
mc30=int(mc30a*1+0.1)/1
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")+0<0 or rs("jyg")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, insufficient number of trading points, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif mcsl+0>rs("jyg") or rs("jyg")<1 then
   response.Write "<script language=javascript>alert('Hello, this transaction is greater than the number of points your remaining credit amount "&rs("jyg")&" , Temporarily unable transaction, the transaction needs "&mcsl&" Points, thank you!');location.href='gpjysc.asp'</script>"
   response.end
end if
%>
<%
if rs_mc("jy")>1 or rs_mc("cgdate")<>"" then
   response.Write "<script language=javascript>alert('The stock has been trading transactions or people by its success can not be repeated, please choose other deals!');location.href='gpjysc.asp'</script>"
   response.end
else
   rs_mc("jy")=2
   rs_mc("dqdate")=now()
   rs_mc.update
end if
%>
<script>
//alert("温馨提示：卖出积分所的产生的一币作为开户使用！");
</script>

<p align="center">　</p>
<p align="center">The transaction left countdown<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> Seconds, the timeout did not confirm the transaction will be canceled automatically!</p>
<p align="center">　</p>
<p align="center"><font size="6">The number of sell transactions Points:<font color="#FF0000"><%=mcsl%></font></font></p>
<p align="center"><font size="5">Will be charged to your account:<b><font color="#FF0000"><%=mcsl%></font></b></font><font size="6">积分</font></p>
<div align="center">
	<table border="0" width="52%" id="table1" cellspacing="1" bgcolor="#E6E6E6" height="210">
	<tr>
	<td><b><font size="4"><font color="#FF0000"><%=tgpay%></font>Price is:<font color="#FF0000"><%if rs_mc("pay")<1 then%>0<%=rs_mc("pay")%><%else%><%=rs_mc("pay")%><%end if%>&nbsp; </font>The total is:<font color="#FF0000"><%=rs_mc("jypay")%></font></font><font size="4" color="#800000"> </font></b>
	<p><b><font size="4" color="#800000">After successfully sold:</font></b></p>
	<p><b><font size="4">You deduct 10% of the fee were obtained:<font color="#800080"><%=dqpay%></font> A currency</font></b></p>
	<p><b><font size="4">Of which 70% is assigned to a currency account:<font color="#800080"><%=mc70%></font> A currency</font></b></p>
	<p><b><font size="4">30% allocation to gold account:<font color="#800080"><%=mc30%></font></font></b></p>
	</td>
	</tr>
	</table>
	</div>
<div align="center">
	<table border="0" width="52%" id="table2" cellspacing="1" bgcolor="#FFFFB5">
		<tr>
			<td><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#0000FF">Tips:</font></b><font color="#FF0000">Credits generated by the sale of a currency as the account to use!</font></p></td>
		</tr>
	</table>
</div>
<p align="center"><a onClick="return confirm('Tip: Are you sure it?')" href="mcok.asp?jyg=<%=mcsl%>&id=<%=jybh%>"><input type="button" value="Determine the correct" name="B1" onclick=disabled=true style="font-size: 14pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('Tip: You can determine cancel this deal? ')" href="qxjy.asp?id=<%=jybh%>"><font color="#008000">Return to Market</font></a></b></p>
<p align="center">　</p>
<script>
var secs = 30;  //6为倒计时秒数
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
   window.location="qxjy.asp?id=<%=jybh%>";  //2.htm为到时跳转的页面URL
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>