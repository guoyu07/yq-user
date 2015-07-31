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
elseif rs("jb")<>4 then
   response.write"<script>alert('Note: You are not district-level management, only district-level management can operate! Thank you!');history.go(-1);'</script>"
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('Note: Your one currency balance is less than 15, please recharge!');history.go(-1);</script>"
   response.end
end if
end if
%>
<html>
<title>Player Search</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="70" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">Player Search</font></b></td>
    </tr>
    <tr>
      <td height="46" align="center" bgcolor="#C3DAF9"><form name="form" method="POST" action="glfk002.asp">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 9pt">&nbsp;<input type="text" name="lkid" size="20"><input type="submit" name="Submit" value="Search">Enter the player ID or real name, QQ can</span></p>
		</form></td>
    </tr>
  </table>
</div> 
<table border="0" width="100%" id="table1" cellspacing="1">
	<tr>
		<td>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<iframe name="I3" marginwidth="1" marginheight="1" height="100%" width="100%" src="cjjl.asp?cj=<%=username%>&lb=10">
		</iframe></td>
		<td>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<iframe name="I4" marginwidth="1" marginheight="1" height="100%" width="100%" src="fkjl.asp?fk=<%=username%>&lb=1">
		</iframe></td>
	</tr>
</table>
</body> 
</html>