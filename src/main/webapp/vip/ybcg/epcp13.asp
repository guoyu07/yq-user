<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
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
		<td align="center"><span style="font-size: 11pt"><a target="_blank" href="http://item.jd.com/877642.html" style="text-decoration: none">������Joyoung��˫ĥϵ�� ������</a></span></td>
	</tr>
	<tr>
		<td align="center"><a onClick="return confirm('��ʾ��ÿ�������һ����Ҫ��1����һ�ң���ȷ���������� ')" href="epcgks.asp?epsl=1&cpbh=54"><img border="0" src="http://img20.360buyimg.com/vc/g12/M00/07/00/rBEQYFGVqf0IAAAAAACWC8S_zosAABXhgC57mUAAJYj526.jpg" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td align="center"><span style="font-size: 11pt">����������&nbsp; <a target="main" href="/vip/datepay.asp" style="text-decoration: none; font-weight: 700"><font color="#800080">������¼</font></a></span></td>
	</tr>
	</table></div>