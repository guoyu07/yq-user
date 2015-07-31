<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
tuser=request("up")
myid=request("my")
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT * FROM sgxt where auid = '"&myid&"' or buid = '"&myid&"'"
rs1.open sql1,conn7,1,1
if not rs1.eof then
   response.write "<script language='javascript'>"
   response.write "alert('报单人已安置好，不能重复，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM gcuser where username = '"&myid&"'"
rs_my.open sql_my,conn2,2,3
if rs_my("sjb")=1 then
   zjjb=200
   cjpay=500
elseif rs_my("sjb")=2 then
   zjjb=450
   cjpay=1000
elseif rs_my("sjb")=4 then
   zjjb=960
   cjpay=2000
elseif rs_my("sjb")=10 then
   zjjb=2500
   cjpay=5000
elseif rs_my("sjb")=20 then
   zjjb=5000
   cjpay=10000
elseif rs_my("sjb")=40 then
   zjjb=11000
   cjpay=20000
elseif rs_my("sjb")=100 then
   zjjb=30000
   cjpay=50000
end if
if rs_my.eof and rs_my.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_my("jydb")=rs_my("jydb")+zjjb
   rs_my("gmdate")=now()
   rs_my.update
  set rs_d2 = Server.CreateObject("ADODB.Recordset")
  sql_d2 = "SELECT * FROM datepay"
  rs_d2.open sql_d2,conn9,2,3
  rs_d2.addnew
  rs_d2("username")=myid
  rs_d2("regid")="消费"&cjpay&"送"&zjjb&"金币-"&rs_my("up")&""
  rs_d2("jyjz")=zjjb
  rs_d2("pay")=rs_my("pay")
  rs_d2("jydb")=rs_my("jydb")
  rs_d2.update
end if
%>
<%
'开始在新表sgxtuser搜索上级
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxt where username = '"&tuser&"'"
rs.open sql,conn7,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('上层不存在，没法放置，请检查是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("auid")<>"" and rs("buid")<>"" then'如果两边都不等于空也就是有人了
   response.write "<script language='javascript'>"
   response.write "alert('位置已被占用，请重新选择！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("auid")<>"" then'否则如果左边不等于空，那myid就放在myup右边
    rs("buid")=myid
    rs.update
else'否则myid放在myup左边
    rs("auid")=myid
    rs.update
end if
%>
<%
'''单个用户
x = 1
upuser=request("my")
'Response.Write(upuser & ",")
zysjb = Conn7.Execute("select sjb from sgxt where username = '" & upuser & "'")(0)
cup(upuser)
'Response.Write("<hr />")

Function cup(user)
	strSQL = Replace("SELECT TOP 1 username,buid FROM sgxt WHERE auid = '{0}' OR buid = '{0}'", "{0}", user)
	SET rs_ks = Conn7.Execute(strSQL)
	If rs_ks.Eof Then
		'Response.Write(" 共 " & x - 1 & " 层")
		Exit Function
	End If
	If Not rs_ks.EOF Then
		zy = "左"
		strDEL = "DELETE FROM zuo_mingxi WHERE tjuser = '" & rs_ks(0) & "' AND down = '" & upuser & "' AND count = " & x
		strADD = "INSERT INTO zuo_mingxi (tjuser,down,count,sjb) VALUES ('" & rs_ks(0) & "','" & upuser & "'," & x & "," & zysjb & ")"
		If user = rs_ks("buid") Then
		zy = "右"
		strDEL = "DELETE FROM you_mingxi WHERE tjuser = '" & rs_ks(0) & "' AND down = '" & upuser & "' AND count = " & x
		strADD = "INSERT INTO you_mingxi (tjuser,down,count,sjb) VALUES ('" & rs_ks(0) & "','" & upuser & "'," & x & "," & zysjb & ")"
		End If
		Conn7.Execute(strDEL)
		Conn7.Execute(strADD)
		'Response.Write(rs_ks(0) & "(" & zy & "),")
		newuser = rs_ks(0)
		x = x + 1
		Response.Flush()
	End If
	cup(newuser)
End Function
%>
<%
Set rs_zuo = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM zuo_mingxi WHERE down='"&myid&"'"
rs_zuo.Open StrSQL, Conn7,2,3
While Not rs_zuo.EOF
  Set rs_zb = server.CreateObject("ADODB.Recordset")
  StrSQL = "SELECT * FROM zuo_mingxi WHERE tjuser='"&rs_zuo("tjuser")&"' and count="&rs_zuo("count")&""
  rs_zb.Open StrSQL, Conn7,2,3
  While Not rs_zb.EOF
   set rs_d1 = Server.CreateObject("ADODB.Recordset")
   sql_d1 = "SELECT * FROM zuo_biao"
   rs_d1.open sql_d1,Conn7,2,3
   rs_d1.addnew
   rs_d1("tjuser")=rs_zb("tjuser")
   rs_d1("down")=rs_zb("down")
   rs_d1("sjb")=rs_zb("sjb")
   rs_d1("count")=rs_zb("count")
   rs_d1.update
   rs_zb.MoveNext
   Wend
   rs_zb.UpdateBatch
rs_zuo.MoveNext
Wend
rs_zuo.UpdateBatch
%>
<%
Set rs_you = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM you_mingxi WHERE down='"&myid&"'"
rs_you.Open StrSQL, Conn7,2,3
While Not rs_you.EOF
  Set rs_yb = server.CreateObject("ADODB.Recordset")
  StrSQL = "SELECT * FROM you_mingxi WHERE tjuser='"&rs_you("tjuser")&"' and count="&rs_you("count")&""
  rs_yb.Open StrSQL, Conn7,2,3
  While Not rs_yb.EOF
   set rs_d2 = Server.CreateObject("ADODB.Recordset")
   sql_d2 = "SELECT * FROM you_biao"
   rs_d2.open sql_d2,Conn7,2,3
   rs_d2.addnew
   rs_d2("tjuser")=rs_yb("tjuser")
   rs_d2("down")=rs_yb("down")
   rs_d2("sjb")=rs_yb("sjb")
   rs_d2("count")=rs_yb("count")
   rs_d2.update
   rs_yb.MoveNext
   Wend
   rs_yb.UpdateBatch
rs_you.MoveNext
Wend
rs_you.UpdateBatch
%>
<%
Set rs_tjzuo = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM zuo_mingxi WHERE down='"&myid&"'"
rs_tjzuo.Open StrSQL, Conn7,2,3
While Not rs_tjzuo.EOF
  Set rs_tjzb = server.CreateObject("ADODB.Recordset")
  StrSQL = "SELECT sum(sjb) as zuosjb FROM zuo_biao WHERE tjuser='"&rs_tjzuo("tjuser")&"' and count="&rs_tjzuo("count")&""
  rs_tjzb.Open StrSQL, Conn7,2,3
  While Not rs_tjzb.EOF
   set rs_d3 = Server.CreateObject("ADODB.Recordset")
   sql_d3 = "SELECT * FROM sgxt WHERE username='"&rs_tjzuo("tjuser")&"'"
   rs_d3.open sql_d3,Conn7,2,3
   rs_d3("dqzuo")=rs_tjzb("zuosjb")-rs_my("sjb")
   rs_d3("count")=rs_tjzuo("count")
   rs_d3.update
   rs_tjzb.MoveNext
   Wend
   rs_tjzb.UpdateBatch
rs_tjzuo.MoveNext
Wend
rs_tjzuo.UpdateBatch
%>
<%
Set rs_tjyou = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM you_mingxi WHERE down='"&myid&"'"
rs_tjyou.Open StrSQL, Conn7,2,3
While Not rs_tjyou.EOF
  Set rs_tjyb = server.CreateObject("ADODB.Recordset")
  StrSQL = "SELECT sum(sjb) as yousjb FROM you_biao WHERE tjuser='"&rs_tjyou("tjuser")&"' and count="&rs_tjyou("count")&""
  rs_tjyb.Open StrSQL, Conn7,2,3
  While Not rs_tjyb.EOF
   set rs_d4 = Server.CreateObject("ADODB.Recordset")
   sql_d4 = "SELECT * FROM sgxt WHERE username='"&rs_tjyou("tjuser")&"'"
   rs_d4.open sql_d4,Conn7,2,3
   rs_d4("dqyou")=rs_tjyb("yousjb")-rs_my("sjb")
   rs_d4("count")=rs_tjyou("count")
   rs_d4.update
   rs_tjyb.MoveNext
   Wend
   rs_tjyb.UpdateBatch
rs_tjyou.MoveNext
Wend
rs_tjyou.UpdateBatch
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
	
	If rs_Calculate("auid")=userName Then
	rs_Calculate("zaq")=rs_Calculate("zaq")+rs_my("sjb")'myup的左边(A)总单数+
	rs_Calculate.update
Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName Then
	rs_Calculate("zbq")=rs_Calculate("zbq")+rs_my("sjb")'myup的右边(B)总单数+
	rs_Calculate.update
Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'错误的逻辑
	End if
 
End Function
%>
<%
conn7.Execute("delete * from zuo_biao")
conn7.Execute("delete * from you_biao")
response.Write "<script language=javascript>alert('升级双区业务员成功！');location.replace('searchg0701.asp');</script>"
%>