<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('暂时不能卖出！');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("qxid")
end if
%>
<%
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where jyid ="&jybh&""
rs_my.open sql_my,conn2,2,3
mypay=rs_my("jypay")
pay=rs_my("pay")
mcsl=rs_my("mcsl")
if rs_my("jy")<>2 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('非法操作，请检查后再试！');location.href='sgqg.asp'</script>"
   response.end
end if
%>
<%
set rsjb = Server.CreateObject("ADODB.Recordset")
sqljb="select * from datepay where id ="&jybh&""
rsjb.open sqljb,conn9,2,3
rs("jydb")=rs("jydb")+rsjb("dbjc")
rs.update
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=username
rs_d2("regid")="撤销求购积分"
rs_d2("jyjz")=rsjb("dbjc")
rs_d2("pay")=rs("pay")
rs_d2("jydb")=rs("jydb")
rs_d2.update
rsjb("regid")="已撤销"
rsjb.update
%>
<%
set rs_de = Server.CreateObject("ADODB.Recordset")
sql_de="delete * from gpjy where jyid ="&jybh&""
rs_de.open sql_de,conn2,2,3
%>
<%
response.Write "<script language=javascript>alert('撤销求购积分成功！');location.replace('sgqg.asp');</script>"
%>