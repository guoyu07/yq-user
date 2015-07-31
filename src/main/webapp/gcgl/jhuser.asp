<!--#include file="../ct0618.asp"-->
<%
'开始找空位安置myid
myid=request("my")
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&myid&"'"
rs.open sql,conn2,1,1
%>
<%
'搜索新表最后一个用户名
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT top 1 * FROM sgxt order by id desc"
rs0.open sql0,conn2,1,1
%>
<%
'开始搜索已进入双轨系统的上级
set rs10=server.createobject("adodb.recordset")
  sql10="select * from gcuser where username = '"&rs("up")&"'"
  rs10.open sql10,conn2,1,1
if rs10("sjb")>0 then
   myup=rs10("username")
end if
%>
<%
set rs11=server.createobject("adodb.recordset")
  sql11="select * from gcuser where username = '"&rs10("up")&"'"
  rs11.open sql11,conn2,1,1
if rs11("sjb")>0 then
   myup=rs11("username")
end if
%>
<%
set rs12=server.createobject("adodb.recordset")
  sql12="select * from gcuser where username = '"&rs11("up")&"'"
  rs12.open sql12,conn2,1,1
if rs12("sjb")>0 then
   myup=rs12("username")
end if
%>
<%
set rs13=server.createobject("adodb.recordset")
  sql13="select * from gcuser where username = '"&rs12("up")&"'"
  rs13.open sql13,conn2,1,1
if rs13("sjb")>0 then
   myup=rs13("username")
end if
%>
<%
'最高到5级，如果还没有，那就取进入双轨最后一个，并放他下面
set rs14=server.createobject("adodb.recordset")
  sql14="select * from gcuser where username = '"&rs13("up")&"'"
  rs14.open sql14,conn2,1,1
if rs14("sjb")>0 then
   myup=rs14("username")
else
   myup=rs0("username")
end if
%>
<%=rs0("username")%>
<%=rs10("username")%>
<%=rs11("username")%>
<%=rs12("username")%>
<%=rs13("username")%>
<%=rs14("username")%>