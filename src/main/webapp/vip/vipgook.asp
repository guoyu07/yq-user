<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
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
   cz01="�й�һ�����ٺš��ͷ�QQ��613697151"
   qq=613697151
elseif dqu="1" or dqu="4" or dqu="3" or dqu="5" or dqu="6" then
   cz01="�й�һ�����ںš��ͷ�QQ��613697152"
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
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">������ע���û�ʱѡ��ĵ���������������Ϊ���ṩ����ķ�������߰���Ч�ʣ�</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">���κ�������������ϵ��<b><font color="#0000FF"><%=cz01%></font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq%>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=qq%>:41" alt="���������ҷ���Ϣ" title="���������ҷ���Ϣ"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">��<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">�����ŷ���������Ա�ֹ���һ���˲����ظ����ϣ���������ÿ����ͬһʱ����ѯͬһ������</font></td>
		</tr>
		</table>
<div align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right">��</p>
	<table border="1" width="100%" id="table1" style="border-collapse: collapse">
		<tr>
			<td>
<p align="left"><b><font size="5">��ѡ���ֵ<font color="#0000FF"><%=cjpay%></font>Ԫ</font></b></p>
<p align="left"><b>��ע��ÿ�γ�ֵ���100Ԫ������100Ԫ��������������200��300��400��ͬʱ��Ҫ��β����</b></p>
<p align="left"><font style="font-size: 16pt" color="#FF0000" face="����"><b>(��ֵ�ɹ�����ʾ�ڿ���һ��������ɹ����ҿ������ѻ�������ͨ˫��ҵ��)</b></font></p>
<p align="center"><font size="5"><b><a href="javascript:openwindow('/vgo/bank.asp?dq=<%=dqu%>')" style="text-decoration: none">������鿴����˺�</a></b></font></p>
			</td>
		</tr>
	</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	��</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">���Ҿ�����ǰ��ֵ��������Ҫ����ѹ������8����10�㣬���г�ֵ��������Ҫ������11��20��ǰ����</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">����11��30�ֺ�Ҫ���ֵ�Ĳ��ܼ�ʱ����������������лл��⣡</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"></p>
	<p align="left">��</div> 
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">������һҳ</font></a></p>