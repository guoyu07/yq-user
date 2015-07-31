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
   djsl=request("ybsl")
   sjuser=request("sjuser")
   gwno=request("gwno")
   gwid=request("gwid")
end if
%>
<%
ybsl=djsl*0.98
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&sjuser&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Businesses username does not exist, please try again after checking!');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   rs("cbpay")=rs("cbpay")+(ybsl+0)
   rs("pay")=rs("pay")+(ybsl+0)
   rs("vippay")=rs("vippay")+(ybsl+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=sjuser
rs_d1("syjz")=ybsl
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("regid")="Commodity Trading-"&gwno
rs_d1("newbz")=5
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
response.redirect"http://yb.zgyce.com/admin/ybhg_Modi.asp?gwbh="&gwid&""
%>