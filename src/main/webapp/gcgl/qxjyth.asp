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
if rs("payonoff")="�Ѿ�ת��" or rs("zftime")<>"" then
   response.Write "<script language=javascript>alert('��EP���׽����л��Ѿ������˽��׳ɹ��ˣ������ظ�����ѡ���������ף�');location.href='"&tx&".asp'</script>"
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
rs_d1("bz")="�ⶳ-�Ϲ�EP-"&rs("paynum")&"���Ž�-"&rs("payusername")&""
rs_d1("cgdate")=Now()
rs_d1("jy")=1
rs_d1("dfuser")="�Է��˺�����"
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
response.Write "<script language=javascript>alert('�������ײ��˻ػ��ֳɹ���');location.replace('"&tx&".asp');</script>"
%>