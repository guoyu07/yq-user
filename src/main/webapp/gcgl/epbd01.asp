<!--#include file="../zqcjimg.asp"-->
<%
jybh=request("bh")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn1,1,1
%>
<html>
<head>
<title>EP��Ų鿴</title>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
</body>
</html>
<div align="center">
<form name="form" METHOD="POST" action="epbd02.asp?bh=<%=rs("payid")%>">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="243">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" colspan="3" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">�޸Ļ�Ա��Ϣ</font></b></td>
      </tr>
      <tr>
        <td align="right" width="37%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font size="3">�̶���ţ�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2"><b><font size="3" color="#FF0000"><%=rs("payid")%></font></b></td>
      </tr>
		<tr>
        <td align="right" width="37%" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font size="3">�û�����</font></td>
        <td width="62%" align="left" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF" colspan="2"><font color="#FF0000" size="3"><b><%=rs("payusername")%></b></font></td>
      </tr>
      <tr>
        <td align="right" width="37%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�� ����</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2"><font style="font-size: 11pt"><%=rs("payname")%> </font> </td>
      </tr>
		<tr>
        <td align="right" width="37%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�����У�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2"><font face="����"><span style="font-size: 11pt"><select size="1" name="bank"><option selected><%=rs("paybank")%></option></select>--<%=rs("paynum")%></span></font></td>
      </tr>
      <tr>
        <td align="right" width="37%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">���п��ţ�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=32 name="card" size="30" value="<%=rs("paycard")%>"></span></font></td>
      </tr>
      <tr> 
        <td align="right" width="37%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt; font-weight:700">�Ŷӱ�ţ�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=32 name="pdid" size="10" value="<%=rs("pdid")%>"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="37%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><b><font style="font-size: 11pt">�������</font></b><font style="font-size: 11pt">��</font></td>
        <td width="8%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=64 name="jyid" value="<%=rs("jyid")%>" size="10"></span></font></td>
        <td width="53%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="submit" value="�� �� �� ��" name="B1" style="font-weight: bold; font-size:10pt"></span></font></td>
      </tr>
      </table>
      </center>
    </div>
</div>