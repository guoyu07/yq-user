<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="../zqcjimgaa.asp"-->
<%
'开始把myid放置
myid=request("my")
sjb=request("bsjb")
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
Response.write "<center>"
Response.write "重要提示：系统正在核算中...请停止其它操作，更不要关闭本页！"
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
    rs_zksjb.open sql_zksjb,conn1,2,3
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
    rs_zbj.open sql_zbj,conn1,2,3
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
    rs_zbf.open sql_zbf,conn1,2,3
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
    rs_yksjb.open sql_yksjb,conn1,2,3
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
    rs_ybj.open sql_ybj,conn1,2,3
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
    rs_ybf.open sql_ybf,conn1,2,3
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
response.Write "<script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='searchg0701.asp'</script>"
'response.redirect "searchg0701.asp"
%>