<!--#include file="../ct0618.asp"-->
<%
lkid=request("lkid")
fkpa=request("fkpa")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where cz01 ='"&lkid&"'and adminusername ='"&fkpa&"'"
rs.open sql,conn2,1,1
if  rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���û������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
Session("adminusername")=rs("adminusername")
'session("password")=rs_admin("password")
response.redirect "xtbfk001.asp"
end if
%>
<html>
<title>��Ա����</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="70" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">��Ա����</font></b></td>
    </tr>
    <tr>
      <td height="46" align="center" bgcolor="#C3DAF9">
		<form name="form" method="POST" action="xtbfk002.asp">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 9pt">&nbsp;<input type="text" name="lkid" size="20"><input type="submit" name="Submit" value="����">����û�Ա��ID������ʵ������QQ����</span></p>
		</form></td>
    </tr>
  </table>
</div>
</body> 
</html>