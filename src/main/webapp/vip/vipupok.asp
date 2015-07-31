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
   jzep=request("jzpay")
   jzpay=jzep*0.05+jzep
   jzuser=request("jzuser")
   vipsq=request("vipsq")
end if
%>
<%
if Instr(Request("jzpay")/100,".") <> 0 then  '是否被100整除，
   response.write "<script language='javascript'>"
   response.write "alert('转账必须是100的倍整数如：100，200，300，400，500，1000，5000，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=10"
rs2.open sql2,conn2,1,1
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
elseif username<>"300fhk" and rs("regtime")<rs2("jsdate") then
   response.write "<script language='javascript'>"
   response.write "alert('系统调试中，请重新注册新的用户名进行操作或联系您的推荐人！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif jzuser=rs("username") then
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
   response.write "alert('您好，您转账一币不能大于您剩余金额 "&rs("pay")&"+服务费"&jzep*0.05&"，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&jzuser&"'"
rs1.open sql1,conn2,2,3
if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('转入的团队服务中心不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif vipsq<>rs1("vipsq") then
   response.write "<script language='javascript'>"
   response.write "alert('授权码不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs1("pay")=rs1("pay")+(jzpay+0)
   rs1("cbpay")=rs1("cbpay")+(jzpay+0)
   rs1.update
   rs("pay")=rs("pay")-(jzpay+0)
   rs("txpay")=rs("txpay")+(jzpay+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("regid")="转给服务中心"&left(jzuser,2)&"***-含服务费"&jzep*0.05&""
rs_d1("jc")=jzpay
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update   

set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=jzuser
rs_d2("regid")="收到"&username&"转入-含服务费"&jzep*0.05&""
rs_d2("syjz")=jzpay
rs_d2("pay")=rs1("pay")
rs_d2("jydb")=rs1("jydb")
rs_d2.update
end if
%>
<% 
response.Write "<script language=javascript>alert('您好！转账成功！');location.replace('datepay.asp');</script>"
%>