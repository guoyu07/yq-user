<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>
<body>
<%
userid=request("syid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from sgxt where username = '"&userid&"'"
rs1.open sql1,conn7,1,1
if rs1("sjb")=20 then
   syzfh=0
elseif rs1("sjb")=40 then
   syzfh=5000
elseif rs1("sjb")=100 then
   syzfh=20000
end if
%>
<form method="POST" action="syuserok.asp?syid=<%=userid%>" name="form">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>用户名：<font color="#008000"><%=userid%></font>-----</b><a href="syuserok.asp?syid=<%=userid%>&zfh=<%=rs1("sjb")*250%>&cb=0" style="text-decoration: none">撤销促销</a></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" height="27" colspan="4"><p align="center"><b><font color="#008000">设定促销客户</font></b></td>
			</tr>
			<tr>
				<td align="right" width="48%" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2"><b>是否促销用户：</b></font></td>
				<td height="27" width="7%"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%if rs1("sjb")*250>rs1("zfh") then%>是<%end if%></b></font></td>
				<td height="27" colspan="2">返一币数量：<b><font color="#FF0000"><%=rs1("zfh")%></font></b></td>
			</tr>
			<tr>
				<td align="right" width="48%"><input type="hidden" name="zfh" size="10" value="<%=syzfh%>" readonly></td>
				<td width="1%" colspan="2"><input type="submit" value="提交修改" name="B1"></td>
				<td width="41%"><input type="hidden" name="cb" size="3" value="1"></td>
			</tr>
			</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
</form>

</body>

</html>