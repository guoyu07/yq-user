<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
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
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.zhgc.value=="") {      alert("��д��Ҫת��������!");      return false;    } 
  if (Form.zhgc.value==0) {      alert("ת������������Ϊ0!");      return false;    } 
  if (Form.zhgc.value><%=rs("gdgc")%>) {      alert("ת���ֺ���������ܴ��� <%=rs("gdgc")%> Ŷ!");      return false;    }
  if (!chkinteger(Form.zhgc.value)){
	alert('ת������ֻ��Ϊ����!');
	document.Form.zhgc.focus;
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
  if (Form.gcpa.value=="") {      alert("�����������������!");      return false;    } 
  if (Form.gcpa.value!=="<%=rs("password3")%>") {      alert("�������벻��ȷ!");      return false;    }
  return true;  }
</script>
<body topmargin="0">
	<form method="POST" action="gdgctosfgok.asp" name="Form" onSubmit="return checkdate()" target="main">
		<p><font style="font-size: 11pt">����ǰʣ��ֺ�㣺<font color="#FF0000"><%=rs("gdgc")%></font> ����Ҫת��<input type="text" name="zhgc" size="10">���ֺ�� �������룺</font><b><span style="font-size: 11pt"><font size="4"><input name="gcpa" size="20" type="password"></font></span><font size="2">
		</font><span style="font-size: 11pt"><font size="4"> <input type="submit" value="�ύ" name="B1"></font></span></b></p>
	</form>