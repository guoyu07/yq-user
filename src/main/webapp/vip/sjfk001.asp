<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jb")<>5 then
   response.write"<script>alert('注意：您还不是合作商家，只有合作商家才可以操作！谢谢！');history.go(-1);</script>"
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('注意：您的一币小于15，请充值！');history.go(-1);</script>"
   response.end
end if
%>
<html>
<title>用户搜索</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="68" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="23" align="center" background="images/admin_bg_1.gif">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">用户搜索-您的一币余额为：<font color="#FF0000"><%=rs("pay")%></font></font></b></td>
    </tr>
    <tr>
      <td height="46" align="center" bgcolor="#C3DAF9"><form name="form" method="POST" action="sjfk002.asp">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 9pt">&nbsp;<input type="text" name="lkid" size="20"><input type="submit" name="Submit" value="搜索">&nbsp; 输入该用户的ID或者真实姓名、QQ均可</span></p>
		</form></td>
    </tr>
  </table>
</div> 
<table border="0" width="100%" id="table1" cellspacing="1">
	<tr>
		<td>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" src="cjjl.asp?cj=<%=username%>&lb=20">
		</iframe></td>
		<td>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<iframe name="I2" marginwidth="1" marginheight="1" height="100%" width="100%" src="fkjl.asp?fk=<%=username%>&lb=2">
		</iframe></td>
	</tr>
</table>
</body> 
</html>