<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
user=request("id")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&user&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�û�Ա�����ڣ����������Ƿ���ȷ��');"
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
<p style="margin-top: 0; margin-bottom: 0">
<font style="font-size: 20pt; font-weight: 700" color="#800000">���ڲ������Ǹ�</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF"><%=user%></font><font style="font-size: 20pt; font-weight: 700" color="#800000">��ֵ</font></p>

<table width="882" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="882"> 
      <form method="POST" align="center" action="usercj2.asp?user=<%=user%>" name="Form" onSubmit="return checkdate()">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="646" border=0 cellPadding=5 cellSpacing=1 height="128">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="17" align="right" rowspan="4">
		<p style="margin-top: 0; margin-bottom: 0">��</TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right">
		<p style="margin-top: 0; margin-bottom: 0">
		<font face="����" size="4"><b>�յ��ĳ�ֵ��</b></font></TD>
      <TD width="406" bgColor=#ffffff>  
              <p style="margin-top: 0; margin-bottom: 0">  
              <select size="1" name="cjpay">
				<option selected value="0">==��ѡ���յ��ĳ�ֵ���==</option>
				<option value="100">100</option>
				<option value="200">200</option>
				<option value="300">300</option>
				<option value="400">400</option>
				<option value="500">500</option>
				<option value="600">600</option>
				<option value="700">700</option>
				<option value="800">800</option>
				<option value="900">900</option>
				<option value="1000">1000</option>
				<option value="1200">1200</option>
				<option value="1500">1500</option>
				<option value="1800">1800</option>
				<option value="2000">2000</option>
				<option value="2200">2200</option>
				<option value="2500">2500</option>
				<option value="3000">3000</option>
				<option value="4000">4000</option>
				<option value="5000">5000</option>
				<option value="6000">6000</option>
				<option value="7000">7000</option>
				<option value="8000">8000</option>
				<option value="9000">9000</option>
				<option value="10000">1��</option>
				<option value="12000">1��2ǧ</option>
				<option value="15000">1��5ǧ</option>
				<option value="18000">1��8ǧ</option>
				<option value="20000">2��</option>
				<option value="30000">3��</option>
				<option value="50000">5��</option>
				</select></TD>
    </TR>
    <TR class=content> 
      <TD width="181" bgColor=#ffffff align="right" height="31">
		<p style="margin-top: 0; margin-bottom: 0">
		<b>
		<font face="����" size="4">��ֵ��ʽ��</font></b></TD>
      <TD width="406" bgColor=#ffffff height="31">  
              <p style="margin-top: 0; margin-bottom: 0">  
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
      <TD width="181" bgColor=#ffffff align="right" height="36">
		<p style="margin-top: 0; margin-bottom: 0">
		<b>
		<font face="����" size="4">����Ա��ţ�</font></b></TD>
      <TD width="406" bgColor=#ffffff height="36">  
              <p style="margin-top: 0; margin-bottom: 0">  
              <input type="text" name="czy" size="15" value="<%=request("cz")%>"><font color="#FF0000" size="3"> 
				**&nbsp;&nbsp; </font> 
              <INPUT class=normalButton type=submit value="ȷ ��" name=submit2 style="font-size: 12pt; font-weight:bold"></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=3 align=middle bgColor=#ffffff width="630" height="26"> 
              <p style="margin-top: 0; margin-bottom: 0"> 
              <a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">
				������һҳ</font></a></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
<p style="margin-top: 0; margin-bottom: 0">��</div>
</body>
</html>