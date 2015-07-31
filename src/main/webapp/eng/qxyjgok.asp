<!--#include file="../ct0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Temporarily unable to sell!');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("qxid")
end if
%>
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where id ="&jybh&""
rs_my.open sql_my,conn2,2,3
mypay=rs_my("jypay")
pay=rs_my("pay")
mcsl=rs_my("mcsl")
if rs_my("jy")<>2 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('Illegal operation, please check and try again!');location.href='sggpjy.asp?jyid="&username&"'</script>"
   response.end
end if
%>
<%
rs("jyg")=rs("jyg")+mcsl
rs("stopjyg")=0
rs.update
rs_my("bz")="Caesar has a single"
rs_my("cgdate")=Now()
rs_my("jy")=1
rs_my.update
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("mysl")=mcsl
rs_d1("sysl")=rs("jyg")
rs_d1("bz")="Caesar single success"
rs_d1("cgdate")=rs_my("cgdate")
rs_d1("jy")=1
rs_d1.update
%>
<%
response.Write "<script language=javascript>alert('Caesar single successful!');location.replace('sggpjy.asp?jyid="&username&"');</script>"
%>