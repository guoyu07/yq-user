<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
Function addgpjy(clname,mcsl,jyg)
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=clname
rs_d1("mcsl")=mcsl
rs_d1("sysl")=jyg
rs_d1("pay")=0.77
rs_d1("jy")=0
rs_d1("bz")="卖出挂牌中(系统代)"
rs_d1("jypay")=int(mcsl*0.77*1+0.1)/1
rs_d1("newjy")=3
rs_d1.update
End Function
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where jyg>50000 and DateDiff('d',date(),jygdate)<-7 and jygt1=1"
rs.open sql,conn2,1,3
if not rs.eof  Then
	If rs("jyg")>50000 then
	clname=rs("username")
	mcsl=rs("jyg")-50000
	mc30=mcsl*0.3
	hs30=int(mc30/1)
	rs("jyg")=rs("jyg")-hs30
	rs.update
set rs_hs = Server.CreateObject("ADODB.Recordset")
sql_hs = "SELECT * FROM gpjy"
rs_hs.open sql_hs,conn2,2,3
rs_hs.addnew
	rs_hs("username")=clname
	rs_hs("mcsl")=hs30
	rs_hs("sysl")=rs("jyg")
	rs_hs("bz")="超出"&mcsl&"回收30%"
	rs_hs("dfuser")="系统管理员"
	rs_hs("cgdate")=now()
	rs_hs("jy")=1
	rs_hs.update
	End if
end if
%>
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where username = '"&clname&"' and jygt1=1 and DateDiff('d',date(),jygdate)<-7 and jyg>50000"
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
  clname=rsTest("username")
  jygall=rsTest("jyg")
  jygnumber=rsTest("jyg")-50000
  ForCount=Int(jygnumber/200)
  lasenumber=jygnumber Mod 200
  If ForCount>0 Then
	for j=1 to ForCount Step 1
	Call addgpjy(clname,200,jygall-j*200)
	Next
  End If
  If lasenumber>0 Then
	Call addgpjy(clname,lasenumber,jygall-ForCount*200-lasenumber)
  End If
    rsTest("jyg")=50000
	rsTest("jygdate")=abcd
	rsTest("jygt1")=0
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<HTML>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="refresh" content="35; url=""">
</head>
<p>联盟后台管理</p>
<p><iframe name="I1" scrolling="no" border="0" frameborder="0" src="man1234.asp" width="250" height="100" marginwidth="1" marginheight="1"></iframe></p>
</HTML>