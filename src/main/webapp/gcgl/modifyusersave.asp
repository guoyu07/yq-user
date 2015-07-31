<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<%
regid=trim(request("regid"))
%>
<%
set rs0=server.CreateObject("adodb.recordset")
sql0="select * from cfuser where username = '"&regid&"'"
rs0.open sql0,conn2,2,3
rs0("password3")=trim(request("password3"))
rs0("card")=trim(request("card"))
rs0("bank")=trim(request("bank"))
rs0("name")=trim(request("name"))
rs0("call")=trim(request("call"))
rs0("email")=trim(request("email"))
rs0("qq")=trim(request("qq"))
rs0("cbpay")=trim(request("cbpay"))
rs0("pay")=trim(request("pay"))
rs0("jb")=trim(request("jb"))
rs0("txpay")=trim(request("txpay"))
rs0("jydb")=trim(request("jydb"))
rs0("gdgc")=trim(request("gdgc"))
rs0("jyg")=trim(request("jyg"))
'rs0("tjpay")=trim(request("tjpay"))
rs0.update
if trim(request("password"))<>"" then
dim pa,pa1
pa=request.Form("password")
password=LCase(pa)
rs0("password")=md5(password)
rs0.update
end if
response.Write "<script language=javascript>alert('会员资料修改成功！');history.go(-1);</script>"
response.end
%>