<!--#include file="../ct0618.asp"--><head>
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
'dim rs1,sql1
'set rs1 = Server.CreateObject("ADODB.Recordset")
'sql1="select * from fcxt where id =2 "
'rs1.open sql1,conn2,1,1
'if rs1("jygj")>1.18 then
   'response.write "<script language='javascript'>"
   'response.write "alert('系统拆分期间暂停交易，预计需要一天的调整期，拆分后恢复正常！');"
   'response.write "history.go(-1);"
   'response.write "</script>" 
   'response.end
'end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where id ="&jybh&""
rs_my.open sql_my,conn2,2,3
mypay=rs_my("jypay")
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
elseif rs("jydb")+0<0 or rs("jydb")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, lack of gold balance, recharge or convert coins please, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif mypay+0>rs("jydb") or rs("jydb")<1 then
   response.Write "<script language=javascript>alert('Hello, this need to trade gold "&mypay&" Larger than your remaining coins "&rs("jydb")&" , Temporarily unable to trade, please recharge or convert coins, thank you!');location.href='gpjysc.asp'</script>"
   response.end
end if
%>
<%
if rs_my("jy")>1 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('The integration of the transaction or the transaction has been succeeded by its people, can not be repeated, please choose other deals!');location.href='gpjysc.asp'</script>"
   response.end
else
   rs_my("jy")=2
   rs_my("dqdate")=now()
   rs_my.update
end if
%>

<p align="center">　</p>
<p align="center">The transaction left countdown<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> Seconds, the timeout did not confirm the transaction will be canceled automatically!</p>
<p align="center">　</p>
<p align="center"><font size="6">The need to buy gold as:<font color="#FF0000"><%=mypay%></font></font></p>
<p align="center"><font size="5">The coins in your wallet deduction:<b><font color="#FF0000"><%=mypay%></font></b></font></p>
<p align="center">　</p>
<p align="center"><a onClick="return confirm('Tip: Are you sure it?')" href="myok.asp?db=<%=mypay%>&id=<%=jybh%>"><input type="button" value="Determine the correct" name="B1" onclick=disabled=true style="font-size: 14pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('Tip: You can determine cancel this deal? ')" href="qxjy.asp?id=<%=jybh%>"><font color="#008000">Return to Market</font></a></b></p>
<p align="center">　</p>
<script>
var secs = 15;  //6为倒计时秒数
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