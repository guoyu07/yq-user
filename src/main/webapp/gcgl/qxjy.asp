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
if rs("payonoff")="�Ѿ�ת��" or rs("zftime")<>"" then
   response.Write "<script language=javascript>alert('��EP���׽����л��Ѿ������˽��׳ɹ��ˣ������ظ�����ѡ���������ף�');location.href='"&tx&".asp'</script>"
end if
set rst = Server.CreateObject("ADODB.Recordset")
sqlt ="select * from gpjy where username ='"&rs("dfuser")&"' and dfuser='"&rs("payid")&"' "
rst.open sqlt,conn2,2,3
if not rst.eof then
   rst("bz")="��ʱδ����-����һ������"
   rst("dfuser")="ϵͳ"
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
elseif rs("dfuser")="ϵͳ" then
   rs("ep")=0
   rs("rgdate")=abcd
   rs("dfuser")=""
   rs("kjygid")=0
   rs.update
end if
%>
<%
response.Write "<script language=javascript>alert('�������׳ɹ���');window.location.replace('"&tx&".asp');</script>"
%>