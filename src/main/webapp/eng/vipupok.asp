<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
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
if Instr(Request("jzpay")/100,".") <> 0 then  'ÊÇ·ñ±»100Õû³ý£¬
   response.write "<script language='javascript'>"
   response.write "alert('Transfers must be an integer, such as 100-fold:100,200,300,400,500,1000,5000, please check the input is correct!');"
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
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif username<>"300fhk" and rs("regtime")<rs2("jsdate") then
   response.write "<script language='javascript'>"
   response.write "alert('System commissioning, re-register a new user name to operate or contact your sponsor!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif jzuser=rs("username") then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, can not be transferred to yourself, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif jzpay<0 or jzpay=0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you transfer a currency can not be less than zero, thank you!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")<jzpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, you transfer a currency that you can not be greater than the remaining amount"&rs("pay")&"+Service fees"&jzep*0.05&", Thank you!');"
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
   response.write "alert('Transfer service center team does not exist, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif vipsq<>rs1("vipsq") then
   response.write "<script language='javascript'>"
   response.write "alert('Authorization code is incorrect, please re-enter!');"
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
rs_d1("regid")="Transferred to the service center"&left(jzuser,2)&"***-Including service charges"&jzep*0.05&""
rs_d1("jc")=jzpay
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update   

set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=jzuser
rs_d2("regid")="Roger that"&username&"Transfer - including service charges"&jzep*0.05&""
rs_d2("syjz")=jzpay
rs_d2("pay")=rs1("pay")
rs_d2("jydb")=rs1("jydb")
rs_d2.update
end if
%>
<% 
response.Write "<script language=javascript>alert('Hello! Transfer success!');location.replace('datepay.asp');</script>"
%>