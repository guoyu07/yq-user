<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="cfvip.asp"-->
<%
ddyb=request("gwpay")
ybsl=cint(ddyb*1.02/1)
pa2=request("pa01")
pa5=md5(LCase(pa2))
if request("ybf")<>"" then
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&request("gwuser")&"'"
rs1.open sql1,conn2,2,3
if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('������û��������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("password")<>pa5 then
   response.write "<script language='javascript'>"
   response.write "alert('����ĵ�¼���벻��ȷ�����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("password3")<>request("pa02") then
   response.write "<script language='javascript'>"
   response.write "alert('����Ķ������벻��ȷ�����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs1("fingerid")=request("pid")
   rs1.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM dateip"
rs_d1.open sql_d1,conn1,1,3
rs_d1.addnew
rs_d1("user")=rs1("username")
rs_d1("dlfs")="ָ��¼��"
rs_d1.update
end if
response.Write "<script language=javascript>alert('¼������ɹ���');location.replace('finger.asp');</script>"
response.end
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="finger.asp?ybf=actok"  name="Form">
	<input type="hidden" name="ybpay" size="20" value="<%=int(ybsl/1)%>">
	<div align="center">
	��<p><font size="6" color="#FF0000">ָ��ϵͳ����ҳ��</font></p>
	<table border="0" id="table1" height="210" width="560">
		<tr>
			<td width="214" align="right">������ʶ��</td>
			<td width="336" align="left"><input type="text" name="sid" size="20" value="<%=request("sid")%>">0¼��1��¼2����</td>
			</tr>
		<tr>
			<td width="214" align="right">ָ����Ϣ��</td>
			<td width="336" align="left"><input type="text" name="pid" size="20" value="<%=request("pid")%>"></td>
			</tr>
		<tr>
			<td width="214" align="right">�û�����</td>
			<td width="336" align="left"><b><font color="#0000FF"><%=gwuser%><input type="text" name="gwuser" size="20"></font></b></td>
			</tr>
		<tr>
			<td width="214" align="right">��¼���룺</td>
			<td width="336" align="left"><input type="password" name="pa01" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right">�������룺</td>
			<td width="336" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa02" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right" height="31"><p align="center">��</td>
			<td width="336" align="right" height="31"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="ȷ��¼��" name="B1" style="font-family: ����_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p>�벻Ҫʹ�������˻����в�����һ������3�����</p>
	</div>
</form>