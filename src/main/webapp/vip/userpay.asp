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
Function getCode(iCount)
     Dim arrChar
     Dim j,k,strCode
     arrChar = "01235678abcde"
     k=Len(arrChar)
     Randomize
     For i=1 to iCount
          j=Int(k * Rnd )+1
          strCode = strCode & Mid(arrChar,j,1)
     Next
     getCode = strCode
End Function
%>
<%
Set rs= Server.CreateObject("ADODB.Recordset") 
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("vip")>0 then
   response.write "<script language='javascript'>"
   response.write "alert('VIP��Ҳ��ṩһ���������ܣ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("vipsq")=getcode(6)
   rs.update
   'response.redirect "login3j.asp?ts=ƽ̨ϵͳ���ں���ͳ�����ݣ���ʱ�����𲽻ָ�һ���������ܣ���л��ҵĹ�ע�����£�"
end if
%>
<%
if rs("payok")=1 then
   response.write "<script language='javascript'>"
   'response.write "alert('���ã���ͬһ�����˺Ż�ͬһ���֤�����˺��ѷ����ɹ�����\n\n�����ĵȴ�������ɺ����<"&int(rs("txdate")-Now()*1+0.1)/1&"��>�����Է����ڶ��ʣ�\n\n����Ϲ����������������ȷ���տ��ٷ����ڶ��ʣ�лл��');"   
   response.write "alert('���ã���ͬһ�����˺Ż�ͬһ���֤�����˺��ѷ����ɹ����������ĵȴ�������ɺ��ٷ����ڶ��ʣ�����Ϲ����������������ȷ���տ��ٷ����ڶ��ʣ�лл��');"
   response.write "location.replace('epmcjl.asp');"
   response.write "</script>"
   response.end
end if
%>
<html>
<head>
<title></title>
</head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.txpay.value==0) {      alert("��ѡ������һ�ҵ�����!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('����һ��ֻ��Ϊ����!');
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
  if (Form.txpay.value><%=rs("pay")%>) {      alert("���ķ������ܴ����������� <%=rs("pay")-rs("vippay")%> һ��Ŷ!");      return false;    }
  if (Form.txpay.value<100) {      alert("���ķ�������С��100һ��!");      return false;    } 
  if (Form.pa3.value=="") {      alert("�����������������!");      return false;    } 
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
  if (Form.ybcodeid.value=="") {   alert("���ȵ����ȡ��֤�룬Ȼ�������������ֻ��յ�����֤��");  Form.ybcodeid.focus();   return false;    }
  return true;
}
</script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0"><div align="center"><b>
     <p></p>
     <p></p>
	 <p><font color="#008000" face="����" style="font-size: 30pt">����һ������(����)</font></p>
	<table border="0" width="75%" id="table1" height="58" bgcolor="#FFEEEE">
	 <tr>
	 <td><b>�𾴵����<font color="#FF0000"><%=rs("name")%></font>���ã������뷢�����Ϲ�һ��-�������µ���2Сʱ�ڴ������տ��˺��ϣ�</td>
	 </tr>
	 <tr>
	 <td>����ǰ����һ��Ϊ��<b><font color="#008000"><%if rs("pay")<1 then%>0<%=rs("pay")-rs("vippay")%><%else%><%=rs("pay")-rs("vippay")%><%end if%></font></b> һ��</td>
	 </tr>
	 </table>
	 <table width="75%" border="0" cellpadding="0" class="border" bgcolor="#800080">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="935">
    <form method="POST" align="center" name="Form" id="Form" onSubmit="return checkdate1()" action="tgtxok.asp">
    <input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
    <div align="center"><TABLE width="100%" border=0 height="352" cellpadding="2" bgcolor="#FFFFFF">
    <TBODY>
    <TR class=content><TD bgColor=#ffffff width="27" align="right" rowspan="11"><p align="center">��</TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="30"><font style="font-size: 11pt; font-weight:700">�û�����</font></TD>
    <TD width="571" bgColor=#ffffff height="30"><font color="#FF0000"><b><%=username%></b></font><input type="hidden" name="user" size="10" value="<%=username%>" readonly></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="33"><font style="font-size: 10pt">����һ��������</font></TD>
      <TD width="571" bgColor=#ffffff height="33"><font style="font-size: 9pt" color="#FF0000">
		<select size="1" name="txpay">
		<option selected value="0">=ѡ����������=</option>
		<option value="100">100</option>
		<option value="200">200</option>
		<option value="500">500</option>
		<option value="1000">1000</option>
		<option value="2000">2000</option>		
		</select> **</font><font style="font-size: 9pt">��ǰ����һ��Ϊ��</font><font style="font-size: 9pt; " color="#FF0000"><%if rs("pay")<1 then%>0<%=rs("pay")-rs("vippay")%><%else%><%=rs("pay")-rs("vippay")%><%end if%></font></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="28"><b>
     	<font style="font-size: 10pt; ">�������룺</font></TD>
      <TD width="571" bgColor=#ffffff height="28"><b>
     	<font size="3"> <span style="font-size: 11pt"><INPUT name="pa3" size=15 type=password></span></font><font style="font-size: 9pt" color="#FF0000"> **</font><span style="font-size: 10pt"><input type="hidden" name="remark" size="8" value="4" readonly></span></TD>
    </TR><%if rs("ganew")<>0 then%>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="39"><b>
     	<font style="font-size: 10pt; ">�ֻ���֤�룺</font></TD>
      <TD width="571" bgColor=#ffffff height="39"><input type="text" name="ybcodeid" size="15"><b><font style="font-size: 9pt" color="#FF0000"> **</font><input id="btn" type="button" onclick="checkdate()" value="��ȡ��֤��" name="B2"></b></TD>
    </TR><%end if%>
    <TR class=content> 
		<TD width="897" bgColor=#ffffff align="right" height="30" colspan="2"><p align="left"><font size="2" color="#0000FF"><b>���棺</b></font><font color="#FF0000" size="2">������˶������տ���Ϣ�����д��������ϵ�<a href="userup.asp" style="text-decoration: none">�޸ĸ�������</a>���ٽ��з����������粻����˶ԣ���ɸ���ɹ����ñ����������ᣬ����ⶳ������20%�����ѣ�</font></TD>
    </TR>
    <TR class=content> 
		<TD width="317" bgColor=#ffffff align="right" height="29"><span style="font-size: 10pt">��ʵ������</span></TD>
		<TD width="571" bgColor=#ffffff height="29"><font color="#800080"><%=rs("name")%></font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="33"><b><span style="font-size: 10pt">�ֻ����룺</span></TD>
		<TD width="571" bgColor=#ffffff height="33"><b><font color="#800080"><%=left(rs("call"),3)%>*****<%=right(rs("call"),3)%></font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="25"><span style="font-size: 10pt">�տʽ��</span></TD>
		<TD width="571" bgColor=#ffffff height="25"><font color="#800080"><%=rs("bank")%></font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="27"><span style="font-size: 10pt">�˺ţ�</span></TD>
		<TD width="571" bgColor=#ffffff height="27"><b><font color="#800080"><%=rs("card")%></font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="24"><font size="2">�����У�</font></TD>
		<TD width="571" bgColor=#ffffff height="24"><font size="2"><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%>֧��</font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="931" height="29"><p style="margin-top: 0; margin-bottom: 0"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="�� �� �� ��" name=submit2 style="font-size: 11pt" onClick="return confirm('��ʾ������������һ�������500����500������������Ϊ15%������500����Ϊ10%����ȷ������')"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
  <p style="margin-top: 0; margin-bottom: 0">��</p>
  <table border="1" width="75%" id="table2" style="border-collapse: collapse" bgcolor="#E6FFFF">
  <tr>
  <td><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt" color="#FF0000">��������˵����</font></p><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt">һ�����100һ����Ϳ��Է���������ÿ�η��������һ�δ�����ȷ���յ���˲ſ��Է���ڶ��Σ������ɹ��������Ϲ�һ��-�������µ���2Сʱ�ڴ������տ��˺��ϣ�</font></p>
  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt" color="#800080">����</font><font size="2" color="#800080">һ����������500����500��������������Ϊ��15%������500��Ϊ10%��</font></p>
	</td>
	</tr>
	</table>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="5" color="#FF0000" face="����_GB2312">һ��-��ƽ��׹���</font></p>
		<font size="3">
			  <table border="0" width="90%" id="table3">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						һ���Ϲ��������������<br>
						1��������2Сʱ��û�гɹ����������ָ�������˺ţ�ϵͳ��û���ݿ������ĳ��Ž𣬽�����������ƣ��������û�����ɴ˽��ס�<br>
						2����û�гɹ����������ָ�������˺ţ���ǰ��������������Ӱ�������������̣�ϵͳ��û���ݿ������ĳ��Ž𣬽�����������ƣ��������û�����ɴ˽��ס�<br>
						�����������������տ�����ַ�������<br>
						1������������ɹ����տʵ���յ���Ӧ��������ڡ�48Сʱ���ڵ�¼ƽ̨�㡰һ��-��ơ��¡�һ��-������ϸ���鿴�ñʽ���״̬�����С������յ�����-֪ͨϵͳ���Ϲ���������Ӧ��һ��-���Ĳ�����<br>
						2���������������֣�ǰ����ȷ���Լ����տ��˺�������ʹ�ã��������տ��˺Ŵ��������ԭ���������տӰ�츶���������ʱ�䣬��������ͷ�������ߣ��ñʽ��׽�緷���<br>
						3��Ϊ�˽��׹�ƽ����������˫����һ����Լ����ϵͳ�������Ƿ�����ÿ���û���ʼΪ��5�ǡ���ÿΥ��һ�ν��׹���۳���1�ǡ�����ʣ�¡�3�ǡ����������Ʒ������Ϲ�һ���ڣ���ʣ�¡�2�ǡ����������Ʒ������Ϲ������ڣ��������ڽ����ܻ��ƽ�⽱�𣬵�ʣ�¡�1�ǡ����������Ʒ������Ϲ������ڣ��������ڽ����ܻ��ƽ�⽱����쵼���𣬵�ʣ�¡�0�ǡ����������Ʒ������Ϲ�60�죬60���ڽ����ܻ��ƽ�⽱����쵼��������ǰΪ��<b><font color="#FF0000">��<%=rs("cxt")%>�ǡ�</font></b>��</td>
					</tr>
				</table>
	<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">��</font></div>
</body>
</html>