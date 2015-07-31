<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="cfvip.asp"-->
<% Server.ScriptTimeout=999 %>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   dquser=request.cookies("regid")
   password=request.cookies("password")
   pab1j=request("pab1j")
   pa5=LCase(pab1j)
   pa2j=request("pab2j")
   userce=LCase(request("ceid"))
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
sql_zuo="select * from zuo_mingxi where down = '" &myup&"'"
set rs_zuo =conn7.execute(sql_zuo)
if not rs_zuo.eof then
   response.write "<script language='javascript'>"
   response.write "alert('开户人已安置好，不能重复，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
sql_you="select * from you_mingxi where down = '" &myup&"'"
set rs_you =conn7.execute(sql_you)
if not rs_you.eof then
   response.write "<script language='javascript'>"
   response.write "alert('开户人已安置好，不能重复，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
sql1 = "SELECT * FROM sgxt where auid = '"&myid&"' or buid = '"&myid&"'"
set rs1 = conn7.execute(sql1)
if not rs1.eof then
   response.write "<script language='javascript'>"
   response.write "alert('开户人已安置好，不能重复，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
Rs1.close
Set Rs1=Nothing
%>
<%
dim rs_bd,sql_bd
set rs_bd = Server.CreateObject("ADODB.Recordset")
sql_bd="select * from gcuser where username ='"&dquser&"' and password = '" &password&"'"
rs_bd.open sql_bd,conn2,2,3
if rs_bd.eof and rs_bd.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs_bd("password")<>md5(pa5) then
   response.write "<script language='javascript'>"
   response.write "alert('登录密码错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end   
elseif rs_bd("password3")<>pa2j then
   response.write "<script language='javascript'>"
   response.write "alert('二级密码错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay<9000 and rs_bd("vipsq")<>userce then
   response.write "<script language='javascript'>"
   response.write "alert('验证码错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay>9000 and rs_bd("sybdb")<cjpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('报单币余额小于开户金额"&cjpay&"，无法完成开户，请充值后再试！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay<9000 and rs_bd("pay")<cjpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('一币余额小于开户金额"&cjpay&"，无法完成开户，请充值后再试！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
if cjpay>9000 then
   rs_bd("sybdb")=rs_bd("sybdb")-cjpay
   rs_bd.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM bdbdate"
rs_d1.open sql_d1,conn1,1,3
rs_d1.addnew
rs_d1("zuser")=dquser
rs_d1("bz")="给"&myid&"开户"&cjpay&""
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
rs_d1.open sql_d1,conn9,1,3
rs_d1.addnew
rs_d1("username")=dquser
rs_d1("regid")="给"&myid&"开户"&cjpay&""
rs_d1("jc")=cjpay
rs_d1("pay")=rs_bd("pay")
rs_d1("jydb")=rs_bd("jydb")
rs_d1.update
end if
Rs_bd.close
Set Rs_bd=Nothing
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM gcuser where username = '"&myid&"'"
rs_my.open sql_my,conn2,2,3
if rs_my.eof and rs_my.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
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
   mypay=rs_my("pay")
   myjydb=rs_my("jydb")
   myup=rs_my("up")
   Rs_my.close
   Set Rs_my=Nothing
   set rs_d2 = Server.CreateObject("ADODB.Recordset")
   sql_d2 = "SELECT * FROM datepay"
   rs_d2.open sql_d2,conn9,1,3
  rs_d2.addnew
  rs_d2("username")=myid
  rs_d2("regid")="消费"&cjpay&"送"&zjjb&"金币-"&dquser&""
  rs_d2("jyjz")=zjjb
  rs_d2("pay")=mypay
  rs_d2("jydb")=myjydb
  rs_d2.update
  rs_d2.close
  Set rs_d2=Nothing
end if
%>
<%
'开始在新表sgxtuser搜索上级
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxt where username = '"&tuser&"'"
rs.open sql,conn7,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('接点人不存在，没法放置，请检查是否正确！');"
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
Rs.close
Set Rs=Nothing
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
rs_myid.open sql_myid,conn7,1,3
If rs_myid.eof or rs_myid.bof Then
rs_myid.addnew
rs_myid("username")=myid
rs_myid("sjb")=sjb '我的单数
rs_myid("new")=jsnew
'rs_myid("fhbl")=fhbl
'rs_myid("zfh")=jszfh
rs_myid("fdpay")=fd'我的封顶奖金
rs_myid("cfd")=cfd
rs_myid.update
end if
Rs_myid.close
Set Rs_myid=Nothing
%>
<%
set rs10=server.createobject("adodb.recordset")
sql10="select * from gcuser where username = '"&myup&"'"
rs10.open sql10,conn2,2,3
  rs10("pay")=rs10("pay")+(0.1*cjpay)
  rs10("jbpay")=rs10("jbpay")+(0.1*cjpay)
  rs10("dlpay")=rs10("dlpay")+(0.1*cjpay)
  rs10("cbpay")=rs10("cbpay")+(0.1*cjpay)
  rs10.Update
set rs_d4 = Server.CreateObject("ADODB.Recordset")
sql_d4 = "SELECT * FROM datepay"
rs_d4.open sql_d4,conn9,1,3
rs_d4.addnew
rs_d4("username")=myup
rs_d4("regid")="用户一"&myid&"开户"&cjpay&""
rs_d4("syjz")=0.1*cjpay
rs_d4("pay")=rs10("pay")
rs_d4("jydb")=rs10("jydb")
rs_d4("newbz")=9
rs_d4.update
Rs10.close
Set Rs10=Nothing
rs_d4.close
Set rs_d4=Nothing
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
		'Response.Write(" 共 " & x - 1 & " 层")
		Exit Function
	End If
	If Not rs_ks.EOF Then
		zy = "左"
		'strDEL = "DELETE FROM zuo_mingxi WHERE tjuser = '" & rs_ks(0) & "' AND down = '" & upuser & "' AND count = " & x
		strADD = "INSERT INTO zuo_mingxi (tjuser,down,count,sjb) VALUES ('" & rs_ks(0) & "','" & upuser & "'," & x & "," & zysjb & ")"
		If user = rs_ks("buid") Then
		zy = "右"
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
StrSQL = "SELECT * FROM zuo_mingxi WHERE down='"&myid&"' order by id"
set rs_tjzuo = conn7.execute(StrSQL)
While Not rs_tjzuo.EOF
  StrSQL = "SELECT sum(sjb) as zuosjb FROM zuo_mingxi WHERE tjuser='"&rs_tjzuo("tjuser")&"' and count="&rs_tjzuo("count")&""
  set rs_tjzb = conn7.execute(StrSQL)
  While Not rs_tjzb.EOF
If rs_tjzb("zuosjb")>0 then
   sjtjzb=rs_tjzb("zuosjb")
else
   sjtjzb=0
End if
   set rs_d3 = Server.CreateObject("ADODB.Recordset")
   sql_d3 = "SELECT * FROM sgxt WHERE username='"&rs_tjzuo("tjuser")&"'"
   rs_d3.open sql_d3,Conn7,2,3
IF rs_tjzuo("count")=16 Then
   rs_d3("16z")=sjtjzb
elseif rs_tjzuo("count")=15 then
   rs_d3("15z")=sjtjzb
elseif rs_tjzuo("count")=14 then
   rs_d3("14z")=sjtjzb
elseif rs_tjzuo("count")=13 then
   rs_d3("13z")=sjtjzb
elseif rs_tjzuo("count")=12 then
   rs_d3("12z")=sjtjzb 
elseif rs_tjzuo("count")=11 then
   rs_d3("11z")=sjtjzb
elseif rs_tjzuo("count")=10 then
   rs_d3("10z")=sjtjzb
elseif rs_tjzuo("count")=9 then
   rs_d3("9z")=sjtjzb
elseif rs_tjzuo("count")=8 then
   rs_d3("8z")=sjtjzb
elseif rs_tjzuo("count")=7 then
   rs_d3("7z")=sjtjzb
elseif rs_tjzuo("count")=6 then
   rs_d3("6z")=sjtjzb
elseif rs_tjzuo("count")=5 then
   rs_d3("5z")=sjtjzb
elseif rs_tjzuo("count")=4 then
   rs_d3("4z")=sjtjzb
elseif rs_tjzuo("count")=3 then
   rs_d3("3z")=sjtjzb
elseif rs_tjzuo("count")=2 then
   rs_d3("2z")=sjtjzb
elseif rs_tjzuo("count")=1 then
   rs_d3("1z")=sjtjzb
End if
   rs_d3("dqzuo")=sjtjzb*1-sjb+0
   rs_d3("count")=rs_tjzuo("count")
   rs_d3.update
   rs_tjzb.MoveNext
   Wend
rs_tjzuo.MoveNext
Wend
Rs_tjzuo.close
Set Rs_tjzuo=Nothing
%>
<%
StrSQL = "SELECT * FROM you_mingxi WHERE down='"&myid&"' order by id"
set rs_tjyou = conn7.execute(StrSQL)
While Not rs_tjyou.EOF
  StrSQL = "SELECT sum(sjb) as yousjb FROM you_mingxi WHERE tjuser='"&rs_tjyou("tjuser")&"' and count="&rs_tjyou("count")&""
  set rs_tjyb = conn7.execute(StrSQL)
  While Not rs_tjyb.EOF
If rs_tjyb("yousjb")>0 then
   sjtjyb=rs_tjyb("yousjb")
else
   sjtjyb=0
End if
   set rs_d4 = Server.CreateObject("ADODB.Recordset")
   sql_d4 = "SELECT * FROM sgxt WHERE username='"&rs_tjyou("tjuser")&"'"
   rs_d4.open sql_d4,Conn7,2,3
IF rs_tjyou("count")=16 Then
   rs_d4("16y")=sjtjyb
elseif rs_tjyou("count")=15 then
   rs_d4("15y")=sjtjyb
elseif rs_tjyou("count")=14 then
   rs_d4("14y")=sjtjyb
elseif rs_tjyou("count")=13 then
   rs_d4("13y")=sjtjyb
elseif rs_tjyou("count")=12 then
   rs_d4("12y")=sjtjyb
elseif rs_tjyou("count")=11 then
   rs_d4("11y")=sjtjyb
elseif rs_tjyou("count")=10 then
   rs_d4("10y")=sjtjyb
elseif rs_tjyou("count")=9 then
   rs_d4("9y")=sjtjyb
elseif rs_tjyou("count")=8 then
   rs_d4("8y")=sjtjyb
elseif rs_tjyou("count")=7 then
   rs_d4("7y")=sjtjyb
elseif rs_tjyou("count")=6 then
   rs_d4("6y")=sjtjyb
elseif rs_tjyou("count")=5 then
   rs_d4("5y")=sjtjyb
elseif rs_tjyou("count")=4 then
   rs_d4("4y")=sjtjyb
elseif rs_tjyou("count")=3 then
   rs_d4("3y")=sjtjyb
elseif rs_tjyou("count")=2 then
   rs_d4("2y")=sjtjyb
elseif rs_tjyou("count")=1 then
   rs_d4("1y")=sjtjyb
End if
   rs_d4("dqyou")=sjtjyb*1-sjb+0
   rs_d4("count")=rs_tjyou("count")
   rs_d4.update
   rs_tjyb.MoveNext
   Wend
rs_tjyou.MoveNext
Wend
Rs_tjyou.close
Set Rs_tjyou=Nothing
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
	rs_Calculate("aq")=rs_Calculate("aq")+zsjyzj'myup的左边目前单数再+
	rs_Calculate.update
	set rs_zksjb = Server.CreateObject("ADODB.Recordset")
    sql_zksjb = "SELECT * FROM bdbdate"
    rs_zksjb.open sql_zksjb,conn1,1,3
    rs_zksjb.addnew
    rs_zksjb("zuser")=rs_Calculate("username")
    rs_zksjb("sy")=abc
    rs_zksjb("jc")=abc
    rs_zksjb("sybdb")=abc
    rs_zksjb("ljbdb")=abc
    rs_zksjb("zaq")=rs_Calculate("zaq")
    rs_zksjb("zbq")=rs_Calculate("zbq")
    rs_zksjb("aq")=rs_Calculate("aq")
    rs_zksjb("bq")=rs_Calculate("bq")
    rs_zksjb("bz")="新单"&myid&"("&sjb&")在第"&rs_Calculate("count")&"层(左边)层封顶超出-"&sjb-zsjyzj&""
    rs_zksjb.update
  else
	  zsjyzj=sjb+0
	rs_Calculate("aq")=rs_Calculate("aq")+zsjyzj'myup的左边目前单数再+
	rs_Calculate.update	
	set rs_zbj = Server.CreateObject("ADODB.Recordset")
    sql_zbj = "SELECT * FROM bdbdate"
    rs_zbj.open sql_zbj,conn1,1,3
    rs_zbj.addnew
    rs_zbj("zuser")=rs_Calculate("username")
    rs_zbj("sy")=abc
    rs_zbj("jc")=abc
    rs_zbj("sybdb")=abc
    rs_zbj("ljbdb")=abc
    rs_zbj("zaq")=rs_Calculate("zaq")
    rs_zbj("zbq")=rs_Calculate("zbq")
    rs_zbj("aq")=rs_Calculate("aq")
    rs_zbj("bq")=rs_Calculate("bq")
    rs_zbj("bz")="新单"&myid&"("&sjb&")在第"&rs_Calculate("count")&"层(左边)增加可结算-"&zsjyzj&""
    rs_zbj.update
  end if       
else
	set rs_zbf = Server.CreateObject("ADODB.Recordset")
    sql_zbf = "SELECT * FROM bdbdate"
    rs_zbf.open sql_zbf,conn1,1,3
    rs_zbf.addnew
    rs_zbf("zuser")=rs_Calculate("username")
    rs_zbf("sy")=abc
    rs_zbf("jc")=abc
    rs_zbf("sybdb")=abc
    rs_zbf("ljbdb")=abc
    rs_zbf("zaq")=rs_Calculate("zaq")
    rs_zbf("zbq")=rs_Calculate("zbq")
    rs_zbf("aq")=rs_Calculate("aq")
    rs_zbf("bq")=rs_Calculate("bq")
    rs_zbf("bz")="新单"&myid&"("&sjb&")在第"&rs_Calculate("count")&"层(左边)已层封顶-无效单"
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
	rs_Calculate("bq")=rs_Calculate("bq")+ysjyzj'myup的右边目前单数再+
	rs_Calculate.update
	set rs_yksjb = Server.CreateObject("ADODB.Recordset")
    sql_yksjb = "SELECT * FROM bdbdate"
    rs_yksjb.open sql_yksjb,conn1,1,3
    rs_yksjb.addnew
    rs_yksjb("zuser")=rs_Calculate("username")
    rs_yksjb("sy")=abc
    rs_yksjb("jc")=abc
    rs_yksjb("sybdb")=abc
    rs_yksjb("ljbdb")=abc
    rs_yksjb("zaq")=rs_Calculate("zaq")
    rs_yksjb("zbq")=rs_Calculate("zbq")
    rs_yksjb("aq")=rs_Calculate("aq")
    rs_yksjb("bq")=rs_Calculate("bq")
    rs_yksjb("bz")="新单"&myid&"("&sjb&")在第"&rs_Calculate("count")&"层(右边)层封顶超出-"&sjb-ysjyzj&""
    rs_yksjb.update
  else
	  ysjyzj=sjb+0
	rs_Calculate("bq")=rs_Calculate("bq")+ysjyzj'myup的右边目前单数再+
	rs_Calculate.update
	set rs_ybj = Server.CreateObject("ADODB.Recordset")
    sql_ybj = "SELECT * FROM bdbdate"
    rs_ybj.open sql_ybj,conn1,1,3
    rs_ybj.addnew
    rs_ybj("zuser")=rs_Calculate("username")
    rs_ybj("sy")=abc
    rs_ybj("jc")=abc
    rs_ybj("sybdb")=abc
    rs_ybj("ljbdb")=abc
    rs_ybj("zaq")=rs_Calculate("zaq")
    rs_ybj("zbq")=rs_Calculate("zbq")
    rs_ybj("aq")=rs_Calculate("aq")
    rs_ybj("bq")=rs_Calculate("bq")
    rs_ybj("bz")="新单"&myid&"("&sjb&")在第"&rs_Calculate("count")&"层(右边)增加可结算-"&ysjyzj&""
    rs_ybj.update
  end if
else
	set rs_ybf = Server.CreateObject("ADODB.Recordset")
    sql_ybf = "SELECT * FROM bdbdate"
    rs_ybf.open sql_ybf,conn1,1,3
    rs_ybf.addnew
    rs_ybf("zuser")=rs_Calculate("username")
    rs_ybf("sy")=abc
    rs_ybf("jc")=abc
    rs_ybf("sybdb")=abc
    rs_ybf("ljbdb")=abc
    rs_ybf("zaq")=rs_Calculate("zaq")
    rs_ybf("zbq")=rs_Calculate("zbq")
    rs_ybf("aq")=rs_Calculate("aq")
    rs_ybf("bq")=rs_Calculate("bq")
    rs_ybf("bz")="新单"&myid&"("&sjb&")在第"&rs_Calculate("count")&"层(右边)已层封顶-无效单"
    rs_ybf.update
end if
Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'错误的逻辑
	End if

End Function
%>
<%
conn1.close
set conn1=nothing
conn2.close
set conn2=nothing
conn7.close
set conn7=nothing
conn9.close
set conn9=nothing
response.redirect "sgks01.asp?up="&tuser&"&lb=1"
'response.Write "<script language=javascript>alert('程序正在执行中。。请稍候！');location.replace('bdreg3.asp?uid="&myid&"&bsjb="&sjb&"');</script>"
%>