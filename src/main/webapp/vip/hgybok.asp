<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   ybsl=request("ybsl")
   ybfw=request("ybfw")
   gwuser=request("gwuser")
   hgcode=request("hgcode")
   pa3=request("pa3")
   gwno=request("gwno")
   gwid=request("gwid")
end if
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if ybsl*1<0 then
   response.write "<script language='javascript'>"
   response.write "alert('订单信息有误，请重新提交！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('请先登录！');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>" 
   response.end
elseif rs("username")<>gwuser then
   response.write "<script language='javascript'>"
   response.write "alert('您好，该订单不是当前登录用户名提交，请重新登录，谢谢！');"
   response.write "top.location.replace('/index.asp?id="&gwuser&"');"
   response.write "</script>" 
   response.end
elseif rs("password3")<>pa3 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，二级密码不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("vipsq")<>hgcode then
   response.write "<script language='javascript'>"
   response.write "alert('您好，验证码不正确，请重新输入！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end   
elseif rs("pay")+0<1 or rs("pay")+0=0 or ybsl+0>rs("pay") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，一币不足 "&ybsl&"，暂时不能换购，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("pay")=rs("pay")-(ybsl+0)
   rs("vippay")=rs("vippay")-(ybsl+0)
   rs("fhpay")=rs("fhpay")-(ybsl+0)
   rs("txpay")=rs("txpay")+(ybsl+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("jc")=ybsl
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1("regid")="换购-"&gwno
rs_d1("newbz")=4
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
response.redirect"http://yb.zgyce.com/admin/ybhg_pay.asp?gwid="&gwid&"&CheckStates=5"
%>