<!--#include file="../ct0618.asp"-->
<!--#include file="secjlog.asp"-->
<%
user=request("id")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&user&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���û��������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<% 
response.cookies("lsyh")="120"
%>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.czy.value==0) {      alert("��д�����Ա���!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("��ѡ���յ��ĳ�ֵ���!");      return false;    }
  if (Form.cjfs.value==0) {      alert("��ѡ���ֵ��ʽ!");      return false;    }
  return true;  }  
 </script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center">
<p style="margin-top: 0; margin-bottom: 0">��</p>
<p style="margin-top: 0; margin-bottom: 0"><font style="font-size: 20pt; font-weight: 700" color="#800000">���ڲ������Ǹ�</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF"><%=user%></font><font style="font-size: 20pt; font-weight: 700" color="#008000"> ��ֵ��������</font></p>

<table width="882" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111">  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="882"> 
      <form method="POST" align="center" action="gwcj02.asp?user=<%=user%>" name="Form" onSubmit="return checkdate()"><input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center"><TABLE width="646" border=0 cellPadding=5 cellSpacing=1 height="128">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="17" align="right" rowspan="4"><p style="margin-top: 0; margin-bottom: 0">��</TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right"><p style="margin-top: 0; margin-bottom: 0"><font face="����" size="4"><b>�յ��ĳ�ֵ��</b></font></TD>
      <TD width="406" bgColor=#ffffff><p style="margin-top: 0; margin-bottom: 0"><input type="text" name="cjpay" size="18" maxlength="4">--<b><font color="#FF0000">����Ϊ�����ֵ</font></b></TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right" height="31"><p style="margin-top: 0; margin-bottom: 0"><b><font face="����" size="4">��ֵ��ʽ��</font></b></TD>
      <TD width="406" bgColor=#ffffff height="31"><p style="margin-top: 0; margin-bottom: 0">  
              <select size="1" name="cjfs">
				<option selected value="0">==��ѡ���ֵ��ʽ==</option>
				<option value="��������">��������</option>
				<option value="ũҵ����">ũҵ����</option>
				<option value="��������">��������</option>
				<option value="֧����">֧����</option>
				<option value="�Ƹ�ͨ">�Ƹ�ͨ</option>
				<option value="����">����</option>
				</select></TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right" height="36"><p style="margin-top: 0; margin-bottom: 0"><b><font face="����" size="4">����Ա��ţ�</font></b></TD>
      <TD width="406" bgColor=#ffffff height="36"><p style="margin-top: 0; margin-bottom: 0">  
        <input type="text" name="czy" size="15" value="<%=request("cz")%>" readonly><font color="#FF0000" size="3"> **&nbsp;&nbsp; </font> 
        <INPUT class=normalButton type=submit value="ȷ ��" name=submit2 style="font-size: 12pt; font-weight:bold"></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=3 align=middle bgColor=#ffffff width="630" height="26"><p style="margin-top: 0; margin-bottom: 0"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
  </tr>
</table>
<p style="margin-top: 0; margin-bottom: 0"><b><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" src="../vgo/cjjl.asp?cj=<%=user%>" border="0" frameborder="0"></iframe>
</div>
</body>
</html>