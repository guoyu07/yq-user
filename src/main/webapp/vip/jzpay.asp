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
end if
%>
<%
if rs("payok")=10 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã����������������δ���׳ɹ�����ʱ����ʹ��ת�˹��ܣ�лл��');"
   response.write "location.replace('epmcjl.asp');"
   response.write "</script>"
   response.end
elseif rs("jygt1")=2 or rs("dbt1")=2 then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<html>
<head>
<title></title>
</head>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jzpay.value=="") {      alert("����д��Ҫת�˵�һ��!");      return false;    } 
  if (Form.jzpay.value<0) {      alert("ת�˵�һ�ұ������0!");      return false;    } 
  if (Form.jzpay.value><%=rs("pay")%>)    {   alert("����ת��һ�Ҳ��ܳ�����ʣ���һ�� <%=rs("pay")%>");      return false;    } 
  if (Form.jzuser.value=="") {      alert("����д��Ҫת����û���!");      return false;    }
  if (Form.jzuser.value=="<%=rs("username")%>") {      alert("����ת���Լ�!");      return false;    }
  if (Form.adgl.value=="") {      alert("��д���������!");      return false;    }
  if (Form.dbz.value=="" && document.getElementById("C1").checked) { alert("��д���̳Ƕ����ţ�����Ϊ����!"); return false;  }
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
 
function dbz_show(){
	if (document.getElementById("C1").checked)
		document.getElementById("dbz").style.display="";
	else{
		document.getElementById("dbz").style.display="none";
		document.getElementById("dbz").value="";
	}
}   

</script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b><p align="center" style="margin-top: 0; margin-bottom: 0"></p>
					<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
					<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">
	<span style="background-color: #FFFFFF"><font size="6" color="#008000">�����û����� </font><font color="#FF0000" size="6"><%=regid%></font></span></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0"></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">��</p>
	<p align="center" style="margin-top: 0; margin-bottom: 0">����ʣ��һ��Ϊ<font color="#FF0000"><%=rs("pay")%></font></p>
						<p align="center" style="margin-top: 0; margin-bottom: 0">��</p>
						<table width="500" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-collapse: collapse; border-width: 1px" bordercolor="#111111" height="137">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="500"> 
      <form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="jzok.asp">
      <div align="center">
      <TABLE width="450" border=0 cellSpacing=1 height="124">
  <TBODY>
    <TR class=content> 
      <TD width="169" bgColor=#ffffff align="right" height="45"><b><font style="font-size: 11pt"><font face="Tahoma">��д��ת�˽��</font>��</font></b></TD>
      <TD width="274" bgColor=#ffffff height="45"><font color="#FF0000" size="3"> &nbsp;<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="jzpay" size="15" maxlength="10"> **</font></TD>
    </TR>
    <tr>
      <TD align=middle bgColor=#ffffff width="169" height="33"><b><p align="right"><font style="font-size: 11pt"><font face="Tahoma">д��ת����û���</font>��</font></TD>
      <TD align=middle bgColor=#ffffff width="274" height="33"><p align="left">&nbsp;<input type="text" name="jzuser" size="15"><font color="#FF0000" size="3"> **</font></TD>
    	</tr>
    <TR class=content> 
      <TD align=middle bgColor=#ffffff width="169" height="33"><p align="right">�������룺</TD>
      <TD align=middle bgColor=#ffffff width="274" height="33"><p align="left">&nbsp;<input type="password" name="adgl" size="15"></TD>
    </TR>
    <TR class=content> 
      <TD align=middle bgColor=#ffffff width="169" height="33"><p align="right"><input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1">�˿���ţ�</TD>
      <TD align=middle bgColor=#ffffff width="274" height="33"><p align="left">&nbsp;<input type="text" style="display:none" onKeyUp="value=value.replace(/[^\d]/g,'')" name="dbz" id="dbz" size="20"></TD>
    </TR>
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
	<p style="margin-top: 0; margin-bottom: 0">
	<iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="60%" border="0" frameborder="0" src="tjz.asp"></iframe>
</div>
</body>
</html>