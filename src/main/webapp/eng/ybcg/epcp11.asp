<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   cpbh=request("cpbh")
end if
%>
<div align="center">
<table border="0" id="table1" cellspacing="1">
	<tr>
		<td align="center"><span style="font-size: 11pt"><a target="_blank" href="http://item.jd.com/912912.html" style="text-decoration: none">美的（Midea） EasyCooker易酷客21K01 电磁炉</a></span></td>
	</tr>
	<tr>
		<td align="center"><a onClick="return confirm('提示：每点击抢购一次需要“1”个一币，您确定抢购了吗？ ')" href="epcgks.asp?epsl=1&cpbh=52"><img border="0" src="http://img20.360buyimg.com/vc/g15/M00/01/05/rBEhWlG65CMIAAAAAAPNEXh_smQAAAOxgMgYJsAA80p112.gif" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td align="center"><span style="font-size: 11pt">抢购进行中&nbsp; <a target="main" href="/vip/datepay.asp" style="text-decoration: none; font-weight: 700"><font color="#800080">抢购记录</font></a></span></td>
	</tr>
	</table></div>