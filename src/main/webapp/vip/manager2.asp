<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�û������������');"
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
<title>�й�һ�������ţ��������޹�˾--������Ϸ��������ֵƽ̨��Ա���ڲ�н����㡢�칫����Ϸ��Ƽ���������ƽ̨</title>
</head>
<frameset cols="188,*" framespacing="0" border="false"> 
<frame name="carnoc"  scrolling="auto" marginwidth="0" marginheight="0" src="admin_menu.asp">
<frame name="main" scrolling="auto" src="/vgo/gg.asp?jhid=<%=ygid%>&dq=<%=rs("dqu")%>"></frameset>
<noframes></noframes>
</html>