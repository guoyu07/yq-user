<!--#include file="../ct0618.asp"-->
<!--#include file="cfvip.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
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
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
zdjyg01=rs("jydb")/rs1("jygj")
zdjyg=int(zdjyg01*1+0.1)/1
%>
<html>
<head>
<title></title>
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.txpay.value=="") {      alert("��������Ҫ����Ļ�������!");  Form.txpay.focus();     return false;    } 
  if (Form.txpay.value==0) {      alert("������������Ϊ��!");      return false;    }
  if (Form.txpay.value<1) {      alert("������������Ϊ1������");      return false;    }
  if (Form.txpay.value>2000) {      alert("Ŀǰ���ÿ����������Ϊ2000���ɹ���ɼ�����������");      return false;    }
  if (Form.txpay.value><%=zdjyg%>) {      alert("�����������Ϊ<%=zdjyg%>");      return false;    }
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
  if (Form.pa3.value=="") {      alert("�����������������!");  Form.pa3.focus();    return false;    } 
  if (hex_md5(Form.pa3.value) != "<%=md5(rs("password3"))%>")  {      alert("�������벻��ȷ!");      return false;    }
return true;  }  
</script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b><p><font color="#FF0000" face="����" style="font-size: 30pt">�� �� �� �� �� ��</font><font color="#008000" face="����" style="font-size: 30pt">(��)</font></p>
        <table border="0" width="60%" id="table1" height="32" bgcolor="#FFEEEE">
        <tr>
		<td>����ǰ�Ľ��ʣ�ࣺ<font color="#008000"><b><%=rs("jydb")%> </b></font>��ǰ�Ľ��׼�Ϊ��<b><font color="#FF0000"><%if rs1("jygj")<1 then%>0<%=rs1("jygj")%><%else%><%=rs1("jygj")%><%end if%>&nbsp; </font></b></td>
		</tr>
		</table>
<table width="60%" border="0" cellpadding="0" class="border" bgcolor="#800080">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="683"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="mysl2.asp">
      <div align="center"><TABLE width="94%" border=0 height="115" cellpadding="2" bgcolor="#FFFFFF">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="4" align="right" rowspan="3"><p align="center">��</TD>
    </TR>
    <TR class=content> 
      <TD width="214" bgColor=#ffffff align="right" height="27"><font style="font-size: 11pt; font-weight:700">�û�����</font></TD>
      <TD width="395" bgColor=#ffffff height="27"><font color="#FF0000"><b><%=username%></b></font></TD>
    </TR>
    <TR class=content> 
      <TD width="214" bgColor=#ffffff align="right" height="32"><font style="font-size: 10pt">����������</font></TD>
      <TD width="395" bgColor=#ffffff height="32"><font size="3"> <span style="font-size: 11pt"><INPUT name="txpay" size=15></span></font><font color="#FF0000"><span style="font-size: 9pt"></span></font><font style="font-size: 9pt" color="#FF0000">** ��������</font><font style="font-size: 9pt" color="#008000"><%=zdjyg%></font><font style="font-size: 9pt" color="#FF0000">������<input type="hidden" name="gj" size="5" value="<%=rs1("jygj")%>"></font></TD>
    </TR>
    <tr><b>
		<TD colSpan=2 align=middle bgColor=#ffffff width="233" height="29"><b><p align="right"><font style="font-size: 10pt">�������룺</font></TD>
		<TD align=middle bgColor=#ffffff width="395" height="29"><p align="left"><input type="password" name="pa3" size="20"><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </tr>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="623" height="37"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="ȷ �� �� ��" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
<p style="margin-top: 0; margin-bottom: 0">��</p>
<p style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" align="center" border="0" frameborder="0" src="sgqg.asp" scrolling="no"></iframe></p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">������һҳ</font></a></p>
<p style="margin-top: 0; margin-bottom: 0">��</div>
</body>
</html>