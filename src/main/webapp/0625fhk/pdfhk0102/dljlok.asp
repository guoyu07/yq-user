<%
if request.cookies("regid")="" or request.cookies("lsyh")="" then
   session.timeout=10
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请重试！');"
   response.write "window.location.replace('gmjl.asp');" 
   response.write "</script>" 
   response.end
else
   regid=request.cookies("regid")
end if
%>
<!--#include file="../shopmfh.asp"-->
<% 
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from cfuser where username ='"&regid&"'"
rs0.open sql0,conn1,2,3
   s3=rs0("addshi")
   q4=rs0("addqu")
%>
<%
user=request("id")
dlgm=request.cookies("dlgm")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from cfuser where username ='"&user&"'"
rs.open sql,conn1,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该用户不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("dlgmjl")<0 or  rs("dlgmjl")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('该代理商已没有库存的实物卡了！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
rs("dlgmjl")=rs("dlgmjl")-dlgm
rs.update
rs0("gmtj")=rs0("gmtj")+dlgm
rs0("swkjl")=rs0("swkjl")+dlgm
rs0("gmdate")=now()
rs0.update
%>
<%
set rs10=server.createobject("adodb.recordset")
  sql10="select * from cfuser where username = '"&rs0("up")&"'"
  rs10.open sql10,conn1,2,3
  rs10("pay")=rs10("pay")+(1*dlgm)
  rs10("cbpay")=rs10("cbpay")+(1*dlgm)
  rs10.Update
%>
<%
response.redirect"dljltq.asp?id="&user&""
%>