<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "window.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="1200"
end if
%><!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
regid=request("id")
td=request("td")
sl=request("gmsl")
%>
<%
if sl=0 then
   response.write "<script language='javascript'>"
   response.write "alert('请选择购买数量，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM cfuser where username like '"&regid&"'"
rs.open sql,conn,3,2
   rs("gmjl")=sl
   rs("gmpay")=(sl*td)/10
   rs.update
%><p align="center">　</p>
	<p align="center"><b><font size="6" color="#0000FF">给会员名</font><font size="6" color="#008000"><%=regid%></font><font size="6" color="#0000FF">操作</font></b></p>
	<p align="center"><b><font size="6">你选择的通道是<font color="#FF0000"><%=td%></font></font></b></p>
	<p align="center"><b><font size="6">购买的数量是<font color="#0000FF"><%=sl%></font>张</font></b></p>
<p align="center">　</p>
<p align="center"><font size="7">
<a onClick="return confirm('提示：您确定了吗？ ')" href="gmuptq.asp?id=<%=regid%>&td=<%=td%>" style="text-decoration: none; font-weight:700">确认无误</a></font></p>
<p align="center">　</p>