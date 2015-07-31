<!--#include file="ctshop.asp"-->
<!--#include file="vip/cfvip.asp"-->
<%
if request.cookies("username")="" then
   session.timeout=30
   response.write "<script language='javascript'>"
   response.write "alert('你已成功注册过，不需要重复操作！');"
   response.write "top.location.replace('reg_hw.asp');"
   response.write "</script>"
   response.end
end if
%>
<% 
userds=request.Form("upvip")
user=LCase(userds)
temuser=request.Form("gguser")
%>
<%
   dim rs,sql
   set rs=server.createobject("adodb.recordset")
   sql="select * from gcuser where username = '"&temuser&"'"
   rs.open sql,conn2,1,1
   if not rs.eof then
   response.write "<script language='javascript'>"
   response.write "alert('此用户名已有人使用！请更换！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
   end if
%>
<%
   dim rs1,sql1
   set rs1=server.createobject("adodb.recordset")
   sql1="select * from gcuser where username = '"&user&"'"
   rs1.open sql1,conn2,1,1
   if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('没有这个推荐人账号，请重新写入！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
   end if
%>
<%
if request.Form("ProvinceName")="0" or request.Form("CityName")="0" or request.Form("AreaName")="0" then
   response.write "<script language='javascript'>"
   response.write "alert('所在地区不全！请重新选择！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<% 
dim pa,pa1
pa=request.Form("ggpa1")
password=LCase(pa)
%>
<%
if request.Form("ProvinceName")<>"" and request.Form("CityName")<>"" and request.Form("AreaName")<>"" then
set rs_links = Server.CreateObject("ADODB.Recordset")
sql_links = "SELECT * FROM gcuser"
rs_links.open sql_links,conn2,2,3
rs_links.addnew
rs_links("username")=request.Form("gguser")
rs_links("password")=md5(password)
rs_links("password3")=request.Form("ggpa3")
rs_links("name")=request.Form("ggname")
rs_links("bank")=request.Form("ggbank")
rs_links("card")=request.Form("ggcard")
rs_links("call")=request.Form("ggcall")
rs_links("qq")=request.Form("ggqq")
rs_links("up")=user
rs_links("gwuid")=1
rs_links("userid")=request.Form("gguserid")
rs_links("addsheng")=request.Form("ProvinceName")
rs_links("addshi")=request.Form("CityName")
rs_links("addqu")=request.Form("AreaName")
rs_links.update
else
   response.write "<script language='javascript'>"
   response.write "alert('所在地区不全！请重新选择！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
response.cookies("username")=""
response.Write "<script language=javascript>alert('恭喜注册成功！请登录进行其它操作！');location.href='reg3.asp?id="&temuser&"'</script>"
%>