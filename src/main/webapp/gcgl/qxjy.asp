<!--#include file=../ct0618.asp-->
<!--#include file=../zqcjimg.asp-->
<!--#include file="checkadmin.asp"-->
<%
jybh=request("qx")
tx=request("tx")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn1,2,3
%>
<%
if rs("payonoff")="已经转账" or rs("zftime")<>"" then
   response.Write "<script language=javascript>alert('该EP交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！');location.href='"&tx&".asp'</script>"
end if
set rst = Server.CreateObject("ADODB.Recordset")
sqlt ="select * from gpjy where username ='"&rs("dfuser")&"' and dfuser='"&rs("payid")&"' "
rst.open sqlt,conn2,2,3
if not rst.eof then
   rst("bz")="超时未付款-并扣一诚信星"
   rst("dfuser")="系统"
   rst("cgdate")=Now()
   rst.Update
set rsk = Server.CreateObject("ADODB.Recordset")
sqlk ="select * from gcuser where username ='"&rs("dfuser")&"' "
rsk.open sqlk,conn2,2,3
   rsk("cxt")=rsk("cxt")-1
   rsk.update
   rs("ep")=0
   rs("rgdate")=abcd
   rs("dfuser")=""
   rs("kjygid")=0
   rs.update
elseif rs("dfuser")="系统" then
   rs("ep")=0
   rs("rgdate")=abcd
   rs("dfuser")=""
   rs("kjygid")=0
   rs.update
end if
%>
<%
response.Write "<script language=javascript>alert('撒消交易成功！');window.location.replace('"&tx&".asp');</script>"
%>