<!--#include file="../ct0618.asp"-->
<html><head>
<title>���û����ϲ鿴</title>
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
<%
userid=request("userid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
</font><form name="form" METHOD="POST" action="ycsave.asp?userid=<%=userid%>">
    <div align="center"> <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="359">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">�޸Ļ�Ա��Ϣ</font></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�û�����</font></td>
        <td width="63%" align="left" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font color="#FF0000" style="font-size: 11pt"><%=rs("username")%>&nbsp;&nbsp; </font><font style="font-size: 11pt">�Ƽ��ˣ�</font><b><font color="#000080" style="font-size: 11pt"><%=rs("up")%></font></b></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��¼���룺</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input name="password" size="20"></span></font><font style="font-size: 11pt"><font color="#FF0000">**���޸�������</font> </font> </td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�������룺</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input name="password3" value="<%=trim(rs("password3"))%>" size="20"></span></font><font color="#FF0000" style="font-size: 11pt"> **������д</font><font style="font-size: 11pt"></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�� ����</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=32 name="name" size="10" value="<%=trim(rs("name"))%>"></span></font><font style="font-size: 11pt"><font color="#FF0000">**������д</font> </font> </td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�����У�</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><select size="1" name="bank">
		<option selected><%=trim(rs("bank"))%></option>
		<option>��������</option>
		<option>��������</option>
		<option>ũҵ����</option></select></span></font><font style="font-size: 11pt"><font color="#FF0000">**������д</font> </font> </td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">���п��ţ�</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=32 name="card" size="22" value="<%=trim(rs("card"))%>"></span></font><font style="font-size: 11pt"> </font> </td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�绰���룺</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=12 name="call" value="<%=trim(rs("call"))%>" size="22" style="padding:0; background-color: #FFFFFF; color:#0000FF"></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt" color="#FF0000">���֤���룺</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=19 name="userid2" value="<%=trim(rs("userid"))%>" size="22" style="padding:0; background-color: #FFFFFF; color:#FF0000"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><b><font style="font-size: 11pt">Email</font></b><font style="font-size: 11pt">��</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=64 name="email" value="<%=trim(rs("email"))%>" size="22"></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font color="#FF0000" style="font-size: 11pt"><b>QQ��</b></font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=12 name="QQ" value="<%=trim(rs("qq"))%>" size="22" style="background-color: #E1FFF3"></span></font><font style="font-size: 11pt"></font></td>
      </tr>
      <tr> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��ַ��</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=64 name="address" value="<%=trim(rs("addsheng"))%><%=trim(rs("addshi"))%><%=trim(rs("addqu"))%>" size="30"></span></font><font style="font-size: 11pt"></font><font color="#FF0000" style="font-size: 11pt">**������д<a style="text-decoration: none" target="_blank" href="../adduser.asp?addid=<%=rs("username")%>">�޸�</a></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��Աע�����ڣ�</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="regtime" size="30" value="<%=trim(rs("regtime"))%>" ></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��Ϊ����ʱ�䣺</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=20 name="dldate" value="<%=trim(rs("dldate"))%>" size="30" readonly>&nbsp;</span><b><font style="font-size: 11pt"><a target="_blank" href="dluser.asp?dldiy=<%=rs("username")%>" style="text-decoration: none">��������</a></font></b></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">����</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> <font face="����"><span style="font-size: 11pt"><input type="text" name="jb" size="10" value="<%=trim(rs("jb"))%>"></span></font><font color="#FF0000" style="font-size: 11pt"> **������д</font><font color="#0000FF" style="font-size: 11pt"> 2ʡ������ 3�м����� 4�������� 5�����̼�</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">��ֵ�ۼƣ�</span></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="cjtj" size="15" value="<%=trim(rs("cjtj"))%>" readonly>���һ�γ�ֵʱ�䣺<%=trim(rs("gmdate"))%></span></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">�ۼ����룺</span></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="cbpay" size="15" value="<%=trim(rs("cbpay"))%>"></span></font></td>
      </tr>
      <tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="pay" size="15" value="<%=trim(rs("pay"))%>" ></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�����֣�</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txpay" value="<%=trim(rs("txpay"))%>" size="15" ></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�������ƣ�</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=6 name="payok" value="<%=trim(rs("payok"))%>" size="15"></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">����ָ����</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=6 name="cxt" value="<%=trim(rs("cxt"))%>" size="15"></span></font></td>
      </tr>
		<tr>
        <td align="right" width="36%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">Э��ͻ���</font></td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=6 name="txlb" value="<%=trim(rs("txlb"))%>" size="15">1Ϊ�ǣ�0Ϊ����---------<%if rs("sjb")>0 then%><b>˫����Ա��<font color="#FF0000"><%=rs("sjb")%></font>��</b></span></font><%end if%></td>
      </tr>
      <tr> 
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="22"> 
        <div align="center"> </div>
		<div align="center"><font face="����"><span style="font-size: 11pt"><input type="submit" value="�� �� �� ��" name="B1" style="font-weight: bold; font-size:12pt"></span></font><font style="font-size: 11pt">&nbsp;</font><font color="#FF0000" style="font-size: 11pt">������һҳ</font><font style="font-size: 11pt">&nbsp;&nbsp; </font><b><a style="text-decoration: none" target="_blank" href="../vip/chkinidex3.asp?pa=<%=rs("password")%>&id=<%=rs("username")%>"><font color="#FF00FF" size="3">��¼</font></a></b></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>
</form></font>
<p></p>