<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
if request("gj")<1 then
   gj=0&request("gj")
else
   gj=request("gj")
end if
tgpay=request("txpay")
dqpay10=tgpay*gj
dqpay=int(dqpay10*1+0.9)/1
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���������������С���㣬лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif dqpay+0>rs("jydb") then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�����ǰ�Ľ���������ֵ����ת��Ϊ��ң�лл��');"
   response.write "location.replace('jztojb.asp');"
   response.write "</script>" 
   response.end
end if
%>
<%
if rs("jydb")>1500 then
Set rs_mc= Server.CreateObject("ADODB.Recordset")
sql_mc="select * from gpjy where jy=0 and mcsl>0 "
rs_mc.open sql_mc,conn2,1,1
if not rs_mc.eof then
   response.write "<script language='javascript'>"
   response.write "alert('�����г����л����ڳ����У��밴������ [��Ҫ����] ��');"
   response.write "location.replace('gpjysc.asp');"
   response.write "</script>" 
   response.end
end if
end if
%>
<div align="center">
	��<p>��</p>
	<table border="1" width="40%" id="table1" height="249" style="border-collapse: collapse">
		<tr>
	<td><b><font size="6" face="����" color="#FF0000">�����ٴ�ȷ��</font></b><p><b><font size="4">��Ҫ�����������<font color="#FF0000"><%=tgpay%></font>��ǰ������<font color="#FF0000"><%=gj%></font></font></b></p>
	<p><b><font size="4">���������Ľ���˻��۳�<font color="#800080"><%=dqpay%></font>���</font></b></p>
	<p>��</p>
	<p align="center"><a onClick="return confirm('��ʾ����ȷ������')" href="myslok.asp?sl=<%=tgpay%>&jo=<%=dqpay%>&gj=<%=gj%>"><input type="button" value="ȷ������" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
	</tr>
	</table>
<p align="center">��</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
<p align="center">��</div>