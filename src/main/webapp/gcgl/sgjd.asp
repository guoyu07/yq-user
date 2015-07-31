<!--#include file="../ct0618000.asp"-->
<!--#include file="../dt0618000.asp"-->
<!--#include file="../mq0618000.asp"-->
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
rs0.open sql0,conn7,2,3
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
Set rs_zuo = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM zuo_mingxi WHERE down='"&myid&"'"
rs_zuo.Open StrSQL, Conn7,2,3
While Not rs_zuo.EOF
rs_zuo("sjb")=rs_zuo("sjb")+jsjb
rs_zuo.MoveNext
Wend
rs_zuo.UpdateBatch
%>
<%
Set rs_you = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM you_mingxi WHERE down='"&myid&"'"
rs_you.Open StrSQL, Conn7,2,3
While Not rs_you.EOF
rs_you("sjb")=rs_you("sjb")+jsjb
rs_you.MoveNext
Wend
rs_you.UpdateBatch
%>
<%
response.Write "<script language=javascript>alert('恭喜开通成功，奖金业绩已更新。。。！');location.href='searchg0701.asp'</script>"
'response.redirect "searchg0701.asp"
%>