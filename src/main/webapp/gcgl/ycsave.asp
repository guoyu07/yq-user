<!--#include file="../ct0618.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<%
userid=trim(request("userid"))
%>
<%
set rs0=server.CreateObject("adodb.recordset")
sql0="select * from gcuser where username = '"&userid&"'"
rs0.open sql0,conn2,2,3
rs0("password3")=trim(request("password3"))
rs0("card")=trim(request("card"))
rs0("bank")=trim(request("bank"))
rs0("name")=trim(request("name"))
rs0("call")=trim(request("call"))
rs0("email")=trim(request("email"))
rs0("qq")=trim(request("qq"))
rs0("userid")=trim(request("userid2"))
rs0("cbpay")=trim(request("cbpay"))
rs0("pay")=trim(request("pay"))
rs0("txpay")=trim(request("txpay"))
rs0("regtime")=trim(request("regtime"))
rs0("txpay")=trim(request("txpay"))
'rs0("cjtj")=trim(request("cjtj"))
rs0("payok")=trim(request("payok"))
rs0("cxt")=trim(request("cxt"))
rs0("txlb")=trim(request("txlb"))
rs0.update
if trim(request("password"))<>"" then
dim pa
pa=request.Form("password")
password=LCase(pa)
rs0("password")=md5(password)
rs0.update
end if
response.Write "<script language=javascript>alert('用户资料修改成功！');location.href='ycuser.asp?userid="&userid&"';</script>"
response.end
%>