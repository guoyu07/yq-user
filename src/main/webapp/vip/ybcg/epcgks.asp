<!--#include file="../ctshop.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   epsl=request("epsl")
   cpbh=request("cpbh")
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
elseif rs("pay")+0<1 or rs("pay")+0=0 or epsl+0>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，一币不足，暂时不能参与，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_cp,sql_cp
set rs_cp = Server.CreateObject("ADODB.Recordset")
sql_cp="select * from jfcp where cpbh = "&cpbh&" "
rs_cp.open sql_cp,conn9,2,3
if rs_cp("dqep")=0 or rs_cp("dqep")<epsl+0 then
   response.write "<script language='javascript'>"
   response.write "alert('本轮该产品已成功被抢购，请稍候再试或联系客服进行下一轮抢购或选择其它产品！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_cp("dqep")=rs_cp("dqep")-(epsl+0)
   rs_cp.update
   rs("pay")=rs("pay")-(epsl+0)
   rs("vippay")=rs("vippay")-(epsl+0)
   rs("fhpay")=rs("fhpay")-(epsl+0)
   rs("txpay")=rs("txpay")+(epsl+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("regid")="抢购-"&rs_cp("cpmq")
rs_d1("jc")=epsl
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
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
if rs_cp("dqep")=10 or rs_cp("dqep")<21 and rs_cp("cglist")<>0 then
   rs_cp("dqep")=rs_cp("zepsl")-epsl
   rs_cp("cglist")=rs_cp("cglist")-1
   rs_cp.update
end if
%>
<%
if rs_cp("dqep")=0 or rs_cp("dqep")<0 and rs_cp("cglist")=0 then
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM cpuser"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("cguser")=username
rs_d2("cpmq")="一币-"&rs_cp("cpmq")
rs_d2("jydate")=Now()
rs_d2("jyjf")=rs_cp("zepsl")
rs_d2("jyname")=rs("name")
rs_d2("jyqq")=rs("qq")
rs_d2("jycall")=rs("call")
rs_d2.update
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM datepay"
rs_d3.open sql_d3,conn9,2,3
rs_d3.addnew
rs_d3("username")=rs("username")
rs_d3("regid")="抢购成功-"&rs_cp("cpmq")
rs_d3("pay")=rs("pay")
rs_d3("jydb")=rs("jydb")
rs_d3.update
rs_cp("dqep")=rs_cp("zepsl")+0
rs_cp("cglist")=rs_cp("cblist")+0
rs_cp("jysl")=rs_cp("jysl")+1
rs_cp.update
response.write "<script language='javascript'>"
response.write "alert('恭喜您！抢购成功，请联系客服登记，以便公司更快把产品寄到您手上！');"
response.write "history.go(-1);"
response.write "</script>" 
response.end
else
response.write "<script language='javascript'>"
response.write "alert('您好，本次点击抢购还差一点点，还有"&rs_cp("dqep")&"就可以抢中，继续加油！！！');"
response.write "history.go(-1);"
response.write "</script>" 
response.end
end if
%>