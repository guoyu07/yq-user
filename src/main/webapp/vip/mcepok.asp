<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
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
   jybh=request("ep")
   mcpa2j=request("wmcpa2j")
   mccode=request("mcygcode")
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
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
'else
   'rs("vipsq")=getcode(6)
   'rs.update
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from txpay where payid ="&jybh&""
rs_mc.open sql_mc,conn1,2,3
if rs_mc("payusername")<>username then
   response.write "<script language='javascript'>"
   response.write "alert('�������������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs_mc("ep")=0 or rs_mc("zftime")<>"" then
   response.write "<script language='javascript'>"
   response.write "alert('��������ɣ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if   
%>
<%
if usernaem="'or'='or'" then
  Response.Write "<script language=JavaScript>{window.alert('�Ƿ�����!');window.history.go(-1);}</script>"
end if
if instr(1,username,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,username,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,usernaem,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���*!');window.history.go(-1);}</script>"
end if
if instr(1,usernaem,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���$!');window.history.go(-1);}</script>"
end if

if password="'or'='or'" then
  Response.Write "<script language=JavaScript>{window.alert('�Ƿ�����!');window.history.go(-1);}</script>"
end if
if instr(1,password,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,password,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,password,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���*!');window.history.go(-1);}</script>"
end if
if instr(1,password,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���$!');window.history.go(-1);}</script>"
end if

if mcpa2j="'or'='or'" then
  Response.Write "<script language=JavaScript>{window.alert('�Ƿ�����!');window.history.go(-1);}</script>"
end if
if instr(1,mcpa2j,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,mcpa2j,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,mcpa2j,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���*!');window.history.go(-1);}</script>"
end if
if instr(1,mcpa2j,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���$!');window.history.go(-1);}</script>"
end if

if mccode="'or'='or'" then
  Response.Write "<script language=JavaScript>{window.alert('�Ƿ�����!');window.history.go(-1);}</script>"
end if
if instr(1,mccode,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,mccode,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,mccode,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���*!');window.history.go(-1);}</script>"
end if
if instr(1,mccode,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('���ð���$!');window.history.go(-1);}</script>"
end if
%>
<%
if mcpa2j<>"" and jybh<>"" then
if rs("password3")<>mcpa2j then
   response.write "<script language='javascript'>"
   response.write "alert('������������������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("ganew")<>0 and rs("vipsq")<>mccode then
   response.write "<script language='javascript'>"
   response.write "alert('�ֻ���֤������������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_mc("ep")=0
   rs_mc("rgdate")=now()
   rs_mc("payonoff")="�Ѿ�ת��"
   rs_mc("zftime")=now()
   rs_mc("clip")=Request.ServerVariables("REMOTE_ADDR")
   rs_mc.update
   rs("payok")=0
   'rs("txdate")=abcd
   rs.Update
dim sql_df
dim rs_df
set rs_df=server.createobject("adodb.recordset")
sql_df="select * from gcuser where username = '" &rs_mc("dfuser")& "' "
rs_df.open sql_df,conn2,2,3
rs_df("pay")=rs_df("pay")+rs_mc("paynum")
rs_df("jyg")=rs_df("jyg")+rs_mc("kjygid")
rs_df("cbpay")=rs_df("cbpay")+rs_mc("paynum")
rs_df("rgpay")=rs_df("rgpay")+rs_mc("paynum")
rs_df.update
dim sql0
dim rs0
set rs0=server.createobject("adodb.recordset")
sql0="select * from datepay where id = " &rs_mc("qlid")& " "
rs0.open sql0,conn9,2,3
if not rs0.eof then
rs0("regid")=rs0("regid")&"-"&rs_mc("dfuser")&"-"&now()
rs0("txbz")=0
rs0.update
end if
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,1,3
rs_d1.addnew
rs_d1("username")=rs_mc("dfuser")
rs_d1("mysl")=rs_mc("kjygid")
rs_d1("sysl")=rs_df("jyg")
rs_d1("bz")="�ⶳ-�Ϲ�һ��-"&rs_mc("paynum")&"���Ž�-"&rs_mc("payusername")&""
rs_d1("cgdate")=Now()
rs_d1("jy")=1
rs_d1("dfuser")="ϵͳ"
rs_d1.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,1,3
rs_d2.addnew
rs_d2("username")=rs_mc("dfuser")
rs_d2("regid")="�Ϲ�һ��-"&rs_mc("payusername")&"-"&rs_mc("paynum")&""
rs_d2("syjz")=rs_mc("paynum")
rs_d2("pay")=rs_df("pay")
rs_d2("jydb")=rs_df("jydb")
rs_d2("newbz")=2
rs_d2.update
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where name='"&rs("name")&"' and userid='"&rs("userid")&"' order by id asc"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
rsTest("payok")=0
'rsTest("txdate")=abcd
rsTest.MoveNext
Wend
rsTest.UpdateBatch
response.Write "<script language=javascript>alert('�ñʽ���Բ���ɹ���');location.replace('epmcjl.asp');</script>"
end if
end if
%>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
function checkdate()  {
  if (Form.wmcpa2j.value=="") {      alert("���������Ķ�������!");  Form.wmcpa2j.focus();      return false;    }
  if (hex_md5(Form.wmcpa2j.value) != "<%=md5(rs("password3"))%>")  {      alert("�������벻��ȷ!");  Form.wmcpa2j.focus();    return false;    }
  	
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
  if (Form.mcygcode.value=="") {   alert("���ȵ����ȡ��֤�룬Ȼ�������������ֻ��յ�����֤��");  Form.mcygcode.focus();   return false;    }
  return true;
} 
</script>
<body topmargin="0">
<form method="POST" action="mcepok.asp" id="Form" name="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p>��</p>
	<p><b><font color="#FF0000">�����ڲ���ȷ���տ��ȷ���Ƿ��յ���ؿ��</font></b></p>
	<table border="0" id="table1" height="316" width="666">
		<tr>
			<td width="253" align="right">�û�����</td>
			<td width="403" align="left" colspan="2"><%=rs_mc("payusername")%><input type="hidden" name="user" size="10" value="<%=rs_mc("payusername")%>" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right">������</td>
			<td width="403" align="left" colspan="2"><%=rs_mc("payname")%><input type="hidden" name="remark" size="8" value="5" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right">�տ����У�</td>
			<td width="403" align="left" colspan="2"><%=rs_mc("paybank")%></td>
		</tr>
		<tr>
			<td width="253" align="right">�տ��˺ţ�</td>
			<td width="403" align="left" colspan="2"><%=rs_mc("paycard")%></td>
		</tr>
		<tr>
			<td width="253" align="right">ʵ�ս�</td>
			<td width="403" align="left" colspan="2"><%=rs_mc("paynum")*0.9%><input type="hidden" name="ep" size="10" value="<%=jybh%>" readonly></td>
		</tr>
		<tr>
			<td width="253" align="right">�������룺</td>
			<td width="403" align="left" colspan="2"><input type="password" name="wmcpa2j" size="20"></td>
		</tr>
		<tr>
			<td width="253" align="right" height="24">��ϵ�ֻ���</td>
			<td width="403" align="left" colspan="2" height="24"><%=left(rs("call"),3)%>*****<%=right(rs("call"),3)%></td>
		</tr>
		<tr>
			<td width="253" align="right" height="44">�ֻ���֤�룺</td>
			<td width="78" align="right" height="44"><p align="left"><input type="text" name="mcygcode" size="10"></td>
			<td width="321" align="right" height="44"><p align="left"><input id="btn" type="button" onclick="checkdate()" value="��ȡ��֤��" name="B2"></td>
		</tr>
		<tr>
			<td width="253" align="right" height="46"><p align="center">��</td>
			<td width="403" align="right" height="46" colspan="2"><span style="font-size: 9pt"><font size="1"><input type="submit" value="ȷ���յ���" name="B1" style="font-family: ����_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	</div>
</form>