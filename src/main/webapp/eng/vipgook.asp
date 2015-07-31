<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
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
   cjpay=request("cjpay") 
end if
%>
<%
dqu=request("kf")
if dqu="0" or dqu="7" or dqu="2" or dqu="8" then
   cz01="China Yichuan[No.¢Ù]Customer Service QQ:613697151"
   qq=613697151
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="China Yichuan[No.ºÅ]Customer Service QQ:613697152"
   qq=613697152
end if
%>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<table border="0" width="100%" id="table2" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">According to the region that you chose when registering users, the service center to provide you with personal service, in order to improve efficiency!</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">Have anything please contact me:<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="Click here to send me a message" title="Click here to send me a message"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">¡¡<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">Each department service center personnel division, a person can not repeat plus, not a problem to consult with everyone in the same period</font></td>
		</tr>
		</table>
<div align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right">¡¡</p>
	<table border="1" width="100%" id="table1" style="border-collapse: collapse">
		<tr>
			<td>
<p align="left"><b><font size="5">Recharge your choice<font color="#0000FF"><%=cjpay%></font>yuan</font></b></p>
<p align="left"><b>(Note: Each recharge a minimum of $ 100 and $ 100 increments an integer, such as 200,300,400, also need to add endian)</b></p>
<p align="left"><font style="font-size: 16pt" color="#FF0000" face="¿¬Ìå"><b>(Recharge after a successful display in a currency where available, can be purchased freely gold card, dual-zone consumer business opening or upgrading)</b></font></p>
<p align="center"><font size="5"><b><a href="javascript:openwindow('/vgo/bank.asp?dq=<%=dqu%>')" style="text-decoration: none">Click here to view Remittances</a></b></font></p>
			</td>
		</tr>
	</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	¡¡</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">Please try to recharge ahead, try not to have squeezed in 20:00 to 10:00, all matters to be handled in the upgrade recharge 23:20 ago</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">23:30 recharge after requests can not be processed is normal, thank you understand!</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"></p>
	<p align="left">¡¡</div> 
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">Back to Previous Page</font></a></p>