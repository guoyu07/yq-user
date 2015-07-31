<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('ÕËºÅ»òÃÜÂë´íÎó£¡');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   dquser=request.cookies("regid")
   password=request.cookies("password")
   myid=request("my")
end if
%>
<%
set rsb = Server.CreateObject("ADODB.Recordset")
sqlb="select * from gcuser where username ='"&dquser&"'"
rsb.open sqlb,conn2,1,1
if myid<>dquser then
   response.write "<script language='javascript'>"
   response.write "alert('²Ù×÷´íÎó£¬ÇëÖØĞÂµÇÂ¼£¡');"
   response.write "top.location.replace('login.asp');"  
   response.write "</script>"
   response.end
elseif rsb("vip")=1 then
   response.redirect "vipep.asp?myvip="&dquser&""   
elseif rsb("sjb")=0 then
   response.redirect "vipep.asp?myvip=300fhk"
end if
%>
<%
Call CalculateQ(myid)
Function CalculateQ(userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM sgxt where auid = '"&userName&"' or buid='"&userName&"'"
	'Response.write sql_Calculate&"<br>"

	rs_Calculate.open sql_Calculate,conn7,2,3
	If rs_Calculate.eof Or rs_Calculate.bof Then
	Exit Function
	End If
	
	if rs_Calculate("auid")=userName Then
	if rs_Calculate("vip")=1 then
	response.redirect "vipep.asp?myvip="&rs_Calculate("username")&""
	end if
	Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName then
	if rs_Calculate("vip")=1 then
	response.redirect "vipep.asp?myvip="&rs_Calculate("username")&""
	end if
	Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'´íÎóµÄÂß¼­
	End if
    response.redirect "vipep.asp?myvip=300fhk" 
End Function
%>