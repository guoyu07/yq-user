<!--#include file="checkadmin.asp"-->
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jcname.value=="") {      alert("��д��ת���û���!");      return false;    } 
  if (Form.jzpay.value<5000) {      alert("ת�˵Ľ��������5000!");      return false;    } 
  if (Form.syuser.value=="") {      alert("����д�����û���!");      return false;    }
  if (Form.jcname.value==Form.syuser.value) {      alert("����ת���Լ�!");      return false;    }
  if (!chkinteger(Form.jzpay.value)){
	alert('ת�˽��ֻ��Ϊ����!');
	document.Form.jzpay.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = true;
for (i=0; i<checkStr.length; i++) {
ch = checkStr.charAt(i);
if (checkOK.indexOf(ch) == -1) {
allValid = false;
break;
}
if ((ch == '+' || ch == '-') && i>0) {
allValid = false;
break;
}
}
return (allValid);
}
   return true;  }  
 </script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center">

                      <b>
						��<p align="center" style="margin-top: 0; margin-bottom: 0">
	��</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	��</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF">
	<font size="6" color="#008000">������ת��</font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">
	��</p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">��</p>
						<table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="bdbjzok.asp">
      <input type="hidden" maxlength=10 name="postcode" size="6" style="border: 1px solid #99CCFF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="123456">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
    <tr>

                      <b>
      <TD width="169" bgColor=#ffffff align="right" height="45">
		<b>
		<font face="Tahoma" color="#FF00FF" style="font-size: 11pt">ת���û�����</font></b></TD>
      <TD width="274" bgColor=#ffffff height="45">  
              <font color="#FF0000" size="3"> &nbsp;<input type="text" name="jcname" size="15"> **</font></TD>
    </tr>
    <TR class=content> 
      <TD width="169" bgColor=#ffffff align="right" height="45">
		<b>
		<font style="font-size: 11pt"><font face="Tahoma">ת�˽��</font>��</font></b></TD>
      <TD width="274" bgColor=#ffffff height="45">  
              <font color="#FF0000">&nbsp;</font><font color="#FF0000" size="3"><select size="1" name="jzpay">
				<option selected value="10000">--1��--</option>
				<option value="20000">--2��--</option>
				<option value="30000">--3��--</option>
				<option value="50000">--5��--</option>
				<option value="100000">--10��--</option>
				</select> **</font></TD>
    </TR>
    <TR class=content> 
      <TD align=middle bgColor=#ffffff width="169" height="41"><b><p align="right">
		<font face="Tahoma" style="font-size: 11pt">�����û�����</font></TD>
      <TD align=middle bgColor=#ffffff width="274" height="41"><p align="left">&nbsp;<input type="text" name="syuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </TR>
    <TR class=content> 
      <TD colSpan=2 align=middle bgColor=#ffffff width="439" height="32"> 
              <p style="margin-top: 0; margin-bottom: 0"> 
              <INPUT class=normalButton type=submit value="ȷ �� ת ��" name=submit2 style="font-size: 11pt" onClick="return confirm('��ʾ����ȷ������')" ></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
						</div>
</body>
</html>