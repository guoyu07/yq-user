<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   zhgc=request("zhgc")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("gdgc")=0 or rs("gdgc")<0 or (zhgc+0)>rs("gdgc") then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，分红点不足，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("gdgc")=rs("gdgc")-zhgc
   rs.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gcfh"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("userid")=username
rs_d1("sygc")="-"&zhgc
rs_d1("ljgc")=rs("gdgc")
rs_d1("bz")="转为消费股权"
rs_d1.update
%>
<%
sql2="select * from mqfh where username = '"&rs("username")&"' and DateDiff('d',date(),pddate)=0 " 
Set rs2= Server.CreateObject("ADODB.Recordset") 
rs2.open sql2,conn7,2,3
if not rs2.eof then
rs2("pdlb")=zhgc+rs2("pdlb")
rs2("pdlbtj")=zhgc+rs2("pdlbtj")
rs2.update
else
set rs_fh = Server.CreateObject("ADODB.Recordset")
sql_fh = "SELECT * FROM mqfh"
rs_fh.open sql_fh,conn7,2,3
rs_fh.addnew
rs_fh("username")=rs("username")
rs_fh("pdlb")=zhgc
rs_fh("pdlbtj")=zhgc
rs_fh("sjb")=rs("sjb")
rs_fh("dqu")=rs("dqu")
rs_fh("addsheng")=rs("addsheng")
rs_fh("addshi")=rs("addshi")
rs_fh("addqu")=rs("addqu")
rs_fh.update
end if
%>
<%
if not rs2.eof and rs("sjb")>0 then
sql3="select * from mqfh where username = '"&rs("username")&"'" 
Set rs3= Server.CreateObject("ADODB.Recordset") 
rs3.open sql3,conn7,2,3
While Not rs3.EOF
rs3("sjb")=rs("sjb")
rs3.MoveNext
Wend
rs3.UpdateBatch
end if
%>
<%
sql5="select * from fhname where fhuser = '"&rs("username")&"'" 
Set rs5= Server.CreateObject("ADODB.Recordset") 
rs5.open sql5,conn7,2,3
If rs5.eof or rs5.bof Then
rs5.addnew
rs5("fhuser")=rs("username")
rs5("fhpa")=rs("password")
rs5.update
end if
%>
<%
response.Write "<script language=javascript>alert('转换"&zhgc&"成功！');window.location.replace('sfjl.asp');</script>"
%>