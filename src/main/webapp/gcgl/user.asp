<!--#include file="../ct0618.asp"-->
<%
paid=request("paid")
userid=request("userid")
%>
<html>
<head>
<title>�û����ϲ鿴</title>
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "����"; font-size: 9pt ;line-height: 18px;}
-->
</style>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
</body>
</html>
<div align="center">
<font face="����" style="font-size: 11pt">
<form method="POST" action="user.asp" name="form"><p align="center">�������룺<input name="paid" size="10" type="password" value="<%=paid%>"> �û�����<input type="text" name="userid" size="15"> <input type="submit" value="�ύ" name="B1"></p></form>
<%
if request("paid")<>"" then
if paid<>"vn8910y" then
   response.write "<script language='javascript'>"
   response.write "alert('�������벻��ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�û��������ڣ�������д�룡');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
end if
%>
</font></p>
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="533">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">�û���Ϣ</font></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><b><font size="3">�û�����</font></b></td>
        <td width="62%" align="left" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font color="#FF0000" size="3"><b><%=rs("username")%>&nbsp;&nbsp; </b> </font><b><font size="3">�Ƽ��ˣ�</font><font color="#000080" size="3"><%=rs("up")%></font></b></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><font color="#D9E6FF"><%=rs("vipsq")%></font>�� ����</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><%=trim(rs("name"))%> </font> </td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><font color="#D9E6FF"><%=rs("password")%></font>�����У�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><select size="1" name="bank">
		<option selected><%=trim(rs("bank"))%></option>
		<option>��������</option>
		<option>��������</option>
		<option>ũҵ����</option></select>-------------<%if rs("sjb")>0 then%><b>˫����Ա��<font color="#FF0000"><%=rs("sjb")%></font>��</b></span></font><%end if%></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">���п��ţ�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=32 name="card" size="30" value="<%=trim(rs("card"))%>"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><b><font style="font-size: 11pt">Email</font></b><font style="font-size: 11pt">��</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=64 name="email" value="<%=trim(rs("email"))%>" size="30"></span></font><font color="#FF0000" style="font-size: 11pt"><b>QQ��<%=trim(rs("qq"))%></b></font></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�绰���룺</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=12 name="QQ1" value="<%=trim(rs("call"))%>" size="30" style="padding:0; background-color: #FFFFFF; color:#0000FF"></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">���֤���룺</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=12 name="userid" value="<%=trim(rs("userid"))%>,(<%if rs("gwuid")=0 then%>����<%else%>����<%end if%>)" size="30" style="padding:0; background-color: #FFFFFF; color:#0000FF"><%if rs("gwuid")=0 then%><a onClick="return confirm('��ʾ����ȷ������')" href="usergngw.asp?diyid=<%=rs("username")%>&sjid=1" style="text-decoration: none">��Ϊ�������</a><%else%><a onClick="return confirm('��ʾ����ȷ������')" href="usergngw.asp?diyid=<%=rs("username")%>&sjid=0" style="text-decoration: none">��Ϊ�������</a><%end if%></span></font></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><font color="#D9E6FF"><%=rs("password3")%></font>��ַ��</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=64 name="address" value="<%=trim(rs("addsheng"))%><%=trim(rs("addshi"))%><%=trim(rs("addqu"))%>" size="50"></span></font><font style="font-size: 11pt"></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��Աע�����ڣ�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="regtime" size="30" value="<%=trim(rs("regtime"))%>" readonly>����ʱ�䣺<%=rs("bddate")%></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��Ϊ����ʱ�䣺</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=20 name="dldate" value="<%=trim(rs("dldate"))%>" size="30" readonly>&nbsp;</span><b><font style="font-size: 11pt">��������<%=trim(rs("dldate")+0.001)%></font></b></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#C9D8AD"><font style="font-size: 11pt">�����¼ʱ�䣺</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#C9D8AD"> <font face="����"><span style="font-size: 11pt"><input type="text" maxlength=20 name="dldate1" value="<%=trim(rs("logtime"))%>" size="30" readonly></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt"><font color="#FF00FF"><%if rs("vip")>0 then%>��������<%end if%></font>----����</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> <font face="����"><span style="font-size: 11pt"><input type="text" name="jb" size="10" value="<%=trim(rs("jb"))%>" readonly><font color="#FF0000">&nbsp;</font></span></font><font color="#0000FF" style="font-size: 11pt">2ʡ������ 3�м����� 4�������� 5�����̼�</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">��ֵ�ۼƣ�</span></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="cjtj" size="15" value="<%=trim(rs("cjtj"))%>" >���һ�γ�ֵʱ�䣺<%=trim(rs("gmdate"))%></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">�ۼ����룺</span></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="cbpay" size="15" value="<%=trim(rs("cbpay"))%>" readonly>֮ǰ�͵ı����ң�<%=rs("syep")%></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="pay" size="15" value="<%=trim(rs("pay"))%>" readonly>��������ת��<%=rs("vippay")%> �ɿ��������ң�<font color="#FF0000"><%=trim(rs("sybdb"))%></font></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�����֣�</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txpay" value="<%=trim(rs("txpay"))%>" size="15">��ң�<font color="#008000"><%=rs("jydb")%></font> ���֣�<font color="#0000FF"><%=rs("jyg")%></font></span></font></td>
      </tr>
		<tr>
        <td align="right" width="37%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">Э��ͻ���</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txbl1" value="<%=trim(rs("txlb"))%>" size="15">1Ϊ�ǣ�0Ϊ����--<a target="_blank" href="http://yb.zgyce.com/admin/sj_zgyce.asp?login_name=<%=rs("username")%>" style="text-decoration: none">�����̼�</a></span></font></td>
      </tr>
		<tr>
        <td align="right" width="37%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt" face="����" color="#008000">�����ͻ���</font></td>
        <td width="62%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txbl" value="<%=trim(rs("cbuser"))%>" size="15"><font color="#008000">1Ϊ�ǣ�0Ϊ����</font></span></font></td>
      </tr>
      <tr> 
       <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="45"> 
       <div align="center"><font face="����"><b><a style="text-decoration: none" target="_blank" href="../vip/chkin_new.asp?pa=<%=rs("password")%>&id=<%=rs("username")%>"><font color="#FF00FF" size="3">��¼</font></a></b></font></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>
</font>
<%end if%>
<p>
<p style="line-height: 100%; margin-top: 0; margin-bottom: 0"></p>
<p style="line-height: 100%; margin-top: 0; margin-bottom: 0"></p>
<p style="line-height: 100%; margin-top: 0; margin-bottom: 0"></p>