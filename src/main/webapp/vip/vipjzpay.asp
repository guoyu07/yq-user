<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "top.location.replace('lgotgs.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="cfvip.asp"-->
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&regid&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("vip")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('ֻ��ָ��VIP��Ҳſ���ʹ�ô˹��ܣ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<html>
<head>
<title></title>
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jzpay.value=="") {      alert("����д��Ҫת�˵�һ��!");      return false;    } 
  if (Form.jzpay.value<99) {      alert("ת�˵�һ�ұ�����ڵ���100!");      return false;    } 
  if (Form.jzpay.value>50000) {      alert("ÿ��ת�˵�һ�Ҳ��ܳ���50000!");      return false;    } 
  if (Form.jzpay.value><%=rs("pay")%>)    {   alert("����ת��һ�Ҳ��ܳ�����ʣ���һ�� <%=rs("pay")%>");      return false;    } 
  if (Form.jzuser.value=="") {      alert("����д��Ҫת����û���!");      return false;    }
  if (Form.jzuser.value=="<%=rs("username")%>") {      alert("����ת���Լ�!");      return false;    }
  if (Form.pa3.value=="") {      alert("�����������������!");      return false;    } 
  if (hex_md5(Form.pa3.value) !="<%=md5(rs("password3"))%>") {      alert("�������벻��ȷ!");      return false;    }
  if (!chkinteger(Form.jzpay.value)){
	alert('ת��һ��ֻ��Ϊ����!');
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
<div align="center"><b>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">��</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">��</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF">
	<font size="6" color="#008000">�����û����� </font><font color="#FF0000" size="6"><%=regid%></font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">��</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">��</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">����ʣ��һ��Ϊ��<font color="#FF0000"><%=rs("pay")%></font></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">��</p><table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="vipjzok.asp">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
    <TR class=content>
      <TD width="172" bgColor=#ffffff align="right" height="45"><b><font style="font-size: 11pt"><font face="Tahoma">��д��ת��һ��</font>��</font></b></TD>
      <TD width="271" bgColor=#ffffff height="45"><font color="#FF0000" size="3"> &nbsp;<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="jzpay" size="15" maxlength="10"> **</font></TD>
    </TR>
    <TR class=content>
      <TD align=middle bgColor=#ffffff width="172" height="33"><b><p align="right"><font style="font-size: 11pt"><font face="Tahoma">��д������û���</font>��</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="33"><p align="left">&nbsp;<input type="text" name="jzuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    </TR>
    <tr>
		<b>
      <TD align=middle bgColor=#ffffff width="172" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt">�������룺</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="38"><p align="left">&nbsp;<input type="password" name="pa3" size="20"></TD>
    	</tr>
	<tr>
		<b>
      <TD align=middle bgColor=#ffffff width="172" height="38"><p align="right"><b><font face="Tahoma" style="font-size: 11pt">�������룺</font></TD>
      <TD align=middle bgColor=#ffffff width="271" height="38"><p align="left">&nbsp;<input type="password" name="dlpa" size="20"></TD>
    	</tr>
		<b>
    <TR class=content>
      <TD colSpan=2 align=middle bgColor=#ffffff width="439" height="40"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="ȷ �� ת ��" name=submit2 style="font-size: 11pt" onClick="return confirm('��ʾ����ȷ������')" ></TD>
    </TR>
  </TBODY>
</TABLE>
		</div>
</form>
    </td>
    </tr>
  </table>
	<p style="margin-top: 0; margin-bottom: 0">��</p>
	<p style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0" width="450" height="45" src="vipsq.asp?vip=<%=regid%>"></iframe>
</div>
</body>
</html>