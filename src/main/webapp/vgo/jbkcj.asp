<!--#include file=../zqcjimg.asp-->
<%
   response.cookies("jbkcj")="20120625"
if request.cookies("jbkcj")="" then
   response.write "<script language='javascript'>"
   response.write "alert('ÕËºÅ»òÃÜÂë´íÎó£¬ÇëÖØĞÂµÇÂ¼£¡');"
   response.write "window.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   jbkgc=request("jbk")
   pdid=request("pdid")
   gmuser=request("gmuser")
   gmdate=request("gmdate")
   cjpay=request("mj")*10
end if
%>
<%
if cjpay<1000 then
   zjgc=0
elseif cjpay>999 and cjpay<2000 then
   zjgc=cjpay*0.01
elseif cjpay>1999 and cjpay<3000 then
   zjgc=cjpay*0.02
elseif cjpay>2999 and cjpay<4000 then
   zjgc=cjpay*0.03
elseif cjpay>3999 and cjpay<5000 then
   zjgc=cjpay*0.04
elseif cjpay>4999 and cjpay<6000 then
   zjgc=cjpay*0.05
elseif cjpay>5999 and cjpay<7000 then
   zjgc=cjpay*0.06
elseif cjpay>6999 and cjpay<8000 then
   zjgc=cjpay*0.07
elseif cjpay>7999 and cjpay<9000 then
   zjgc=cjpay*0.08
elseif cjpay>8999 and cjpay<10000 then
   zjgc=cjpay*0.09
elseif cjpay>9999 then
   zjgc=cjpay*0.1
end if
%>
<%
dim rs0,sql0
set rs0= Server.CreateObject("ADODB.Recordset")
sql0="select * from datecj where cjuser ='"&jbkgc&"' order by id desc"
rs0.open sql0,conn1,1,1
if not rs0.eof then
cjtj=rs0("ljcj")
end if
%>
<%
dim rs,sql
set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datecj"
rs.open sql,conn1,2,3
rs.addnew
rs("cjuser")=jbkgc
rs("dqcj")=cjpay
rs("ljcj")=cjtj
'rs("ljcj")=cjtj+cjpay
rs("cjfs")=pdid
'rs("gc")=zjgc
rs("cjdate")=gmdate
rs("bz")=gmuser
rs("ip")=Request.ServerVariables("REMOTE_ADDR")
rs.update
%>
<%
response.cookies("jbkcj")=""
response.cookies("jbkcj")=""
response.redirect "/vip/vipgwly.asp?uid="&jbkgc&"&zj="&zjgc&"&cj="&cjpay&""
%>