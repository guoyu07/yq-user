<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('���ȵ�¼��');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   gwuser=request("sgid")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���ȵ�¼��');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>" 
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('���ã��û������������µ�¼��лл��');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>"
   response.end
end if
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.call.value=="") {      alert("�����������ֻ�����!");  Form.call.focus();      return false;    }
  if (Form.call.value.length<11) {      alert("�ֻ���������Ϊ11λ��!"); Form.call.focus();     return false;    } 
  if (Form.call.value.length>11) {      alert("�ֻ���������Ϊ11λ��!"); Form.call.focus();     return false;    }  
  if (Form.userid.value=="") {      alert("�������������֤����!");  Form.userid.focus();      return false;    }
  if (Form.userid.value.length<18) {      alert("���֤��������Ϊ18λ��!"); Form.userid.focus();     return false;    } 
  if (Form.userid.value.length>18) {      alert("���֤��������Ϊ18λ��!"); Form.userid.focus();     return false;    }  
  if (Form.pa3.value=="") {      alert("�����������������!");      return false;    } 
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("�������벻��ȷ!");      return false;    }
  return true;  }  
</script>
<body topmargin="0">
<form method="POST" action="useridok.asp?sgid=<%=rs("username")%>"  name="Form" onSubmit="return checkdate()">
	<div align="center">
	<p>��</p>
	<p><b><font color="#FF0000">Ϊ�˷����ۺ�������Ϸ�˻����벹���������֤��Ϣ��</font></b></p>
	<p><font color="#0000FF">�뱣��������ϵ�ֻ��Ǳ��˵Ĳ�������ʹ���еģ�</font></p>
	<p><font color="#008000">��ȷ���������������֤������һ�µģ�</font></p>
	<table border="0" id="table1" height="222" width="600">
		<tr>
			<td width="203" align="right">�û�����</td>
			<td width="353" align="left"><b><font color="#FF0000"><%=gwuser%></font></b></td>
			</tr>
		<tr>
			<td width="203" align="right">������</td>
			<td width="353" align="left"><%=rs("name")%></td>
		</tr>
		<tr>
			<td width="203" align="right">��ϵ�ֻ���</td>
			<td width="353" align="left">
			<input type="text" name="call" size="20" maxlength="11" value="<%=rs("call")%>"></td>
		</tr>
		<tr>
			<td width="203" align="right">���֤���룺</td>
			<td width="353" align="left"><font color="#0000FF"><input type="text" name="userid" size="20" maxlength="18"></font><font size="2" color="#FF0000"> �������֤����ϵ�ͷ�</font></td>
		</tr>
		<tr>
			<td width="203" align="right">�������룺</td>
			<td width="353" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="203" align="right" height="53"><p align="center">��</td>
			<td width="353" align="right" height="53"><span style="font-size: 9pt"><font size="1"><input type="submit" value="ȷ������" name="B1" style="font-family: ����_GB2312; font-size: 16pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
<p align="center">
</div>
</form>