<!--#include file="../ct0618.asp"-->
<%
response.cookies("regid")=""
response.cookies("password")=""
%>
<%
ygid=request("ygid")
password=request("pa")
Set rs_login = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username =  '" & ygid & "' and password =  '" & password & "'"
rs_login.open sql,conn2,2,3
if ygid="'or'='or'" then
   response.write "<script language='javascript'>"
   response.write "alert('请不要测试入侵本站！');"
   response.write "top.replace('../index.asp?id=" & ygid & "');"
   response.write "</script>"
   response.end
elseif rs_login.eof and rs_login.bof then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误，请重新登录！');"
   response.write "top.replace('../index.asp?id=" & ygid & "');"
   response.write "</script>"
   response.end
end if
%>
<%
Dim allName
allName=ygid
Call CalculateQ(allName,ygid)
Function CalculateQ(allName,userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM gcuser where username = '"&userName&"'"	
	rs_Calculate.open sql_Calculate,conn2,1,1
	
	If rs_Calculate.eof Or rs_Calculate.bof Then
	rs_Calculate.close()
	'Response.write "没有数据<br>"
	Exit Function
	End If
	if rs_Calculate("username")=userName Then
	if rs_Calculate("vip")>0 Then
	allName=rs_Calculate("username")
	Exit Function
	End if
	Call CalculateQ(allName,rs_Calculate("up"))
    'rs_Calculate.close()
	Else
	'rs_Calculate.close()
	'Response.write "错误的逻辑<br>"
	Exit Function'错误的逻辑
	End if
	
End Function
%>
<%
response.cookies("regid")=rs_login("username")
response.cookies("password")=rs_login("password")
ygid=request.cookies("regid")
ygpa=request.cookies("password")
rs_login("vipname")=allName
rs_login("logtime")=Now()
rs_login.update
rs_login.close
Set rs_login=Nothing
conn2.close
set conn2=nothing
response.redirect "/vgo/vipdl.asp?dl="&ygid&"&pa="&ygpa&""
%>