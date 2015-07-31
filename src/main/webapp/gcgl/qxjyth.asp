<!--#include file=../ct0618.asp-->
<!--#include file=../dt0618.asp-->
<!--#include file="checkadmin.asp"-->
<%
jybh=request("qx")
tx=request("tx")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn9,2,3
%>
<%
if rs("payonoff")="已经转账" or rs("zftime")<>"" then
   response.Write "<script language=javascript>alert('该EP交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！');location.href='"&tx&".asp'</script>"
   response.end
else
set rst = Server.CreateObject("ADODB.Recordset")
sqlt ="select * from gcuser where username ='"&rs("dfuser")&"' "
rst.open sqlt,conn2,2,3
if not rst.eof then
rst("jyg")=rs("kjygid")*1+rst("jyg")
rst.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=rs("dfuser")
rs_d1("mysl")=rs("kjygid")
rs_d1("sysl")=rst("jyg")
rs_d1("bz")="解冻-认购EP-"&rs("paynum")&"诚信金-"&rs("payusername")&""
rs_d1("cgdate")=Now()
rs_d1("jy")=1
rs_d1("dfuser")="对方账号有误"
rs_d1.update   
   rs("ep")=0
   rs("rgdate")=abcd
   rs("dfuser")=""
   rs("kjygid")=0
   rs.update
end if
end if
%>
<%
response.Write "<script language=javascript>alert('撒消交易并退回积分成功！');location.replace('"&tx&".asp');</script>"
%>