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
		<td align="center"><span style="font-size: 11pt"><a target="_blank" href="http://item.jd.com/860371.html" style="text-decoration: none">索尼（SONY）KDL-50R556A 50英寸 全高清3D LED液晶电视（黑色）</a></span></td>
	</tr>
	<tr>
		<td align="center"><a onClick="return confirm('提示：每点击抢购一次需要“1”个一币，您确定抢购了吗？ ')" href="epcgks.asp?epsl=1&cpbh=44"><img border="0" src="http://img10.360buyimg.com/n0/g10/M00/16/02/rBEQWFFuPQYIAAAAAAL9KMXys7wAAET1ABrWh4AAv1A130.jpg" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td align="center"><span style="font-size: 11pt">抢购进行中&nbsp; <a target="main" href="/vip/datepay.asp" style="text-decoration: none; font-weight: 700"><font color="#800080">抢购记录</font></a></span></td>
	</tr>
	</table></div>