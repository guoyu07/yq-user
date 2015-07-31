<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "top.location.replace('../index.asp');"
   response.write "</script>"
   response.end
else
   regid=request.cookies("regid")
   password=request.cookies("password")
   temuser=request("gguser")  
end if
dim sql 
dim rs 
sql="select * from gcuser where username = '" & regid & "'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
%>
<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from gcuser where username = '"&temuser&"'"
rs1.open sql1,conn2,1,1
if not rs1.eof then
response.write "<script language='javascript'>"
response.write "alert('This username is already in use! Replace!');"
response.write "history.go(-1);"
response.write "</script>"
response.end
end if
%>
<%
set rs_links = Server.CreateObject("ADODB.Recordset")
sql_links = "SELECT * FROM gcuser"
rs_links.open sql_links,conn2,2,3
rs_links.addnew
rs_links("username")=temuser
rs_links("password")=rs("password")
rs_links("password3")=rs("password3")
rs_links("name")=rs("name")
rs_links("bank")=rs("bank")
rs_links("card")=rs("card")
rs_links("call")=rs("call")
rs_links("qq")=rs("qq")
rs_links("up")=regid
rs_links("userid")=rs("userid")
rs_links("addsheng")=rs("addsheng")
rs_links("addshi")=rs("addshi")
rs_links("addqu")=rs("addqu")
rs_links("dqu")=rs("dqu")
rs_links("add9dqu")=rs("add9dqu")
rs_links.update
%>
<%
sql_tx="select * from txifok where username = '"&temuser&"'"
Set rs_tx= Server.CreateObject("ADODB.Recordset") 
rs_tx.open sql_tx,conn9,2,3
if rs_tx.eof and rs_tx.bof then
  rs_tx.addnew
  rs_tx("username")=rs_links("username")
  rs_tx("up")=regid
  rs_tx("password3")=rs_links("password3")
  rs_tx("name")=rs_links("name")
  rs_tx("call")=rs_links("call")
  rs_tx.update
end if
%>
<%
response.Write "<script language=javascript>alert('Congratulations with the name of the user registration is successful, the next step of the operation!');location.href='tgdown.asp'</script>"
%>