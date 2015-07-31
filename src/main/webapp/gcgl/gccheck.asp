<!--#include file="../ct0618.asp"-->
<!--#include file="jk_md5.asp"-->
<%
adminusername=request("adminusername")
userid=trim(Request("adminusername"))
password=jk_md5(trim(request("password")),"short")
'判断接受的帐号\密码是否符合要求
if userid="" then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得为空!');window.history.go(-1);}</script>"
end if
if instr(1,userid,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含逗号!');window.history.go(-1);}</script>"
end if
if instr(1,userid,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含单引号!');window.history.go(-1);}</script>"
end if
if instr(1,password,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含逗号!');window.history.go(-1);}</script>"
end if
if instr(1,password,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含单引号!');window.history.go(-1);}</script>"
end if
if instr(1,password,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含*!');window.history.go(-1);}</script>"
end if
if instr(1,password,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含$!');window.history.go(-1);}</script>"
end if
'验证码
if lcase(request.form("validcode"))=lcase(session("validcode")) then
session("validcode")=empty
else
Response.Write "<script language=""JavaScript"">alert('验证码错误，请重新输入！');window.location.replace('melogin.asp');</script>"
Response.End
end if

Set rs_admin = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where adminusername = '" & adminusername & "' and password = '" & password & "'"
rs_admin.open sql,conn2,1,1
if rs_admin.eof and rs_admin.bof then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.write "window.location.replace('melogin.asp');"
   response.write "</script>"
   response.end
else
Session("adminusername")=rs_admin("adminusername")
session("password")=rs_admin("password")
response.redirect "manager.asp"
end if
%>