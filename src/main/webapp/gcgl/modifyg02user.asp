<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html><head><title>��Ա���ϲ鿴</title>
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
userid=trim(request("userid"))
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%></font><form name="form" METHOD="POST" action="gjusersave.asp?userid=<%=userid%>">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="461">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="35" bgcolor="#FFFFFF" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> <b><font style="font-size: 11pt">�޸Ļ�Ա��Ϣ</font></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="38%" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�û�����</font></td>
        <td width="61%" align="left" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"><font color="#FF0000" style="font-size: 11pt"><%=rs("username")%>&nbsp;&nbsp; </font><font style="font-size: 11pt">�Ƽ��ˣ�</font><b><font color="#000080" style="font-size: 11pt"><%=rs("up")%>&nbsp;&nbsp;&nbsp;&nbsp; <a href="delid.asp?del=<%=userid%>" style="text-decoration: none">ɾ���û�</a></font></b></td>
      </tr>
      <tr> 
        <td align="right" width="38%" height="35" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">��¼���룺</font></td>
        <td width="61%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input name="password" size="20"></span></font><font style="font-size: 11pt"><font color="#FF0000">**���޸�������</font></font></td>
      </tr>
      <tr> 
        <td align="right" width="38%" height="31" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�������룺</font></td>
        <td width="61%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input name="password3" value="<%=trim(rs("password3"))%>" size="20"></span></font><font color="#FF0000" style="font-size: 11pt"> **������д</font><font style="font-size: 11pt"></font></td>
      </tr>
      <tr>
        <td align="right" width="38%" height="34" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font style="font-size: 11pt">�� ����</font></td>
        <td width="61%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=32 name="name" size="30" value="<%=trim(rs("name"))%>"></span></font><font style="font-size: 11pt"><font color="#FF0000">**������д</font> </font> </td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="38%" height="36" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font color="#FF0000" style="font-size: 11pt"><b>QQ��</b></font></td>
        <td width="61%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" maxlength=12 name="QQ" value="<%=trim(rs("qq"))%>" size="30" style="background-color: #E1FFF3"></span></font><font style="font-size: 11pt"></font><font color="#FF0000" style="font-size: 11pt">**������д</font></td>
      </tr>
		<tr>
        <td align="right" width="38%" height="36" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt">--<%if rs("sjb")>0 then%><b>˫����Ա��<font color="#FF0000"><%=rs("sjb")%></font>��</b></span></font><%end if%><font style="font-size: 11pt">---����</font></td>
        <td width="61%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> <font face="����"><span style="font-size: 11pt"><input type="text" name="jb" size="10" value="<%=trim(rs("jb"))%>"></span></font><font color="#FF0000" style="font-size: 11pt"> **������д</font><font color="#0000FF" style="font-size: 11pt"> 2ʡ������ 3�м����� 4�������� 5�����̼�</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="38%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><span style="font-size: 11pt">��ֵ�ۼƣ�</span></td>
        <td width="61%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><font face="����"><span style="font-size: 11pt"><input type="text" name="cjtj" size="15" value="<%=trim(rs("cjtj"))%>" >���һ�γ�ֵʱ�䣺<%=trim(rs("gmdate"))%></span></font></td>
      </tr>
      <tr> 
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#FFFFCE" height="38"> 
          <b><font style="font-size: 11pt">�ֺ��Ȩ��</font></b><font size="3" face="����"><span style="font-size: 11pt"><input name="gdgc" size="10" style="font-weight: 700" value="<%=trim(rs("gdgc"))%>"></span></font><b><font style="font-size: 11pt">&nbsp; 
			����������</font></b><font size="3" face="����"><span style="font-size: 11pt"><input name="jyg" size="15" style="font-weight: 700" value="<%=trim(rs("jyg"))%>"></span></font><b><font style="font-size: 11pt">&nbsp;&nbsp; 
			��ң�</font></b><font size="3" face="����"><span style="font-size: 11pt"><input name="jydb" size="15" style="font-weight: 700" value="<%=trim(rs("jydb"))%>"></span></font></td>
      </tr>
      <tr> 
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="166"> 
          <div align="center"> 
            <table border="1" width="50%" id="table1" cellspacing="1" style="border-collapse: collapse" height="110">
				<tr>
					<td>ʡ���룺<input type="text" name="shengtj" size="15" value="<%=trim(rs("shengtj"))%>"></td>
					<td>�����룺<input type="text" name="shitj" size="15" value="<%=trim(rs("shitj"))%>"></td>
					<td>�����룺<input type="text" name="qutj" size="15" value="<%=trim(rs("qutj"))%>"></td>
				</tr>
				<tr>
					<td>ʡʣ�ࣺ<input type="text" name="shengpay" size="15" value="<%=trim(rs("shengpay"))%>"></td>
					<td>��ʣ�ࣺ<input type="text" name="shipay" size="15" value="<%=trim(rs("shipay"))%>"></td>
					<td>��ʣ�ࣺ<input type="text" name="qupay" size="15" value="<%=trim(rs("qupay"))%>"></td>
				</tr>
				<tr>
					<td>ʡ���֣�<input type="text" name="shengtx" size="15" value="<%=trim(rs("shengtx"))%>"></td>
					<td>�����֣�<input type="text" name="shitx" size="15" value="<%=trim(rs("shitx"))%>"></td>
					<td>�����֣�<input type="text" name="qutx" size="15" value="<%=trim(rs("qutx"))%>"></td>
				</tr>
			</table>
			</div>
			<div align="center"> 
            ��</div>
			<div align="center"> 
            <font face="����"> 
            <span style="font-size: 11pt"> 
            <input type="submit" value="�� �� �� ��" name="B1" style="font-weight: bold; font-size:12pt"></span></font><font style="font-size: 11pt">&nbsp;&nbsp;</font><font color="#FF0000" style="font-size: 11pt">&nbsp;&nbsp; </font><font face="����"><b>
		<a style="text-decoration: none" target="_blank" href="../vip/chkin_new.asp?pa=<%=rs("password")%>&id=<%=rs("username")%>"><font size="3">��¼</font></a></b></font><font style="font-size: 11pt">&nbsp;</font><font color="#FF0000" style="font-size: 11pt">&nbsp;&nbsp;&nbsp;&nbsp; </font>
		<a href="searchg0701.asp"><font color="#FF0000" style="font-size: 11pt">��������</font></a></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>
</form></font>
<table border="1" width="100%" id="table2">
	<tr>
		<td align="center">
		<iframe name="I1" height="100%" width="100%" border="0" frameborder="0" src="epsf.asp?sfid=<%=rs("username")%>"></iframe></td>
		<td align="center">
		<iframe name="I2" height="100%" width="100%" border="0" frameborder="0" src="btpay.asp?btid=<%=rs("username")%>"></iframe></td>
		<td align="center">
		<iframe name="I3" height="100%" width="100%" border="0" frameborder="0" src="eptojf.asp?jfid=<%=rs("username")%>"></iframe></td>
		<td align="center">
		<iframe name="I4" height="100%" width="100%" border="0" frameborder="0" src="eptodb.asp?dbid=<%=rs("username")%>" ></iframe></td>
	</tr>
</table>