<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<!--#include file="../vip/cfvip.asp"-->
<%
userid=trim(request("userid"))
%>
<%
set rs0=server.CreateObject("adodb.recordset")
sql0="select * from gcuser where username = '"&userid&"'"
rs0.open sql0,conn2,2,3
rs0("password3")=trim(request("password3"))
rs0("name")=trim(request("name"))
rs0("call")=trim(request("call"))
'rs0("up")=trim(request("up"))
rs0("qq")=trim(request("qq"))
rs0("jb")=trim(request("jb"))
rs0("cjtj")=trim(request("cjtj"))
rs0("shengtj")=trim(request("shengtj"))
rs0("shengpay")=trim(request("shengpay"))
rs0("shengtx")=trim(request("shengtx"))
rs0("shitj")=trim(request("shitj"))
rs0("shipay")=trim(request("shipay"))
rs0("shitx")=trim(request("shitx"))
rs0("qutj")=trim(request("qutj"))
rs0("qupay")=trim(request("qupay"))
rs0("qutx")=trim(request("qutx"))
rs0("gdgc")=trim(request("gdgc"))
rs0("jyg")=trim(request("jyg"))
rs0("jydb")=trim(request("jydb"))
rs0.update
if trim(request("password"))<>"" then
dim pa
pa=request.Form("password")
password=LCase(pa)
rs0("password")=md5(password)
rs0.update
end if
response.Write "<script language=javascript>alert('会员资料修改成功！');location.href='modifyg02user.asp?userid="&userid&"';</script>"
response.end
%>