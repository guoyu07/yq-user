<!--#include file=../zqcjimg.asp-->
<%
response.cookies("lsyh01")="1202"
response.cookies("lsyh02")="1208"
%>
<%
if request.cookies("lsyh01")="" or request.cookies("lsyh02")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "top.location.replace('gcgl/searchg0701.asp');"
   response.write "</script>"
   response.end
end if
%>
<%
dluser=request("dl")
cjpay=request("cj")
cjfs=request("fs")
cjtj=request("cjtj")
czy=request("cz")
%>
<%
dim rs,sql
set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from datecj"
rs.open sql,conn1,2,3
rs.addnew
rs("cjuser")=dluser
rs("dqcj")=cjpay
rs("ljcj")=cjtj
rs("cjfs")=cjfs
rs("cz")=czy
rs("ip")=Request.ServerVariables("REMOTE_ADDR")
rs.update
%>
<%
response.cookies("lsyh01")=""
response.cookies("lsyh02")=""
response.Write "<script language=javascript>alert('恭喜充值成功。。。！');location.href='gcgl/searchg0701.asp'</script>"
%>