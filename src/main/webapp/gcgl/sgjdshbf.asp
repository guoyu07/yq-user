<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
'开始把myid放置
myid=request("my")
jsjb=request("sjb")
jdpay=jsjb*500
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&myid&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof or rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   rs("sjb")=rs("sjb")+jsjb
   rs.update
end if
%>
<%
if rs("sjb")=1 then
   fd=2000
   cfd=20
elseif rs("sjb")=2 then
   fd=4000
   cfd=40
elseif rs("sjb")=4 then
   fd=8000
   cfd=60
elseif rs("sjb")=10 then
   fd=20000
   cfd=80
elseif rs("sjb")=20 then
   fd=40000
   cfd=100
elseif rs("sjb")=40 then
   fd=80000
   cfd=150
elseif rs("sjb")=100 then
   fd=200000
   cfd=200
end if
%>
<%
'开始在新表sgxtuser搜索上级
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM sgxt where username = '"&myid&"'"
rs0.open sql0,conn2,2,3
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('报单人不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   rs0("sjb")=rs("sjb") '我的单数
   rs0("fdpay")=fd'我的封顶奖金
   rs0("cfd")=cfd
   rs0.update
end if
%>
<%
set rs10=server.createobject("adodb.recordset")
  sql10="select * from gcuser where username = '"&rs("up")&"'"
  rs10.open sql10,conn2,2,3
  rs10("pay")=rs10("pay")+(0.1*jdpay)
  rs10("cbpay")=rs10("cbpay")+(0.1*jdpay)
  rs10.Update
set rs_d4 = Server.CreateObject("ADODB.Recordset")
sql_d4 = "SELECT * FROM datepay"
rs_d4.open sql_d4,conn9,2,3
rs_d4.addnew
rs_d4("username")=rs("up")
rs_d4("regid")="用户一"&myid&"报单"&jdpay&""
rs_d4("syjz")=0.1*jdpay
rs_d4("pay")=rs10("pay")
rs_d4("jydb")=rs10("jydb")
rs_d4.update
%>
<%
	Call CalculateQ(myid)

Function CalculateQ(userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM sgxt where auid = '"&userName&"' or buid='"&userName&"'"
	'Response.write sql_Calculate&"<br>"

	rs_Calculate.open sql_Calculate,conn2,2,3
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


response.Write "<script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='searchg0701.asp'</script>"
'response.redirect "searchg0701.asp"
%>