<%
session("cjlog")="" 
session("password")=""
%>
<html>
<head>
<title>��ֵ����-��ֵ��������</title>
</head>
<script language="javascript">
function checkdata() {
var Empty=false
if (Form.adminusername.value==""|| Form.password.value=="") {
alert("�û��������벻��Ϊ�գ�");
Form.adminusername.focus();
Form.password.focus();
return (false);
}
return (true);
}
	  </script>
<body bgcolor="#EEEEEE" text="#000000" scroll="no">
<div align="center">
</body>
</html>
<br>
��<table width="575" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td style="font-family: ����; font-size: 9pt">
	��<p>��</p>
	<p align="center"><font color="#FF0000">
	<span style="font-size: 30pt; font-weight: 700">��ֵ-�����̨</span></font></p>
	<p>��</td>
  </tr><BR>
  <tr valign="top"> 
            <form name="Form" method="POST" action="cjgl01.asp" onsubmit="return checkdata()">
    <td style="font-family: ����; font-size: 9pt"> 
      <table width="575" border="0" cellspacing="2" cellpadding="0" background="../images/2.gif" height="142">
        <tr>
          <td height="14" width="79" style="font-family: ����; font-size: 9pt">��</td>
          <td height="14" width="490" style="font-family: ����; font-size: 9pt">��</td>
        </tr>
        <tr>
          <td width="79" height="40" style="font-family: ����; font-size: 9pt">��</td>
          <td width="490" height="40" style="font-family: ����; font-size: 9pt"> 
            <table width="469" border="0" cellspacing="0" cellpadding="0" height="143">
              <tr>
        <td width="142" height="51" align="right" style="border-left: 1px solid #C9D8AD; font-family:����; font-size:9pt" valign="middle" bgcolor="#FFFFFF" bordercolor="#336699"> 
          <font size="2">�û�����</font></td>
        <td width="69%" height="51" style="border-right: 1px solid #C9D8AD; font-family:����; font-size:9pt" valign="middle" bgcolor="#FFFFFF" bordercolor="#336699"> 
            <font size="2"> 
            <input name="glycj" size="20" style="float: left" value="<%=request("dl")%>" ></font></td>
    			</tr>
				<tr>
        <td width="142" height="39" style="border-left: 1px solid #C9D8AD; font-family:����; font-size:9pt" align="right" bgcolor="#FFFFFF" bordercolor="#336699"> 
          <div align="right"><font size="2">��&nbsp;�룺</font></div>
        </td>
        <td width="69%" height="39" style="border-right: 1px solid #C9D8AD; font-family:����; font-size:9pt" bgcolor="#FFFFFF" bordercolor="#336699"> 
            <font size="2"> 
            <input type="password" name="glnm" size="20" style="float: left"></font></td>
  			</tr>
				<tr>
        <td width="89%" height="51" colspan="2" align="center" style="border-left: 1px solid #C9D8AD; border-right: 1px solid #C9D8AD; border-bottom: 1px solid #C9D8AD; font-family:����; font-size:9pt" bgcolor="#FFFFFF" bordercolor="#336699">
          <div align="center">
            <input type="submit" name="Submit" value="�����������" class="lkbtn"></div>
        </td>
  			</tr>
            </table>
          </td>
        </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td style="font-family: ����; font-size: 9pt">
    ��</td>
  </tr>
</table>