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
		<td align="center"><span style="font-size: 11pt"><a target="_blank" href="http://item.jd.com/1014734111.html" style="text-decoration: none">��ŷ��DiONLY ������ 5�� ǧ������ Ͷ���ղ� ��ѻƽ�ڼ�</a></span></td>
	</tr>
	<tr>
		<td align="center"><a onClick="return confirm('��ʾ��ÿ�������һ����Ҫ��1����һ�ң���ȷ���������� ')" href="epcgks.asp?epsl=1&cpbh=50"><img border="0" src="http://img30.360buyimg.com/popWaterMark/g7/M00/12/03/rBEHZlDqOosIAAAAAAPrqrU9m-0AADibwDAnFYAA-vC234.jpg" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td align="center"><span style="font-size: 11pt">����������&nbsp; <a target="main" href="/vip/datepay.asp" style="text-decoration: none; font-weight: 700"><font color="#800080">������¼</font></a></span></td>
	</tr>
	</table></div>