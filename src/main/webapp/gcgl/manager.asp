<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
dim rs
dim sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where id =2"
rs.open sql,conn2,1,1
%>
<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">

<meta NAME="Microsoft Border" CONTENT="none">
<meta NAME="GENERATOR" CONTENT="Microsoft FrontPage 6.0">
<title>������Ϸ��ƽ̨</title>

</head>
<frameset framespacing="0" border="false" cols="180,*" frameborder="0"> 
<frame name="left"  scrolling="auto" marginwidth="0" marginheight="0" src="left.asp">
<frame name="BoardList" scrolling="auto" src="readme.asp">
</frameset>
<noframes>
</noframes> 
</html>