<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="120"
   ygid=request.cookies("regid")
   password=request.cookies("password")
   cjpay=request("cj")
   userid=request("uid")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&userid&"'and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof or userid<>ygid then
   response.write "<script language='javascript'>"
   response.write "alert('该用户名不存在，请检查输入是否正确！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
end if
%>
<%
set rs10=server.createobject("adodb.recordset")
  sql10="select * from gcuser where username = '"&rs("up")&"'"
  rs10.open sql10,conn2,2,3
  rs10("pay")=rs10("pay")+(0.03*cjpay)
  rs10("cbpay")=rs10("cbpay")+(0.03*cjpay)
  rs10.Update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("up")
rs_d1("regid")="用户一"&userid&"激活金币卡"&cjpay&""  
rs_d1("syjz")=0.03*cjpay
rs_d1("pay")=rs10("pay")
rs_d1("jydb")=rs10("jydb")
rs_d1.update
%>
<%
rs("jydb")=cjpay+rs("jydb")
'rs("cjtj")=rs("cjtj")+cjpay
rs.update
set rs_d4 = Server.CreateObject("ADODB.Recordset")
sql_d4 = "SELECT * FROM datepay"
rs_d4.open sql_d4,conn9,2,3
rs_d4.addnew
rs_d4("username")=userid
rs_d4("regid")="激活金币卡"&cjpay&""
rs_d4("jyjz")=cjpay
rs_d4("pay")=rs("pay")
rs_d4("jydb")=rs("jydb")
rs_d4.update
%>
<%
response.cookies("lsyh")=""
response.Write "<script language=javascript>alert('恭喜激活金币卡成功。。。！');location.href='vipgo.asp'</script>"
%>