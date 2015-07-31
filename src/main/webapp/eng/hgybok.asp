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
   ybsl=request("ybsl")
   ybfw=request("ybfw")
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
elseif rs("pay")+0<1 or rs("pay")+0=0 or ybsl+0>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, less than one currency "&ybsl&", Temporarily unable to redeem, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("pay")=rs("pay")-(ybsl+0)
   rs("vippay")=rs("vippay")-(ybsl+0)
   rs("fhpay")=rs("fhpay")-(ybsl+0)
   rs("txpay")=rs("txpay")+(ybsl+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("jc")=ybsl
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("regid")="Redemption-"&gwno
rs_d1("newbz")=4
rs_d1.update
end if
%>
<%
if rs("vippay")<0 then
   rs("vippay")=0
   rs.update
end if
if rs("fhpay")<0 then
   rs("fhpay")=0
   rs.update
end if
response.redirect"http://yb.zgyce.com/admin/ybhg_pay.asp?gwid="&gwid&"&CheckStates=5"
%>