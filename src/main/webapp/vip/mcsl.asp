<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="cfvip.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('��ʱ����������');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("bddate")+100>Now() and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('δ��100����˻���������ʱֹͣ�������ף�������ɺ��Զ����ţ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM sgxt where username = '"&username&"'"
rs_my.open sql_my,conn7,2,3
if not rs_my.eof then
if rs_my("mqfh")>0 and rs_my("mqfh")<rs_my("zfh") and rs_my("new")>0 and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('��Ϸ����δ��ɣ�������ʱֹͣ�������ף�������ɺ��Զ����ţ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
%>
<%
sql_nd="select * from sgxt where username = '"&username&"' and DateDiff('d',date(),bddate)=0 " 
Set rs_nd= Server.CreateObject("ADODB.Recordset") 
rs_nd.open sql_nd,conn7,1,1
if not rs_nd.eof then
   response.write "<script language='javascript'>"
   response.write "alert('���ڿ�����ڶ����ٽ�������������лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
%>
<html>
<head>
<title></title>
</head>
</SCRIPT>
<script>
</script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript">
 function checkdate()  {  
  if (Form.jygj.value=="") {      alert("��������Ҫ�����ĵ���!");  Form.jygj.focus();    return false;    } 
  if (Form.jygj.value<0.77) {      alert("�������۲���С�� 0.77 !");  Form.jygj.focus();    return false;    }
  if (Form.jygj.value><%=rs1("jygj")%>) {      alert("�������۲��ܴ��� 0<%=rs1("jygj")%> Ŷ!");  Form.jygj.focus();    return false;    } 
    if (!chkinteger1(Form.jygj.value)){
	alert('��������ֻ��Ϊ����!');
	document.Form.jygj.focus;
	return (false);
 }
function chkinteger1(checkStr1)
{
var re=/^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
return re.test(checkStr1)
}
  if (Form.txpay.value=="") {      alert("��������Ҫ����������!");  Form.txpay.focus();    return false;    } 
  if (Form.txpay.value==0) {      alert("������������Ϊ��!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('��������ֻ��Ϊ����!');
	document.Form.txpay.focus;
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
  if (Form.txpay.value<10) {      alert("������������С��10����!");      return false;    }
  if (Form.txpay.value>1000) {      alert("���������������ܴ���1000����!");      return false;    }
  if (Form.txpay.value><%=rs("jyg")%>) {      alert("��������������ܴ�����ʣ������� <%=rs("jyg")%> Ŷ!");      return false;    } 
  if (Form.pa3.value=="") {      alert("�����������������!");   Form.pa3.focus();   return false;    } 
  if (hex_md5(Form.pa3.value) != "<%=md5(rs("password3"))%>")  {      alert("�������벻��ȷ!");  Form.pa3.focus();    return false;    }
  return true;  }  
 </script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b><p><font color="#008000" face="����" style="font-size: 30pt">�� �� �� �� �� ��</font><font color="#FF0000" face="����" style="font-size: 30pt">(����)</font></p>
			<table border="0" width="75%" id="table1" height="32" bgcolor="#FFEEEE">
			<tr>
			<td>����ǰ�Ļ���ʣ�ࣺ<font color="#008000"><b><%=rs("jyg")%> </b></font>��ǰ�Ľ��׼�Ϊ��<b><font color="#FF0000"><%if rs1("jygj")<1 then%>0<%=rs1("jygj")%><%else%><%=rs1("jygj")%><%end if%></font></b></td>
			</tr>
			</table>
			<table width="75%" border="1" cellpadding="0" class="border" bgcolor="#800080">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="932"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="mcsl2.asp">
      <div align="center">
      <TABLE width="888" border=0 height="128" cellpadding="2" bgcolor="#FFFFFF">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="4" align="right" rowspan="4">
		<p align="center">��</TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="28"><font style="font-size: 11pt; font-weight:700">�û�����</font></TD>
      <TD width="527" bgColor=#ffffff height="28"><font color="#FF0000"><b><%=username%></b></font></TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="30">
		<span style="font-size: 10pt">д���������ۣ�</span></TD>
      <TD width="527" bgColor=#ffffff height="30">
		<!--webbot bot="Validation" s-display-name="ֻ��д����" s-data-type="Number" s-number-separators=",." i-maximum-length="4" --><input type="text" name="jygj" size="10" maxlength="4"><b><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="30"><font style="font-size: 10pt">����������</font></TD>
      <TD width="527" bgColor=#ffffff height="30"><font size="3"> <span style="font-size: 11pt"><INPUT name="txpay" size=20 ></span></font><font style="font-size: 9pt" color="#FF0000"> ** ������Ϊ��</font><font style="font-size: 9pt" color="#008000"><%=rs("jyg")%></font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=2 align=middle bgColor=#ffffff width="347" height="29"><b><p align="right"><font style="font-size: 10pt">�������룺</font></TD>
		<TD align=middle bgColor=#ffffff width="527" height="29"><p align="left"><input type="password" name="pa3" size="20"><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="880" height="29">
		<p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="ȷ �� �� ��" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		<p style="margin-top: 0; margin-bottom: 0"><b><font size="2" color="#0000FF">��ʾ����д�������ĵ��۹��ߣ���ҿ��ܻ᲻���ܣ����׵��³��۲��ɹ��������ط�����</font></b></div>
</form>
    </td>
    </tr>
  </table>
	<p style="margin-top: 0; margin-bottom: 0">��</p>
	<p style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" align="center" border="0" frameborder="0" src="sggpjy.asp" scrolling="no"></iframe></p>
    <p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
	<p align="center"></p>
	<p style="margin-top: 0; margin-bottom: 0">��</div>
</body>
</html>