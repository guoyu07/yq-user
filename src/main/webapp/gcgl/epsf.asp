<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�½���ҳ 1</title>
</head>
<body>
<%
userid=request("sfid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (form.sflb.value==0) {    alert("��ѡ��֧�����");      return false;    }
return true;  }  
</script>
<form method="POST" action="sfsave.asp?sfid=<%=userid%>" name="form" onSubmit="return checkdate()">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>Ҫ���ѵ��û�����<font color="#008000"><%=userid%></font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="83" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>��ǰEP��</b></font></td>
				<td height="27"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs("pay")%></b></font></td>
			</tr>
			<tr>
				<td align="right" width="83"><b><font size="2">���Ѷ</font></b></td>
				<td><input type="text" name="sfpay" size="8"><b><font color="#FF00FF" size="2"><select size="1" name="sflb">
				<option selected value="0">��ѡ��</option>
				<option value="����֧��">����</option>
				<option value="����֧��">����</option>
				<option value="ת��">ת��</option>
				<option value="��ѵ��">��ѵ��</option>
				</select></font></b></td>
			</tr>
		</table>
	</div>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="�ύ����" name="B1"></p>
</form>
</body>
</html>