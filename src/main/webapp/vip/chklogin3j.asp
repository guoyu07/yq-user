<!--#include file="../ct0618.asp"-->
<%
username=request("m_username")
password3=request("password3")
sql="select * from gcuser where username = '" & username & "' and password3 = '" & password3 & "'"
Set rs_login = conn2.execute(sql)
if rs_login.eof and rs_login.bof then
   response.write "<script language='javascript'>"
   response.write "alert('二级密码错误,请重新输入！');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
elseif rs_login("payok")=1 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您同一姓名账号或同一身份证号码账号已发布成功过，请耐心等待处理完成后再发布第二笔，如果认购方已向您付款，请先确认收款再发布第二笔，谢谢！');"
   response.write "location.replace('epmcjl.asp');"
   response.write "</script>"
   response.end
elseif rs_login("txlb")=3 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，一币商城的商家账户暂时不提供卖出功能，谢谢！');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
elseif rs_login("cxt")<4 and rs_login("cxdate")>date() then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您的诚信星为"&rs_login("cxt")&"，离取消[限制发布]时间还有"&rs_login("cxdate")-date()&"天，谢谢！');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
elseif rs_login("jygt1")=2 or rs_login("dbt1")=2 then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs_login("bank")="财付通" or rs_login("card")="支付宝" then
   response.write "<script language='javascript'>"
   response.write "alert('请把收款方式改为“工商银行”或“农业银行”或“建设银行”再进行卖出操作！');"
   response.write "location.replace('dateuser.asp');"
   response.write "</script>"
   response.end
else
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=10"
rs2.open sql2,conn2,1,1
ajsdate=rs2("jsdate")
aregtime=rs_login("regtime")
response.cookies("regid")=rs_login("username")
response.cookies("password")=rs_login("password")
end if
Rs_login.close
Set Rs_login=Nothing
Rs2.close
Set Rs2=Nothing
conn2.close
set conn2=nothing
%>
<%
if aregtime>ajsdate then
   response.redirect "userpay.asp"
else
   'response.redirect "login3j.asp?ts=平台系统正在核算统计数据，届时将会逐步恢复一币卖出功能，感谢大家的关注与体谅！"
   response.redirect "userpay_10yh.asp"
end if
%>