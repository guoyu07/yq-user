<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('���ȵ�¼��');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=12"
rs2.open sql2,conn2,1,1
if rs2("payadd")<1 then
   response.write "<script language='javascript'>"
   'response.write "alert('���ڵ����У����������¹��棡');"
   response.write "alert('���ã���������������꣬�����������ԣ�лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
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
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
elseif rs("hfcjdate")>date() then
   response.write "<script language='javascript'>"
   response.write "alert('���ã������ڼ�ͬһ������֤����30���ڽ��ṩһ�γ�ֵ������"&rs("hfcjdate")-date()&"���������лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("pay")+0<100 or rs("pay")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�һ�Ҳ���100����ʱ���ܳ�ֵ��лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<script language="JavaScript">
 function checkdate()  {
  if (Form.ggcall.value=="") {      alert("�����������ֻ�����!");  Form.ggcall.focus();      return false;    }
  if (Form.ggcall2.value=="") {      alert("���ٴ����������ֻ�����!");  Form.ggcall2.focus();      return false;    }
  if (Form.ggcall.value.length<11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall.focus();     return false;    }
  if (Form.ggcall.value.length>11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall.focus();     return false;    }
  if (Form.ggcall2.value.length<11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall2.focus();     return false;    }
  if (Form.ggcall2.value.length>11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall2.focus();     return false;    }
  if (Form.ggcall.value != Form.ggcall2.value) {      alert("����������ֻ����벻ͬ,����������!"); Form.ggcall.focus();    return false;    }
  if (Form.pa3.value=="") {      alert("�����������������!");      return false;    }
  if (Form.pa3.value!=="<%=rs("password3")%>") {      alert("�������벻��ȷ!");      return false;    }
  return true;  }
</script>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="ybhfcj2.asp?user=<%=username%>"  name="Form" onSubmit="return checkdate()">
	<div align="center">
	��<p>��</p>
	<p>��</p>
	<table border="0" id="table1" height="235" width="620">
		<tr>
			<td width="210" align="right">�û�����</td>
			<td width="400" align="left"><b><font color="#0000FF"><%=username%></font></b></td>
			</tr>
		<tr>
			<td width="210" align="right">Ҫ��ֵ���ֻ����룺</td>
			<td width="400" align="left"><input type="text" name="ggcall" size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')"></td>
			</tr>
		<tr>
			<td width="210" align="right">ȷ�ϳ�ֵ���ֻ����룺</td>
			<td width="400" align="left"><input type="text" name="ggcall2" size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')"></td>
			</tr>
		<tr>
			<td width="210" align="right">��ֵ��</td>
			<td width="400" align="left">100</td>
		</tr>
		<tr>
			<td width="210" align="right">�����(10%)��</td>
			<td width="400" align="left">10</td>
		</tr>
		<tr>
			<td width="210" align="right">�ϼ�һ�ң�</td>
			<td width="400" align="left"><b><font color="#FF0000">110</font></b></td>
		</tr>
		<tr>
			<td width="210" align="right">�������룺</td>
			<td width="400" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
	      <p align="center">		
			<td width="210" align="right" height="31"><p align="center">��</td>
			<td width="400" align="right" height="31"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="ȷ����ֵ" name="B1" style="font-family: ����_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	</div>
</form>