<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
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
'dim rs0,sql0
'set rs0 = Server.CreateObject("ADODB.Recordset")
'sql0="select * from fcxt where id =2 "
'rs0.open sql0,conn2,1,1
'if rs0("jygj")>1.18 then
   'response.write "<script language='javascript'>"
   'response.write "alert('ϵͳ����ڼ���ͣ���ף�Ԥ����Ҫһ��ĵ����ڣ���ֺ�ָ�������');"
   'response.write "history.go(-1);"
   'response.write "</script>" 
   'response.end
'end if
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
   response.write "alert('�������۲���С�� 0.77 ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("jygj")+0.03<jygj+0 then
   response.write "<script language='javascript'>"
   response.write "alert('�������۲��ܴ��� "&rs1("jygj")+0.03&" Ŷ��');"
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
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("bddate")+100>Now() and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('δ��100����˻���������ʱֹͣ�������ף�������ɺ��Զ����ţ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���������������С���㣬лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("stopjyg")>19 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�Ϊ���ṩ����ƽ��֤�Ľ��׹����ۼƹ������20�ʣ���������ɺ�ſ��Լ���������лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('���ã��������������ܴ�����ʣ������ "&rs("jyg")&" ��лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM sgxt where username = '"&username&"'"
rs_my.open sql_my,conn7,2,3
if not rs_my.eof then
if rs_my("mqfh")>0 and rs_my("mqfh")<rs_my("zfh") and rs_my("new")>0 and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('��Ϸ����δ��ɣ�������ʱֹͣ�������ף�������ɺ��Զ����ţ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
%>
<%
Set rs_my= Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where jy=0 and mysl>0 " 
rs_my.open sql_my,conn2,1,1
if not rs_my.eof and rs("jygt1")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('�����г���������Ϣ���밴������ [��Ҫ����] ��');"
   response.write "location.replace('gpjysc.asp');"
   response.write "</script>" 
   response.end
end if
%>
<div align="center">
	��<p>��</p>
	<table border="1" width="50%" id="table1" height="367" style="border-collapse: collapse">
		<tr>
	<td height="314"><b><font size="6" face="����">�����ٴ�ȷ���Ƿ����</font></b>
	<p><b><font size="4">��Ҫ������������<font color="#FF0000"><%=tgpay%></font>ѡ�񵥼���<font color="#FF0000"><%=jygj%></font></font></b></p>
	<p><font size="4" color="#800000"><b>�����ɹ���</b></font></p>
	<p><b><font size="4">�۳�10%�������������õ���<font color="#800080"><%=dqpay%></font></font></b></p>
	<p><b><font size="4">����70%���䵽һ���˻���<font color="#800080"><%=mc70%></font> һ��</font></b></p>
	<p><b><font size="4">����30%���䵽����˻���<font color="#800080"><%=mc30%></font></font></b></p>
	<p align="center"><a onClick="return confirm('��ʾ����ȷ������')" href="mcslok.asp?sl=<%=tgpay%>&gj=<%=jygj%>"><input type="button" value="ȷ������" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
		</tr>
		<tr>
	<td><p align="center"><b><font color="#FF0000" style="font-size: 11pt">��ʾ����Ϊ���ƣ��ȴ����ȷ�Ϻ�һ�Һͽ�Ҳſ��Եõ����䣡</font></b></td>
		</tr>
	</table>
	<p align="center">��</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
<p align="center">��</div>