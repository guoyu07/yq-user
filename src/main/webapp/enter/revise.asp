<!--#include file="../ct0618.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<!--#include file="../th.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
   bmuser=request("user")
   gpa2j1=LCase(request("newpa2j1"))
   ypa2j=request("ypa2j")
   ceiduser=request("ceid")
   mycode=request("newcode")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from enter where user ='"&bmuser&"'"
rs.open sql,connth,1,3
If rs.eof or rs.bof Then
   response.write "<script language='javascript'>"
   response.write "alert('���ȱ�����');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2="select * from gcuser where username ='"&bmuser&"'"
rs2.open sql2,conn2,1,1
if rs2.eof and rs2.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���ã������û��������ڻ��������������룬лл��');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
end if
%>
<%
if request("user")<>"" and ypa2j<>"" and mycode<>"" then
if rs2("password3")<>ypa2j then
   response.write "<script language='javascript'>"
   response.write "alert('������Ķ��������������ǼǵĲ���������������룡');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs2("userid")<>ceiduser then
   response.write "<script language='javascript'>"
   response.write "alert('����������֤�����������ǼǵĲ������');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs2("vipsq")<>mycode then
   response.write "<script language='javascript'>"
   response.write "alert('��������ֻ���֤�벻��ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   rs("dicadd")=request("dicadd")
   rs("huzhao")=request("huzhao")
   rs("dictgc")=request("dictgc")
   rs("dictnumber")=request("dictnumber")
   rs("qucheng")=request("qucheng")
   rs("hucheng")=request("hucheng")
   rs.update
Response.Write "<script language=""JavaScript"">alert('���ϸ��³ɹ�����ȴ��ڶ�����ˣ�');location.replace('revise.asp?user="&rs("user")&"');</script>"
Response.End   
end if
end if
%>
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

  if (Form.dicadd.value==0) {      alert("��ѡ��������Ʊ�ĳ�����������δ��Ʊ�벻Ҫѡ��");  Form.dicadd.focus();      return false;    } 
  if (Form.huzhao.value=="") {      alert("���������Ļ��պ��룬��δ��Ʊ�벻Ҫ��д��");  Form.huzhao.focus();      return false;    } 
  if (Form.dictgc.value=="") {      alert("������������Ʊ�ĺ��չ�˾����δ��Ʊ�벻Ҫ��д��");  Form.dictgc.focus();      return false;    } 
  if (Form.dictnumber.value=="") {      alert("������������Ʊ�ĺ����ţ���δ��Ʊ�벻Ҫ��д��");  Form.dictnumber.focus();      return false;    }
  if (Form.qucheng.value=="") {      alert("������������������XXʱXX�֣���δ��Ʊ�벻Ҫ��д��");  Form.qucheng.focus();      return false;    }
  if (Form.hucheng.value=="") {      alert("������������س����XXʱXX�֣���δ��Ʊ�벻Ҫ��д��");  Form.hucheng.focus();      return false;    }
  if (Form.ypa2j.value=="") {      alert("���������Ķ������룡");  Form.ypa2j.focus();      return false;    } 
  if (hex_md5(Form.ypa2j.value) != "<%=md5(rs2("password3"))%>") {      alert("������Ķ��������������ǼǵĲ������");  Form.ypa2j.focus();      return false;    }
  if (Form.gaqq.value=="") {      alert("������QQ��");Form.gaqq.focus();      return false;    }
  if (Form.gaqq.value!=="<%=rs2("qq")%>") {      alert("�������qq�������ǼǵĲ������");Form.gaqq.focus();      return false;    }
  if (Form.ceid.value=="") {      alert("�������������֤���룡");  Form.ceid.focus();      return false;    }
  if (hex_md5(Form.ceid.value) != "<%=md5(rs2("userid"))%>") {      alert("����������֤�����������ǼǵĲ������");  Form.ceid.focus();      return false;    }

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
<%if rs("audit")=0 then%>
<p>��</p>
<p align="center"><b>���ı�����Ϣ��������У��볣��¼��ע����״̬��</b></p>
<p align="center"><font color="#FF00FF">���ٴ������Ķ���<a target="_blank" href="2015Ե������-������ʾ�.doc">������ʾ�</a>�����������ͨ����ϵͳ�������ʾ�������й���Ʊ�����ӡ���ʾ�������д������ʱ����Я����</font>
<p align="center"><font color="#FF00FF">�������ͨ������Ҫ׼���������ϣ�</font><font color="#0000FF">���գ���Ʊ��</font>
<%elseif rs("audit")=2 then%>
<p align="center"><b>���ı�����Ϣ����ͨ������ϸ����ϵ�ͷ����г�����</b></p>
<%elseif rs("audit")=1 then%>
<p align="center"><font color="#FF00FF">��ϲ���ı�����ͨ���������ٴ������Ķ���<a target="_blank" href="2015Ե������-������ʾ�.doc">������ʾ�</a>���������й���Ʊ�����ӡ���ʾ�������д������ʱ����Я����</font>
<p align="center"><b>��Ʊ��̩�����ȵ��������չ��ʻ������빺��������Ʊ������ǰ�뽫��Ʊ�����г̵�����ӡ�á�</b></p>
<p align="center"><font color="#008000"><b>����ʱ�䣺2015��07��11�� ����ʱ�䣺2015��07��15��</b></font></p>
<form method="POST" action="revise.asp" name="Form" id="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="remark" size="5" value="13" readonly>
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
<div align="center">
	<table border="0" width="50%" id="table2" height="102%">
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">�û�����</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><b><font color="#FF0000" size="2"><%=rs("user")%></font></b><input type="hidden" name="user" size="15" value="<%=rs("user")%>" readonly></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">������</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=left(rs("name"),1)%>*<%=right(rs("name"),1)%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">�Ա�</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=rs("xb")%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">����������</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=rs("addsheng")%><%=rs("addshi")%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E1FFF5"><font size="2">�������쵼�ˣ�</font></td>
			<td align="left" width="65%" bgcolor="#E1FFF5"><font size="2"><%=rs("addldr")%></font></td>
		</tr>
		<tr>
			<td align="right" colspan="2" bgcolor="#E0E0E0"><p align="center"><b><font color="#FF0000">������Ϣ�ǳ���Ҫ����������������Ʊ��Ʊ����Ϣ������д��</font></b></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">����������</td>
			<td align="left" width="65%" bgcolor="#E0E0E0">
			<select size="1" name="dicadd">
			<option selected value="<%if rs("dicadd")<>"" then%><%=rs("dicadd")%><%else%>0<%end if%>"><%if rs("dicadd")<>"" then%><%=rs("dicadd")%><%else%>==����Ʊ�����ѡ��==<%end if%></option>
			<option value="������PEK���׶�����">������PEK���׶�����</option>
			<option value="���TSN����������">���TSN����������</option>
			<option value="�Ϻ���SHA���ֶ�����">�Ϻ���SHA���ֶ�����</option>
			<option value="���죨CKG����������">���죨CKG����������</option>
			<option value="�㶫ʡ���ڣ�SZX����������">�㶫ʡ���ڣ�SZX����������</option>
			<option value="�㶫ʡ���ݣ�CAN�����ƻ���">�㶫ʡ���ݣ�CAN�����ƻ���</option>
			<option value="�㶫ʡ������SWA�����ǻ���">�㶫ʡ������SWA�����ǻ���</option>
			<option value="����ʡ������KMG����ˮ����">����ʡ������KMG����ˮ����</option>
			<option value="����ʡ��ɳ��CSX���ƻ�����">����ʡ��ɳ��CSX���ƻ�����</option>
			<option value="����ʡ������NNG�����׻���">����ʡ������NNG�����׻���</option>
			<option value="����ʡ���֣�KWL����������">����ʡ���֣�KWL����������</option>
			<option value="����ʡ������XIY����������">����ʡ������XIY����������</option>
			<option value="����ʡ�人��WUH����ӻ���">����ʡ�人��WUH����ӻ���</option>
			<option value="����ʡ���ڣ�HAK����������">����ʡ���ڣ�HAK����������</option>
			<option value="����ʡ���ݣ�FOC�����ֻ���">����ʡ���ݣ�FOC�����ֻ���</option>
			<option value="�Ĵ�ʡ�ɶ���CTU��˫������">�Ĵ�ʡ�ɶ���CTU��˫������</option>
			<option value="����ʡ���ţ�XMN���������">����ʡ���ţ�XMN���������</option>
			<option value="����ʡ�Ϸʣ�HFE�����Ż���">����ʡ�Ϸʣ�HFE�����Ż���</option>
			<option value="����ʡ������DLC����ˮ�ӻ���">����ʡ������DLC����ˮ�ӻ���</option>
			<option value="����ʡ֣�ݣ�CGO����֣����">����ʡ֣�ݣ�CGO����֣����</option>
			<option value="����ʡ������KWE������������">����ʡ������KWE������������</option>
			<option value="�㽭ʡ������NGB���������">�㽭ʡ������NGB���������</option>
			<option value="����ʡ������WUX������˶�Ż���">����ʡ������WUX������˶�Ż���</option>
			<option value="ɽ��ʡ���ϣ�TNA��ңǽ����">ɽ��ʡ���ϣ�TNA��ңǽ����</option>
			<option value="�㽭ʡ���ݣ�HGH����ɽ����">�㽭ʡ���ݣ�HGH����ɽ����</option>
			<option value="��������������HRB��̫ƽ����">��������������HRB��̫ƽ����</option>
			<option value="����ʡ�ϲ���KHN����������">����ʡ�ϲ���KHN����������</option>
			<option value="����ʡ������INC���Ӷ�����">����ʡ������INC���Ӷ�����</option>
			<option value="���ɹŰ�ͷ��BAV����������">���ɹŰ�ͷ��BAV����������</option>
			<option value="ɽ��ʡ�ൺ��TAO����ͤ����">ɽ��ʡ�ൺ��TAO����ͤ����</option>
			</select></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">���պ��룺</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="text" name="huzhao" size="20" value="<%=rs("huzhao")%>" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">���չ�˾��</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="text" name="dictgc" size="20" value="<%=rs("dictgc")%>"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">�����ţ�</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="text" name="dictnumber" size="20" value="<%=rs("dictnumber")%>" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">�������ʱ�䣺</td>
			<td align="left" width="65%" bgcolor="#E0E0E0">2015��07��11��<input type="text" name="qucheng" size="5" value="<%=rs("qucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24Сʱ���磺0920</font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">�س����ʱ�䣺</td>
			<td align="left" width="65%" bgcolor="#E0E0E0">2015��07��15��<input type="text" name="hucheng" size="5" value="<%=rs("hucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24Сʱ���磺0920</font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">���״̬��</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><font color="#0000FF"><%if rs("audit2")=1 then%>��ȫͨ��(�벻Ҫ���޸Ļ�Ʊ��Ϣ)<%else%>�ȴ����󣬾�����д��Ʊ��Ϣ��<%end if%></font></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">����ע��</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><%=rs("auditbz")%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">�������룺</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><input type="password" name="ypa2j" size="20"></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">��ϵ�ֻ���</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><%=left(rs("call"),3)%>*****<%=right(rs("call"),3)%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">��ϵQQ��</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><input type="text" name="gaqq" size="20" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="12" ><%=left(rs("qq"),3)%>***<%=right(rs("qq"),3)%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">���֤���룺</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><font color="#0000FF"><input type="text" name="ceid" size="20" maxlength="19"></font><%=left(rs("userid"),6)%>******<%=right(rs("userid"),6)%></td>
		</tr>
		<tr>
			<td width="34%" align="right" bgcolor="#E0E0E0">�ֻ���֤�룺</td>
			<td width="65%" align="left" bgcolor="#E0E0E0"><input type="text" name="newcode" size="10" onKeyUp="value=value.replace(/[\W]/g,'')"> <input id="btn" type="button" onclick="checkdate()" value="��ȡ��֤��" name="B3"></td>
		</tr>
		<tr>
			<td align="right" width="34%" bgcolor="#E0E0E0">��</td>
			<td align="left" width="65%" bgcolor="#E0E0E0"><input type="submit" value="�ύ����" name="B2" onClick="return confirm('��ʾ����ȷ������')" ></td>
		</tr>
	</table>
</div>
</form>
<%end if%>