<!--#include file="../ct0618.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<!--#include file="../th.asp"-->
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
   userreg=request("user")
   gpa2j1=LCase(request("newpa2j1"))
   ypa2j=request("ypa2j")
   ceiduser=request("ceid")
   mycode=request("newcode")
dim rs2,sql2
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2="select * from gcuser where username ='"&username&"'"
rs2.open sql2,conn2,1,1
if rs2.eof and rs2.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���������û��������ڻ��������������룬лл��');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
else
dim rsb,sqlb
set rsb = Server.CreateObject("ADODB.Recordset")
sqlb="select top 1 * from gcuser where name ='"&rs2("name")&"' and userid='"&rs2("userid")&"' order by id"
rsb.open sqlb,conn2,1,1
end if
dim rs2b,sql2b
set rs2b = Server.CreateObject("ADODB.Recordset")
sql2b="select * from enter where user ='"&rsb("username")&"'"
rs2b.open sql2b,connth,1,1
if not rs2b.eof then
response.redirect "revise.asp?user="&rsb("username")&""
end if
%>
</head>
<script type="text/javascript" src="../vip/images/jquery.min.js"></script>
<script type="text/ecmascript" src="../vip/images/md5.js"></script>
<script language="JavaScript"> 
function CheckIfEnglish( str )
{  
if(/[a-z]/.test(str)&&/[0-9]/.test(str)){
return true;
}else{
return false;
}
}
function checkdate()  {

  if (Form.name.value=="") {      alert("������������");Form.name.focus();      return false;    }
  if (Form.name.value!=="<%=rsb("name")%>") {      alert("������������������ǼǵĲ������");Form.name.focus();      return false;    }
  if (Form.R1.value=="") {      alert("��ѡ���ձ�");Form.R1.focus();      return false;    }
  if (Form.dqldr.value==0) {      alert("��ѡ���쵼�ˣ�������������ϵ�Ƽ��ˣ�");Form.dqldr.focus();      return false;    }
  if (Form.ypa2j.value=="") {      alert("���������Ķ������룡");  Form.ypa2j.focus();      return false;    } 
  if (hex_md5(Form.ypa2j.value) != "<%=md5(rsb("password3"))%>") {      alert("������Ķ��������������ǼǵĲ������");  Form.ypa2j.focus();      return false;    }
  if (Form.gaqq.value=="") {      alert("������QQ��");Form.gaqq.focus();      return false;    }
  if (Form.gaqq.value!=="<%=rsb("qq")%>") {      alert("�������qq�������ǼǵĲ������");Form.gaqq.focus();      return false;    }
  if (Form.ceid.value=="") {      alert("�������������֤���룡");  Form.ceid.focus();      return false;    }
  if (hex_md5(Form.ceid.value) != "<%=md5(rsb("userid"))%>") {      alert("����������֤�����������ǼǵĲ������");  Form.ceid.focus();      return false;    }

	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("../vip/sms.asp", data, function(data) {
		$("#btn").removeAttr("disabled");
		if (data != "success") { alert("�ֻ���֤�뷢��ʧ��"); return false; }
		alert("�ֻ���֤�뷢�ͳɹ�");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.newcode.value=="") {   alert("���ȵ����ȡ��֤�룬Ȼ�������������ֻ��յ�����֤��");  Form.newcode.focus();   return false;    }
  return true;
}
</script>
<%
if userreg<>"" and ypa2j<>"" and mycode<>"" then
if rsb("password3")<>ypa2j then
   response.write "<script language='javascript'>"
   response.write "alert('������Ķ��������������ǼǵĲ���������������룡');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rsb("userid")<>ceiduser then
   response.write "<script language='javascript'>"
   response.write "alert('����������֤�����������ǼǵĲ������');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rsb("vipsq")<>mycode then
   response.write "<script language='javascript'>"
   response.write "alert('��������ֻ���֤�벻��ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
  set rs_d1 = Server.CreateObject("ADODB.Recordset")
  sql_d1 = "SELECT * FROM enter where user='"&rsb("username")&"'"
  rs_d1.open sql_d1,connth,2,3
  If rs_d1.eof or rs_d1.bof Then
  rs_d1.addnew
  rs_d1("user")=rsb("username")
  rs_d1("jb")=rsb("sjb")
  rs_d1("userup")=rsb("up")
  rs_d1("name")=rsb("name")
  rs_d1("xb")=request("r1")
  rs_d1("userid")=rsb("userid")
  rs_d1("call")=rsb("call")
  rs_d1("qq")=rsb("qq")
  rs_d1("addsheng")=rsb("addsheng")
  rs_d1("addshi")=rsb("addshi")
  rs_d1("addldr")=request("dqldr")
  rs_d1.update
  End if
Response.Write "<script language=""JavaScript"">alert('�����ɹ�����ȴ���ˣ�');location.replace('revise.asp?user="&rsb("username")&"');</script>"
Response.End  
end if
end if
%>
<body topmargin="0">
<form method="POST" action="bmuser.asp" name="Form" id="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="remark" size="5" value="13" readonly>
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p>��</p>
	<p><b><font color="#FF0000">��˶����ı�����Ϣ��</font></b></p>
	<table border="0" id="table1" height="396" width="70%">
		<tr>
			<td width="186" align="right">�û�����</td>
			<td width="433" align="left"><input type="text" name="user" size="12" value="<%=rsb("username")%>" readonly><font size="2" color="#000080">�˴���ʾ����һ���û���</font></td>
		</tr>
		<tr>
			<td width="186" align="right">������</td>
			<td width="433" align="left"><input type="text" name="name" size="20"><%=left(rsb("name"),1)%>**</td>
		</tr>
		<tr>
			<td width="186" align="right">�ձ�</td>
			<td width="433" align="left"><input type="radio" value="��" name="R1">��<input type="radio" name="R1" value="Ů">Ů</td>
		</tr>
		<tr>
			<td width="186" align="right">Ŀǰ������</td>
			<td width="433" align="left"><%=rsb("addsheng")%><%=rsb("addshi")%></td>
		</tr>
		<tr>
			<td width="186" align="right">�����쵼�ˣ�</td>
			<td width="433" align="left"><select size="1" name="dqldr">
			<option selected value="0">==��ѡ��==</option>
			<option value="���ڣ��Ĵ����ݣ�">���ڣ��Ĵ����ݣ�</option>
			<option value="���������Ĵ����ݣ�">���������Ĵ����ݣ�</option>
			<option value="�ս��ࣨ���죩">�ս��ࣨ���죩</option>
			<option value="�����٣����ϣ�">�����٣����ϣ�</option>
			<option value="�����������ϣ�">�����������ϣ�</option>
			<option value="�������ϣ�">�������ϣ�</option>
			<option value="�����������ݣ�">�����������ݣ�</option>
			<option value="�����ɣ�������">�����ɣ�������</option>
			<option value="�밮ΰ���㶫/�㽭��">�밮ΰ���㶫/�㽭��</option>
			<option value="�밮�̣��㶫/�㽭��">�밮�̣��㶫/�㽭��</option>
			<option value="��־�ɣ�������">��־�ɣ�������</option>
			<option value="�챦����������">�챦����������</option>
			<option value="�����磨�Ϻ���">�����磨�Ϻ���</option>
			<option value="�����������գ�">�����������գ�</option>
			<option value="�Ⱞ�������գ�">�Ⱞ�������գ�</option>
			<option value="��������ɽ���ൺ��������">��������ɽ���ൺ��������</option>
			<option value="����Ƽ��ɽ���ൺ�б�����">����Ƽ��ɽ���ൺ�б�����</option>
			<option value="����ģ�ɽ�����ϣ�">����ģ�ɽ�����ϣ�</option>
			<option value="��������ɽ�����ޣ�">��������ɽ�����ޣ�</option>
			<option value="�Խܣ�ɽ��˷�ݣ�">�Խܣ�ɽ��˷�ݣ�</option>
			<option value="����ϼ��ɽ����ͬ��">����ϼ��ɽ����ͬ��</option>
			<option value="��꿣�ɽ�����䣩">��꿣�ɽ�����䣩</option>
			<option value="����ڣ����ɰ�ͷ��">����ڣ�ɽ��̫ԭ��</option>
			<option value="�����㣨���ɰ�ͷ�ƺ�����">�����㣨���ɰ�ͷ�ƺ�����</option>
			<option value="��±������ɰ�ͷ/���ͺ��أ�">��±������ɰ�ͷ/���ͺ��أ�</option>
			<option value="���񻪣��ӱ���ɽ��">���񻪣��ӱ���ɽ��</option>
			<option value="����ӱ�ʯ��ׯ��">����ӱ�ʯ��ׯ��</option>
			<option value="�������ӱ�����/������">�������ӱ�����/������</option>
			<option value="���������ӱ�������">���������ӱ�������</option>
			<option value="�����磨���">�����磨���</option>
			<option value="�����Σ�������">�����Σ�������</option>
			<option value="���¿�������">���¿�������</option>
			<option value="��������������">��������������</option>
			<option value="��ϲ�����������ݣ�">��ϲ�����������ݣ�</option>
			<option value="������������«����">������������«����</option>
			<option value="ʤ����������ɽ��">ʤ����������ɽ��</option>
			<option value="���磨����������">���磨����������</option>
			<option value="��褣���������">��褣���������</option>		
			</select><b><font color="#FF0000" size="2"> **������ѡ���쵼�ˣ�����Ϊ�ο���</font></b></td>
		</tr>
		<tr>
			<td width="186" align="right">�������룺</td>
			<td width="433" align="left"><input type="password" name="ypa2j" size="20"></td>
		</tr>
		<tr>
			<td width="186" align="right">��ϵ�ֻ���</td>
			<td width="433" align="left"><%=left(rsb("call"),3)%>*****<%=right(rsb("call"),3)%></td>
		</tr>
		<tr>
			<td width="186" align="right">��ϵQQ��</td>
			<td width="433" align="left"><input type="text" name="gaqq" size="20" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="12" ><%=left(rsb("qq"),3)%>***<%=right(rsb("qq"),3)%></td>
		</tr>
		<tr>
			<td width="186" align="right">���֤���룺</td>
			<td width="433" align="left"><font color="#0000FF"><input type="text" name="ceid" size="20" maxlength="19"></font><%=left(rsb("userid"),4)%>**********<%=right(rsb("userid"),4)%></td>
		</tr>
		<tr>
			<td width="186" align="right">�ֻ���֤�룺</td>
			<td width="433" align="left"><input type="text" name="newcode" size="10" onKeyUp="value=value.replace(/[\W]/g,'')"> <input id="btn" type="button" onclick="checkdate()" value="��ȡ��֤��" name="B2"></td>
		</tr>
		<tr>
			<td width="186" align="right" height="43"><p align="center">��</td>
			<td width="433" align="right" height="43"><span style="font-size: 9pt"><font size="1"><input type="submit" value="�ύ����" name="B1" style="font-family: ����_GB2312; font-size: 12pt; font-weight: bold; float:left"></font></span></td>
		</tr>
		</table>
	<p><b><font color="#FF0000" size="6">������֪</font></b></p>
	<p><font color="#0000FF">ѡ���쵼����ѡ����ӽ������ϼ��쵼�ˣ�������ѡ��������ͨ����ˣ���������ϵ�����Ƽ���ʦ�ٱ�����</font></p>
	<p><font color="#FF00FF">δ��ʮ�����겻�òμӣ�������ʮ���겻�òμӣ���˾���鲻�ö�Ϸ������Я����������ȫ�Ҳμӣ�</font></p>
	<p><font color="#FF00FF">����ǰ���������Ķ���<a target="_blank" href="2015Ե������-������ʾ�.doc">������ʾ�</a>�����������ͨ���󷽿ɶ�Ʊ�����ӡ���ʾ�������д������ʱ����Я����</font></div>
</form>