<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq061866.asp"-->
<%
'开始把myid放置
myid=request("my")
jsjb=request("bsjb")
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&myid&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof or rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
'开始在新表sgxtuser搜索上级
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM sgxt where username = '"&myid&"'"
rs0.open sql0,conn7,2,3
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('报单人不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
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
	rs_Calculate("zaq")=rs_Calculate("zaq")+jsjb'myup的左边(A)总单数+
	rs_Calculate("aq")=rs_Calculate("aq")+jsjb'myup的左边目前单数+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName then'如果两边都不等于0也就是有人了
	rs_Calculate("zbq")=rs_Calculate("zbq")+jsjb'myup的右边(B)总单数+
	rs_Calculate("bq")=rs_Calculate("bq")+jsjb'myup的右边目前单数+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'错误的逻辑
	End if
 
End Function

%>
<%
response.Write "<script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='searchg0701.asp'</script>"
'response.redirect "searchg0701.asp"
%>