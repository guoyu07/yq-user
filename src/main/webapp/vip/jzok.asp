<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
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
   jzpay=request("jzpay")
   jzuser=request("jzuser")   
end if
%>
<%
if request("adgl")<>"yc201503yc" then
   response.write "<script language='javascript'>"
   response.write "alert('操作密码不正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
if request("dbz")<>"" then
   jcuser="退款-"&request("dbz")
   sct="(商城)"
set rs_dbz = Server.CreateObject("ADODB.Recordset")
sql_dbz = "SELECT * FROM datepay where regid = '"&jcuser&"'"
rs_dbz.open sql_dbz,conn9,1,1
if not rs_dbz.eof then
   response.write "<script language='javascript'>"
   response.write "alert('此订单号已经处理过，请不要重复！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
elseif username="300fhk" then
   jcuser="收到-300***"
else
   jcuser="收到-"&username
end if

dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&jzuser&"'"
rs1.open sql1,conn2,2,3
if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('转入的用户名不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
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
elseif jzuser=rs("username") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，不能转给自己，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("username")=rs("username") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，不能转给自己，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end   
elseif jzpay<0 or jzpay=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您转账一币不能小于零，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")<jzpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您转账一币不能大于您剩一币余额 "&rs("pay")&" ，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("pay")=rs("pay")-(jzpay+0)
   rs("vippay")=rs("vippay")-(jzpay+0)
   rs("fhpay")=rs("fhpay")-(jzpay+0)
   rs("txpay")=rs("txpay")+(jzpay+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("regid")="转给"&sct&"-"&jzuser&""
rs_d1("jc")=jzpay
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("newbz")=6
rs_d1.update
rs1("pay")=rs1("pay")+(jzpay+0)
rs1("vippay")=rs1("vippay")+(jzpay+0)
rs1("cbpay")=rs1("cbpay")+(jzpay+0)
rs1.update 
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=jzuser
rs_d2("regid")=jcuser
rs_d2("syjz")=jzpay
rs_d2("pay")=rs1("pay")
rs_d2("jydb")=rs1("jydb")
rs_d2("newbz")=6
rs_d2.update
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
%>
<% 
response.Write "<script language=javascript>alert('您好！转账成功！');location.replace('datepay.asp');</script>"
%>