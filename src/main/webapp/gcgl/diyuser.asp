<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<html><head><title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/css.css" rel="stylesheet" type="text/css">
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "����"; font-size: 9pt ;line-height: 18px;}
-->
</style>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
<span style="font-size: 9pt">

</body>
</html>
</span>
<div align="center">
<%regid=trim(request("regid"))
   set rs=server.createobject("adodb.recordset")
   sql="select * from cfuser where username like '"&regid&"'"
   rs.open sql,conn,2,3
id=rs("username")
pa=rs("password")
%>
<form name="form1" METHOD="post" action="modifyusersave.asp?regid=<%=regid%>">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="359">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> 
          <b><span style="font-size: 11pt">�޸Ļ�Ա��Ϣ</span></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="29" style="color: #0000000; font-family: ����; font-size: 9pt; line-height: 18px" bgcolor="#D9E6FF"> 
          <b>�û�����</b></td>
        <td width="63%" align="left" height="29" style="color: #0000000; font-family: ����; font-size: 11pt; line-height: 18px" bgcolor="#D9E6FF">
		<font color="#FF0000"><b><%=rs("username")%></b></font>&nbsp;&nbsp;                    �Ƽ��ˣ�<%=rs("up")%></td>
      </tr>
      <tr> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          ��¼���룺</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input name="password" size="20">
          <font color="#FF0000">**���޸�������</font> </td>
      </tr>
      <tr> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          �������룺</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input name="password3" value="<%=trim(rs("password3"))%>" size="20"><font color="#FF0000"> **������д</font> </td>
      </tr>
      <tr> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          �� ����</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" maxlength=32 name="name" size="10" value="<%=trim(rs("name"))%>">
          <font color="#FF0000">**������д</font></td>
      </tr>
      <tr> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          ���ַ�ʽ��</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <select size="1" name="bank">
			<option selected><%=trim(rs("bank"))%></option>
			<option>֧����</option>
			<option>�Ƹ�ͨ</option>
			<option>�й���������</option>
			<option>�й�ũҵ����</option>
			</select>
          <font color="#FF0000">**������д</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          ��Ӧ�˺ţ�</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" maxlength=32 name="card" size="20" value="<%=trim(rs("card"))%>">
          <font color="#FF0000">**������д</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font face="Arial">��ϵ�绰</font></b>��</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" maxlength=64 name="call" value="<%=trim(rs("call"))%>" size="20"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font face="Arial">��������</font></b>��</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" maxlength=64 name="email" value="<%=trim(rs("email"))%>" size="20">
          <font color="#FF0000">**������д</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
        <b><font face="Arial">QQ</font></b>��</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" maxlength=12 name="QQ" value="<%=trim(rs("qq"))%>" size="20" style="background-color: #E8FFE8">
          <font color="#FF0000">**������д</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">
        ����</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" name="jb" size="10" value="<%=trim(rs("jb"))%>"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">
        ���ڳ��У�</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" name="add" size="60" value="<%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%><%=rs("addzhen")%>" readonly>
			<font color="#0000FF" size="3">
			<a target="_blank" href="../add2.asp?regid=<%=rs("username")%>" style="text-decoration: none">�޸ĵ�ַ</a></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="35%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">
        ��Աע�����ڣ�</td>
        <td width="63%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" name="regtime" size="20" value="<%=trim(rs("regtime"))%>" readonly></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="98%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2">
        <p align="center">�ۼ��ֽ�<input type="text" name="cbpay" size="10" value="<%=trim(rs("cbpay"))%>"><b><font color="#008000">&nbsp;&nbsp;&nbsp;�ۼ����֣�<input type="text" name="txpay" size="10" value="<%=trim(rs("txpay"))%>">&nbsp;&nbsp; ��</font></b><input type="text" name="pay" size="10" value="<%=trim(rs("pay"))%>">&nbsp;&nbsp; 
			ʣ����ң�<input type="text" name="jydb" size="10" value="<%=trim(rs("jydb"))%>"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="98%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2">
        	<p align="center">�̶���Ʊ��<input type="text" name="gdgc" size="10" value="<%=trim(rs("gdgc"))%>">&nbsp;&nbsp; ���׹�Ʊ��<input type="text" name="jyg" size="10" value="<%=trim(rs("jyg"))%>"></td>
      </tr>
      <tr> 
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:����; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="22"> 
          <div align="center"> 
            <input type="submit" name="submit" width="34" height="20" alt="�ύ" size="20" value="�޸Ļ�Ա��Ϣ" class="lkbtn">&nbsp;&nbsp;&nbsp; </font> <a href="searchguser.asp"><font color="#FF0000" style="font-size: 11pt">��������</font></a><font color="#FF0000" style="font-size: 11pt">&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration: none; font-weight: 700" target="_blank" href="dluser.asp?regid=<%=rs("username")%>"><font color="#008000">���ô���</font></a>&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration: none" target="_blank" href="../vip/chkinidex2.asp?id=<%=id%>&pa=<%=pa%>">��¼</a></font></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>