<!--#include file="../ct0618.asp"-->
<!--#include file="../th.asp"-->
<%
cjpaa=request("cjpa")
reusera=request("reuser")
%>
<form method="POST" name="form" action="audit.asp">
<p align="center">�������룺<input type="password" name="cjpa" size="10" value="<%=cjpaa%>"> �����û�����<input type="text" name="reuser" size="15" value="<%=reusera%>"><input type="submit" value="�ύ" name="B1">
</form>
<%
set rs= Server.CreateObject("ADODB.Recordset")
sql= "SELECT * FROM enter where user='"&request("reuser")&"'and audit=1 "
rs.open sql,connth,1,3
if rs.eof or rs.bof Then
   response.write "<script language='javascript'>"
   response.write "alert('������û��������δ�����������������룡-"&request("reuser")&"');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif request("cjpa")<>"hdbm2015" then
   response.write "<script language='javascript'>"
   response.write "alert('�������벻��ȷ�����������룡aaa');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif request("act")<>"" then
if request("cjpa")<>"hdbm2015" then
   response.write "<script language='javascript'>"
   response.write "alert('�������벻��ȷ�����������룡');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif request("R1")=2 then
   rs("audit")=0
   rs("audit2")=0
   rs.update
   Response.Write "<script language=""JavaScript"">alert('����[��ͨ���������]�ɹ���');location.href='javascript:self.close()';</script>"
   Response.End
elseif request("R1")=1 then
   rs("audit2")=1
   rs("addldr")=request("adqldr")
   rs("dicadd")=request("dicadd")
   rs("huzhao")=request("huzhao")
   rs("dictgc")=request("dictgc")
   rs("dictnumber")=request("dictnumber")
   rs("qucheng")=request("qucheng")
   rs("hucheng")=request("hucheng")
   rs("auditbz")=request("auditbz")
   rs.update
   Response.Write "<script language=""JavaScript"">alert('����[ͨ���������]��[�޸���Ϣ]�ɹ���');location.replace('audit.asp?reuser="&request("reuser")&"');</script>"
   Response.End
end if
end if
%>
<script language="JavaScript">
function checkdate()  {

  if (Form.dicadd.value==0) {      alert("��ѡ��������Ʊ�ĳ�����������δ��Ʊ�벻Ҫѡ��");  Form.dicadd.focus();      return false;    } 
  if (Form.huzhao.value=="") {      alert("���������Ļ��պ��룬��δ��Ʊ�벻Ҫ��д��");  Form.huzhao.focus();      return false;    } 
  if (Form.dictgc.value=="") {      alert("������������Ʊ�ĺ��չ�˾����δ��Ʊ�벻Ҫ��д��");  Form.dictgc.focus();      return false;    } 
  if (Form.dictnumber.value=="") {      alert("������������Ʊ�ĺ����ţ���δ��Ʊ�벻Ҫ��д��");  Form.dictnumber.focus();      return false;    }
  if (Form.qucheng.value=="") {      alert("������������������XXʱXX�֣���δ��Ʊ�벻Ҫ��д��");  Form.qucheng.focus();      return false;    }
  if (Form.hucheng.value=="") {      alert("������������س����XXʱXX�֣���δ��Ʊ�벻Ҫ��д��");  Form.hucheng.focus();      return false;    }
  if (Form.R1.value=="") {      alert("��ѡ��������");    return false;    }
  
  return true;  } 

</script>
	</p>
<form method="POST" action="audit.asp?act=1828" name="Form" onSubmit="return checkdate()">
<div align="center">
	<table border="0" width="50%" id="table2" height="100%">
		<tr>
			<td align="right">�û�����</td>
			<td align="left"><%=rs("user")%><input type="hidden" name="reuser" size="15" value="<%=rs("user")%>"></td>
		</tr>
		<tr>
			<td align="right">������</td>
			<td align="left"><%=rs("name")%></td>
		</tr>
		<tr>
			<td align="right">�Ա�</td>
			<td align="left"><%=rs("xb")%></td>
		</tr>
		<tr>
			<td align="right">���֤���룺</td>
			<td align="left"><%=rs("userid")%></td>
		</tr>
		<tr>
			<td align="right">����������</td>
			<td align="left"><%=rs("addsheng")%><%=rs("addshi")%></td>
		</tr>
		<tr>
			<td align="right">��ϵ�ֻ���</td>
			<td align="left"><%=rs("call")%></td>
		</tr>
		<tr>
			<td align="right">QQ��</td>
			<td align="left"><%=rs("qq")%></td>
		</tr>
		<tr>
			<td align="right">�������쵼�ˣ�</td>
			<td align="left"><select size="1" name="adqldr">
			<option selected value="<%=rs("addldr")%>"><%=rs("addldr")%></option>
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
			</select></td>
		</tr>
		<tr>
			<td align="right">����������</td>
			<td align="left">
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
			<td align="right">���պ��룺</td>
			<td align="left"><input type="text" name="huzhao" size="20" value="<%=rs("huzhao")%>" onKeyUp="value=value.replace(/[\W]/g,'')"></td>
		</tr>
		<tr>
			<td align="right">���չ�˾��</td>
			<td align="left"><input type="text" name="dictgc" size="20" value="<%=rs("dictgc")%>"></td>
		</tr>
		<tr>
			<td align="right">�����ţ�</td>
			<td align="left"><input type="text" name="dictnumber" size="20" value="<%=rs("dictnumber")%>" onKeyUp="value=value.replace(/[\W]/g,'')"><input type="hidden" name="cjpa" size="10" value="<%=request("cjpa")%>"></td>
		</tr>
		<tr>
			<td align="right">�������ʱ�䣺</td>
			<td align="left">2015��07��11��<input type="text" name="qucheng" size="5" value="<%=rs("qucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24Сʱ���磺0920</font></td>
		</tr>
		<tr>
			<td align="right">�س����ʱ�䣺</td>
			<td align="left">2015��07��15��<input type="text" name="hucheng" size="5" value="<%=rs("hucheng")%>" onKeyUp="value=value.replace(/[^\d]/g,'')" maxlength="4" ><font size="2" color="#FF0000">24Сʱ���磺0920</font></td>
		</tr>
		<tr>
			<td align="right">�������״̬��</td>
			<td align="left"><font color="#0000FF"><%if rs("audit2")=1 then%>��ȫͨ��<%else%>�ȴ����󣬾�����д��Ʊ��Ϣ��<%end if%></font></td>
		</tr>
		<tr>
			<td align="right">��ע��</td>
			<td align="left"><textarea rows="3" name="auditbz" cols="35"><%=rs("auditbz")%></textarea></td>
		</tr>
		<tr>
			<td align="right">������˲�����</td>
			<td align="left"><input type="radio" name="R1" value="2">��ͨ���������<input type="radio" value="1" name="R1" <%if rs("audit2")=1 then%>checked<%end if%>>ͨ���������</td>
		</tr>
		<tr>
			<td align="right">��</td>
			<td align="left"><input type="submit" value="�ύ" name="B1" onClick="return confirm('��ʾ����ȷ������')" ></td>
		</tr>
	</table>
</div>
</form>