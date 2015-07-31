<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('用户名或密码错误！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   ygid=request.cookies("regid")
   password=request.cookies("password") 
end if
%>
<!--#include file="../ct0618.asp"-->
<%
sql="select * from gcuser where username = '" & ygid & "'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
%>
<html>
<head>
<title>中国一川（澳门）国际有限公司--积分游戏、消费增值平台、员工内部薪酬结算、办公、游戏理财及娱乐休闲平台</title>
</head>
<frameset cols="188,*" framespacing="0" border="false"> 
<frame name="carnoc"  scrolling="auto" marginwidth="0" marginheight="0" src="admin_menu.asp">
<frame name="main" scrolling="auto" src="/vgo/gg.asp?jhid=<%=ygid%>&dq=<%=rs("dqu")%>"></frameset>
<noframes></noframes>
</html>