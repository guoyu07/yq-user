<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<head>
</head>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where id =2 "
rs.open sql,conn2,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.cf.value=="") {      alert("��������Ҫ��ֵ�����!");      return false;    } 
  if (Form.cf.value==0) {      alert("�����������Ϊ��!");      return false;    }
  if (!chkinteger(Form.cf.value)){
	alert('�������ֻ��Ϊ����!');
	document.Form.cf.focus;
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
<div align="center">
	<form method="POST" name="form" action="diyok.asp">
		<p>��</p>
		<table border="1" width="50%" id="table1" style="border-collapse: collapse" height="110">
			<tr>
				<td width="285" align="right">�̶��ɼۣ�</td>
				<td align="left"><input type="text" name="dqgj" size="15" value="<%=rs("dqgj")%>"></td>
			</tr>
			<tr>
				<td width="285" align="right">���׹ɼۣ�</td>
				<td align="left"><input type="text" name="jygj" size="15" value="<%=rs("jygj")%>"></td>
			</tr>
			<tr>
				<td width="285" align="right">����������</td>
				<td align="left"><input type="text" name="fsjygsl" size="15" value="<%=rs("fsjygsl")%>"></td>
			</tr>
		</table>
		<p><input type="submit" value="�ύ" name="B1"></p>
		<hr color="#FF00FF" size="3">
	</form>
	<p>��<p>��<p>��</div>
<form method="POST" name="form2" action="cfok.asp">
	<p align="center">���Ϊ��<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="5" --><input type="text" name="cf" size="10" maxlength="5">
	<input type="submit" value="�ύ" name="B2"></p>
</form>
