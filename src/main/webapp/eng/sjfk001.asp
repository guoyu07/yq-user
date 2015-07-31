<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
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
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jb")<>5 then
   response.write"<script>alert('Note: You are not cooperative businesses, businesses can operate only cooperation! Thank you!');history.go(-1);</script>"
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('Note: Your one currency is less than 15, please recharge!');history.go(-1);</script>"
   response.end
end if
%>
<html>
<title>Users search</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="68" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="23" align="center" background="images/admin_bg_1.gif">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">Users search - your one currency balance is:<font color="#FF0000"><%=rs("pay")%></font></font></b></td>
    </tr>
    <tr>
      <td height="46" align="center" bgcolor="#C3DAF9"><form name="form" method="POST" action="sjfk002.asp">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 9pt">&nbsp;<input type="text" name="lkid" size="20"><input type="submit" name="Submit" value="Search">&nbsp; Enter the user's ID or real name, QQ can</span></p>
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