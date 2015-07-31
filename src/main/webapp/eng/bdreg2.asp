<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="../mq0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   dquser=request.cookies("regid")
   password=request.cookies("password")
   tuser=request("gcr")
   myid=request("uid")
   cjpay=request("cj")
end if
%>
<%
if cjpay=500 then
   zjjb=200
   sjb=1
   fd=2000
   cfd=20
elseif cjpay=1000 then
   zjjb=450
   sjb=2
   fd=4000
   cfd=40
elseif cjpay=2000 then
   zjjb=960
   sjb=4
   fd=8000
   cfd=60
elseif cjpay=5000 then
   zjjb=2500
   sjb=10
   fd=20000
   cfd=80
elseif cjpay=10000 then
   zjjb=5000
   sjb=20
   fd=40000
   cfd=100
elseif cjpay=20000 then
   zjjb=11000
   sjb=40
   fd=80000
   cfd=150
elseif cjpay=50000 then
   zjjb=30000
   sjb=100
   fd=200000
   cfd=200
end if
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT * FROM sgxt where auid = '"&myid&"' or buid = '"&myid&"'"
rs1.open sql1,conn7,1,1
if not rs1.eof then
   response.write "<script language='javascript'>"
   response.write "alert('Account holders have been properly placed, can not be repeated, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
dim rs_bd,sql_bd
set rs_bd = Server.CreateObject("ADODB.Recordset")
sql_bd="select * from gcuser where username ='"&dquser&"' and password = '" &password&"'"
rs_bd.open sql_bd,conn2,2,3
if rs_bd.eof and rs_bd.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif cjpay>9000 and rs_bd("sybdb")<cjpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Account balance is less than the amount of currency declaration"&cjpay&"Unable to complete the account, please try again after recharge!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay<9000 and rs_bd("pay")<cjpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('A currency account balance is less than the amount"&cjpay&"Unable to complete the account, please try again after recharge!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay>9000 then
   rs_bd("sybdb")=rs_bd("sybdb")-cjpay
   rs_bd.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM bdbdate"
rs_d1.open sql_d1,conn1,2,3
rs_d1.addnew
rs_d1("zuser")=dquser
rs_d1("bz")="To-"&myid&"-Account-"&cjpay&""
rs_d1("jc")=cjpay
rs_d1("sybdb")=rs_bd("sybdb")
rs_d1("ljbdb")=rs_bd("ljbdb")
rs_d1.update
else
   rs_bd("pay")=rs_bd("pay")-cjpay
   rs_bd("txpay")=rs_bd("txpay")+cjpay
   rs_bd("fhpay")=rs_bd("fhpay")-cjpay
   rs_bd("vippay")=rs_bd("vippay")-cjpay
   rs_bd.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=dquser
rs_d1("regid")="To-"&myid&"-Account-"&cjpay&""
rs_d1("jc")=cjpay
rs_d1("pay")=rs_bd("pay")
rs_d1("jydb")=rs_bd("jydb")
rs_d1.update
end if
if rs_bd("vippay")<0 then
   rs_bd("vippay")=0
   rs_bd.update
end if
if rs_bd("fhpay")<0 then
   rs_bd("fhpay")=0
   rs_bd.update
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM gcuser where username = '"&myid&"'"
rs_my.open sql_my,conn2,2,3
if rs_my.eof and rs_my.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_my("sjb")=sjb '我的单数
   'rs_my("gdgc")=rs_my("gdgc")+zjgc
   rs_my("jydb")=rs_my("jydb")+zjjb
   rs_my("gmdate")=now()
   rs_my("bddate")=now()
   rs_my.update
   set rs_d2 = Server.CreateObject("ADODB.Recordset")
   sql_d2 = "SELECT * FROM datepay"
   rs_d2.open sql_d2,conn9,2,3
  rs_d2.addnew
  rs_d2("username")=myid
  rs_d2("regid")="Consumption-"&cjpay&"-Give away"&zjjb&"Gold-"&dquser&""
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
   response.write "alert('Contact person does not exist, can not be placed, please check whether correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("auid")<>"" and rs("buid")<>"" then'如果两边都不等于空也就是有人了
   response.write "<script language='javascript'>"
   response.write "alert('Position is occupied, please re-select!');"
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
if sjb>10 then
   jszfh=sjb*250
   jsnew=3
   fhbl=0.005
else
   jszfh=0
   jsnew=0
   fhbl=0
end if
'上面安置安置好后，在新表sgxtuser里增加我的一条记录
set rs_myid = Server.CreateObject("ADODB.Recordset")
sql_myid = "SELECT * FROM sgxt where username='"&myid&"'"
rs_myid.open sql_myid,conn7,2,3
If rs_myid.eof or rs_myid.bof Then
rs_myid.addnew
rs_myid("username")=myid
rs_myid("sjb")=sjb '我的单数
rs_myid("new")=jsnew
rs_myid("fhbl")=fhbl
rs_myid("zfh")=jszfh
rs_myid("fdpay")=fd'我的封顶奖金
rs_myid("cfd")=cfd
rs_myid.update
end if
%>
<%
set rs10=server.createobject("adodb.recordset")
sql10="select * from gcuser where username = '"&rs_my("up")&"'"
rs10.open sql10,conn2,2,3
  rs10("pay")=rs10("pay")+(0.1*cjpay)
  'rs10("jjpay")=rs10("jjpay")+(0.1*cjpay)
  rs10("vippay")=rs10("vippay")+(0.1*cjpay)
  rs10("cbpay")=rs10("cbpay")+(0.1*cjpay)
  rs10.Update
set rs_d4 = Server.CreateObject("ADODB.Recordset")
sql_d4 = "SELECT * FROM datepay"
rs_d4.open sql_d4,conn9,2,3
rs_d4.addnew
rs_d4("username")=rs_my("up")
rs_d4("regid")="User-"&myid&"Account"&cjpay&""
rs_d4("syjz")=0.1*cjpay
rs_d4("pay")=rs10("pay")
rs_d4("jydb")=rs10("jydb")
'rs_d4("newbz")=1
rs_d4.update
%>
<%
'''单个用户
x = 1
upuser=request("uid")
'Response.Write(upuser & ",")
zysjb = Conn7.Execute("select sjb from sgxt where username = '" & upuser & "'")(0)
cup(upuser)
'Response.Write("<hr />")

Function cup(user)
	strSQL = Replace("SELECT TOP 1 username,buid FROM sgxt WHERE auid = '{0}' OR buid = '{0}'", "{0}", user)
	SET rs_ks = Conn7.Execute(strSQL)
	If rs_ks.Eof Then
		'Response.Write(" Altogether " & x - 1 & " Layer")
		Exit Function
	End If
	If Not rs_ks.EOF Then
		zy = "left"
		'strDEL = "DELETE FROM zuo_mingxi WHERE tjuser = '" & rs_ks(0) & "' AND down = '" & upuser & "' AND count = " & x
		strADD = "INSERT INTO zuo_mingxi (tjuser,down,count,sjb) VALUES ('" & rs_ks(0) & "','" & upuser & "'," & x & "," & zysjb & ")"
		If user = rs_ks("buid") Then
		zy = "right"
		'strDEL = "DELETE FROM you_mingxi WHERE tjuser = '" & rs_ks(0) & "' AND down = '" & upuser & "' AND count = " & x
		strADD = "INSERT INTO you_mingxi (tjuser,down,count,sjb) VALUES ('" & rs_ks(0) & "','" & upuser & "'," & x & "," & zysjb & ")"
		End If
		'Conn7.Execute(strDEL)
		Conn7.Execute(strADD)
		'Response.Write(rs_ks(0) & "(" & zy & "),")
		newuser = rs_ks(0)
		x = x + 1
		'Response.Flush()
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
   rs_d3("dqzuo")=rs_tjzb("zuosjb")-sjb
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
   rs_d4("dqyou")=rs_tjyb("yousjb")-sjb
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
	rs_Calculate("zaq")=rs_Calculate("zaq")+sjb'myup的左边(A)总单数+
	rs_Calculate.update
if rs_Calculate("dqzuo")<rs_Calculate("cfd") then'对比
	zyzj=rs_Calculate("cfd")-rs_Calculate("dqzuo")
	if sjb+0>zyzj+0 then
	  zsjyzj=zyzj+0
	set rs_zksjb = Server.CreateObject("ADODB.Recordset")
    sql_zksjb = "SELECT * FROM bdbdate"
    rs_zksjb.open sql_zksjb,conn1,2,3
    rs_zksjb.addnew
    rs_zksjb("zuser")=rs_Calculate("username")
    rs_zksjb("sy")=abc
    rs_zksjb("jc")=abc
    rs_zksjb("sybdb")=abc
    rs_zksjb("ljbdb")=abc
    rs_zksjb("bz")="New "&myid&"("&sjb&")In("&rs_Calculate("count")&")(left)-"&sjb-zsjyzj&""
    rs_zksjb.update
	else
	  zsjyzj=sjb+0
	end if
	rs_Calculate("aq")=rs_Calculate("aq")+zsjyzj'myup的左边目前单数再+
	rs_Calculate.update
	else
	set rs_zbf = Server.CreateObject("ADODB.Recordset")
    sql_zbf = "SELECT * FROM bdbdate"
    rs_zbf.open sql_zbf,conn1,2,3
    rs_zbf.addnew
    rs_zbf("zuser")=rs_Calculate("username")
    rs_zbf("sy")=abc
    rs_zbf("jc")=abc
    rs_zbf("sybdb")=abc
    rs_zbf("ljbdb")=abc
    rs_zbf("bz")="New "&myid&"("&sjb&")In("&rs_Calculate("count")&")(left)-invalid"
    rs_zbf.update
end if
Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName Then
	rs_Calculate("zbq")=rs_Calculate("zbq")+sjb'myup的右边(B)总单数+
	rs_Calculate.update
if rs_Calculate("dqyou")<rs_Calculate("cfd") then'对比
	yyzj=rs_Calculate("cfd")-rs_Calculate("dqyou")
	if sjb+0>yyzj+0 then
	  ysjyzj=yyzj+0
	set rs_yksjb = Server.CreateObject("ADODB.Recordset")
    sql_yksjb = "SELECT * FROM bdbdate"
    rs_yksjb.open sql_yksjb,conn1,2,3
    rs_yksjb.addnew
    rs_yksjb("zuser")=rs_Calculate("username")
    rs_yksjb("sy")=abc
    rs_yksjb("jc")=abc
    rs_yksjb("sybdb")=abc
    rs_yksjb("ljbdb")=abc
    rs_yksjb("bz")="New "&myid&"("&sjb&")In("&rs_Calculate("count")&")(right)-"&sjb-ysjyzj&""
    rs_yksjb.update
	else
	  ysjyzj=sjb+0
	end if
	rs_Calculate("bq")=rs_Calculate("bq")+ysjyzj'myup的右边目前单数再+
	rs_Calculate.update
	else
	set rs_ybf = Server.CreateObject("ADODB.Recordset")
    sql_ybf = "SELECT * FROM bdbdate"
    rs_ybf.open sql_ybf,conn1,2,3
    rs_ybf.addnew
    rs_ybf("zuser")=rs_Calculate("username")
    rs_ybf("sy")=abc
    rs_ybf("jc")=abc
    rs_ybf("sybdb")=abc
    rs_ybf("ljbdb")=abc
    rs_ybf("bz")="New "&myid&"("&sjb&")In("&rs_Calculate("count")&")(right)-invalid"
    rs_ybf.update
end if
Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'错误的逻辑
	End if
 
End Function
%>
<%
conn7.Execute("delete * from zuo_biao")
conn7.Execute("delete * from you_biao")
response.Write "<script language=javascript>alert('Upgraded dual-zone player successfully!');location.replace('sgks01.asp?up="&dquser&"');</script>"
%>