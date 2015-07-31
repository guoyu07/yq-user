<!--#include file="../ct0618.asp"-->
<%
username=request("m_username")
password3=request("password3")
Set rs_login = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username = '" & username & "' and password3 = '" & password3 & "'"
rs_login.open sql,conn2,1,1
if rs_login.eof and rs_login.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Two password is incorrect, please re-enter!');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
end if
response.cookies("regid")=rs_login("username")
response.cookies("password")=rs_login("password")
%>
<%
'if rs_login("payok")=1 or rs_login("txdate")>Now() then
if rs_login("payok")=1 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, your account the same name or the same identity card number has been published succeeded account, please be patient after processing is complete release the second tranche, if the subscriber has your payment, please re-confirm receiving the second tranche release, thank you !');"
   response.write "location.replace('epmcjl.asp');"
   response.write "</script>"
   response.end
elseif rs_login("txlb")=3 then
   response.write "<script language='javascript'>"
   response.write "alert('Hello, a currency mall merchant accounts do not offer to sell features, thank you!');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
end if
%>
<%
if rs_login("jygt1")=2 or rs_login("dbt1")=2 then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
'elseif rs_login("bank")="财付通" or rs_login("card")="支付宝" then
   'response.write "<script language='javascript'>"
   'response.write "alert('Please send payment methods to "ICBC" or "ABC" or "CCB" sell the operation!');"
   'response.write "location.replace('dateuser.asp');"
   'response.write "</script>"
   'response.end
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=10"
rs2.open sql2,conn2,1,1
if rs_login("regtime")>rs2("jsdate") then
   response.redirect "userpay.asp"
else
   'response.redirect "login3j.asp?ts=平台系统正在核算统计数据，届时将会逐步恢复一币卖出功能，感谢大家的关注与体谅！"
   response.redirect "userpay_10yh.asp"
end if
%>