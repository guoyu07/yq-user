<!--#include file="../shopmfh.asp"-->
<%
	response.cookies("fhk0628")="110120119"
	response.cookies("pdid")=""
	response.cookies("pdpa")=""
%>
<%
pdid=request("pdid")
pdpa=request("pdpa")
fwid=request("fwid")
Set rs_login = Server.CreateObject("ADODB.Recordset")
sql="select * from jbk10 where pdid = '" & pdid & "'"
rs_login.open sql,conn0,1,1
if rs_login.eof and rs_login.bof then
   response.redirect "chklog5.asp?pdid="&pdid&"&pdpa="&pdpa&"&fwid="&fwid&""
   response.end
elseif rs_login("pdpamd5")<>pdpa then
   response.write "<script language='javascript'>"
   response.write "alert('你的 登录密码 不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs_login("fwidmd5")<>fwid then
   response.write "<script language='javascript'>"
   response.write "alert('你的 防伪编码 不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
   response.cookies("pdid")=rs_login("pdid")
   response.Write "<script language=javascript>alert('输入正确，正在进入消费分红系统！');location.href='jypd1.asp'</script>"
   response.end
%>