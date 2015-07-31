<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<head>
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
end if
%>
<%
'dim rs0,sql0
'set rs0 = Server.CreateObject("ADODB.Recordset")
'sql0="select * from fcxt where id =2 "
'rs0.open sql0,conn2,1,1
'if rs0("jygj")>1.18 then
   'response.write "<script language='javascript'>"
   'response.write "alert('系统拆分期间暂停交易，预计需要一天的调整期，拆分后恢复正常！');"
   'response.write "history.go(-1);"
   'response.write "</script>" 
   'response.end
'end if
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
   response.write "alert('Please be sold the next day after the operation account, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
tgpay=request("txpay")
jygj=request("jygj")
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
dqpay10=tgpay*jygj
dqpay92=0.9*dqpay10
dqpay=int(dqpay92*1+0.1)/1
mc70a=0.7*dqpay
mc70=int(mc70a*1+0.1)/1
mc30a=0.3*dqpay
mc30=int(mc30a*1+0.1)/1
if jygj+0<0.77 then
   response.write "<script language='javascript'>"
   response.write "alert('Selling price can not be less than 0.77!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("jygj")+0.03<jygj+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Selling price can not be greater than "&rs1("jygj")+0.03&" oh!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
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
elseif tgpay+0<0 or tgpay+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you can not sell the number is less than zero, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("stopjyg")>19 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, notarized in order to provide a more equitable trading rules, listed a total of up to 20 pens, after the completion of the transaction can continue to publish, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you sell your number is not greater than the number of remaining "&rs("jyg")&" , Thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
Set rs_my= Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where jy=0 and mysl>0 " 
rs_my.open sql_my,conn2,1,1
if not rs_my.eof and rs("jygt1")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Buy market already, please click on demand [I want to sell]!');"
   response.write "location.replace('gpjysc.asp');"
   response.write "</script>" 
   response.end
end if
%>

<div align="center">
	　<p>　</p>
	<table border="1" width="50%" id="table1" height="367" style="border-collapse: collapse">
		<tr>
	<td height="314"><b><font size="6" face="隶书">Please reconfirm listing</font></b>
	<p><b><font size="4">The number of points you want to sell<font color="#FF0000"><%=tgpay%></font>Select the unit is<font color="#FF0000"><%=jygj%></font></font></b></p>
	<p><font size="4" color="#800000"><b>After successfully sold:</b></font></p>
	<p><b><font size="4">You deduct 10% of the fee were obtained:<font color="#800080"><%=dqpay%></font></font></b></p>
	<p><b><font size="4">Of which 70% is assigned to a currency account:<font color="#800080"><%=mc70%></font> A currency</font></b></p>
	<p><b><font size="4">30% allocation to gold account:<font color="#800080"><%=mc30%></font></font></b></p>
<div align="center">
	<table border="0" width="100%" id="table2" cellspacing="1" bgcolor="#FFFFB5">
		<tr>
			<td><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#0000FF">Tips:</font></b><font color="#FF0000">Credits generated by the sale of a currency as the account to use!</font></p></td>
		</tr>
	</table>
</div>
	<p align="center"><a onClick="return confirm('Tip: Are you sure it?')" href="mcslok.asp?sl=<%=tgpay%>&gj=<%=jygj%>"><input type="button" value="Determine the correct" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
		</tr>
		<tr>
	<td><p align="center"><b><font color="#FF0000" style="font-size: 11pt">Tip: This is a listing, after waiting for the buyer to confirm a coin and gold coins before they can get the assignment!</font></b></td>
		</tr>
	</table>
	<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">Back to Previous Page</font></a></p>
<p align="center">　</div>