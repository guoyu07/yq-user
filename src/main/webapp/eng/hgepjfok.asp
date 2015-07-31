<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Please login!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jfsl=request("jfsl")
   epsl=request("epsl")
   gwuser=request("gwuser")
   pa3=request("pa3")
   gwno=request("gwno")
   gwid=request("gwid")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
syhg=rs("jjsy")*1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Please login!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, this order is not the current logged-on user names submitted, please log in again, thank you!');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>" 
   response.end
elseif rs("password3")<>pa3 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you two password is incorrect, please re-enter!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif syhg+0<10 or syhg+0=0 or epsl+0>syhg then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, spending account balance is insufficient, temporarily unable to redeem, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jyg")+0<1 or rs("jyg")+0=0 or jfsl+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, lack of integration, temporarily unable to redeem, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-(jfsl+0)
   rs("jjsy")=rs("jjsy")-(epsl+0)
   rs("sytx")=rs("sytx")+(epsl+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("mcsl")=jfsl
rs_d1("sysl")=rs("jyg")
rs_d1("abdate")=abcd
rs_d1("bz")="Redemption-"&gwno
rs_d1("jy")=1
rs_d1("cgdate")=Now()
rs_d1.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM gcfh"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("userid")=rs("username")
rs_d2("syfh")="-"&epsl
rs_d2("ljfhtj")=rs("jjsy")
rs_d2("bz")="Redemption-"&gwno
rs_d2("sf")=1
rs_d2.update
end if
%>
<%
response.redirect"http://jf.zgyce.com/admin/cfhg_pay.asp?order_info_id="&gwid&""
%>