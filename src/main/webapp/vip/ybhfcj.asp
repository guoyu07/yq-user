<!--#include file="../ct0618.asp"-->
<!--#include file="cfvip.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('���ȵ�¼��');"
   response.write "location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=12"
rs2.open sql2,conn2,1,1
if rs2("payadd")<1 then
   response.write "<script language='javascript'>"
   'response.write "alert('���ã���������ʱά������');"
   response.write "alert('���ã���������������꣬�����������ԣ�лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���ȵ�¼��');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
elseif rs("hfcjdate")>date() then
   response.write "<script language='javascript'>"
   response.write "alert('���ã������ڼ�ͬһ������֤����30���ڽ��ṩһ�γ�ֵ������"&rs("hfcjdate")-date()&"���������лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("pay")+0<100 or rs("pay")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�һ�Ҳ���100����ʱ���ܳ�ֵ��лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
if request("pa3")<>"" and request("hfcode")<>"" then
if rs("password3")<>request("pa3") then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�������Ķ������벻��ȷ�����������룡');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("vipsq")<>request("hfcode") then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���������ֻ���֤�벻��ȷ�����������룡');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   response.redirect"http://fuwu.zgyce.com/tel.aspx?call="&request("ggcall2")&"&user="&request("user")&"&code="&md5(request("hfcode"))&""
end if
end if
%>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript">
 function checkdate()  {
  if (Form.ggcall.value=="") {      alert("�����������ֻ�����!");  Form.ggcall.focus();      return false;    }
  if (Form.ggcall2.value=="") {      alert("���ٴ����������ֻ�����!");  Form.ggcall2.focus();      return false;    }
  if (Form.ggcall.value.length<11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall.focus();     return false;    }
  if (Form.ggcall.value.length>11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall.focus();     return false;    }
  if (Form.ggcall2.value.length<11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall2.focus();     return false;    }
  if (Form.ggcall2.value.length>11) {      alert("�ֻ���������Ϊ11λ��!"); Form.ggcall2.focus();     return false;    }
  if (Form.ggcall.value != Form.ggcall2.value) {      alert("����������ֻ����벻ͬ,����������!"); Form.ggcall.focus();    return false;    }
  if (Form.pa3.value=="") {      alert("�����������������!");    Form.pa3.focus();  return false;    }
  if (hex_md5(Form.pa3.value) != "<%=md5(rs("password3"))%>")  {      alert("�������벻��ȷ!");  Form.pa3.focus();    return false;    }
  
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("sms.asp", data, function(data) {
		$("#btn").removeAttr("disabled");
		if (data != "success") { alert("�ֻ���֤�뷢��ʧ��"); return false; }
		alert("�ֻ���֤�뷢�ͳɹ�");
	});
	return false;
}
  
  function checkdate1()  {  
  if (Form.hfcode.value=="") {   alert("���ȵ����ȡ��֤�룬Ȼ�������������ֻ��յ�����֤��");  Form.hfcode.focus();   return false;    }
  return true;
} 
</script>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="ybhfcj.asp"  name="Form" id="Form" onSubmit="return checkdate1()">
<input type="hidden" name="targetdate" size="8">
<input type="hidden" name="xmlmode" size="8">
<input type="hidden" name="remark" size="5" value="10" readonly>
	<div align="center">
	��<p>��</p>
	<p>��</p>
	<table border="0" id="table1" height="303" width="620">
		<tr>
			<td width="210" align="right">�û�����</td>
			<td width="400" align="left"><b><font color="#0000FF"><%=username%></font></b><input type="hidden" name="user" size="10" value="<%=username%>" readonly></td>
			</tr>
		<tr>
			<td width="210" align="right">Ҫ��ֵ���ֻ����룺</td>
			<td width="400" align="left"><input type="text" name="ggcall" size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')"></td>
			</tr>
		<tr>
			<td width="210" align="right">ȷ�ϳ�ֵ���ֻ����룺</td>
		<td width="400" align="left"><input type="text" name="ggcall2" size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')"></td>
			</tr>
		<tr>
			<td width="210" align="right">��ֵ��</td>
			<td width="400" align="left">100</td>
		</tr>
		<tr>
			<td width="210" align="right">�����(10%)��</td>
			<td width="400" align="left">10</td>
		</tr>
		<tr>
			<td width="210" align="right">�ϼ�һ�ң�</td>
			<td width="400" align="left"><b><font color="#FF0000">110</font></b></td>
		</tr>
		<tr>
			<td width="210" align="right">�������룺</td>
			<td width="400" align="left"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right">�ֻ���֤�룺</td>
			<td width="333" align="left"><input name="hfcode" size="10"><input id="btn" type="button" onclick="checkdate()" value="��ȡ��֤��" name="B2"></td>
		</tr>
		<tr>
			<td width="210" align="right" height="43"><p align="center">��</td>
			<td width="400" align="right" height="43"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="ȷ����ֵ" name="B1" style="font-family: ����_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	</div>
</form>