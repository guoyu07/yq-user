<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="checkadmin.asp"-->
<%
jcname=request("jcname")
jzpay=request("jzpay")
syuser=request("syuser")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&jcname&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('ת���û��������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif jcname=syuser then
   response.write "<script language='javascript'>"
   response.write "alert('��ã�����ת���Լ���лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif jzpay<0 or jzpay=0 then
   response.write "<script language='javascript'>"
   response.write "alert('��ã���ת�˱����Ҳ���С���㣬лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("sybdb")<jzpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('ת���û��������Ҳ��ܴ���ʣ�౨���� "&rs("sybdb")&" ��лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&syuser&"'"
rs1.open sql1,conn2,2,3
if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('���յ��û��������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else  
   rs("sybdb")=rs("sybdb")-(jzpay+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM bdbdate"
rs_d1.open sql_d1,conn1,2,3
rs_d1.addnew
rs_d1("zuser")=jcname
rs_d1("bz")="ת��-"&syuser&""
rs_d1("jc")=jzpay
rs_d1("sybdb")=rs("sybdb")
rs_d1("ljbdb")=rs("ljbdb")
rs_d1.update   
   rs1("sybdb")=rs1("sybdb")+(jzpay+0)
   rs1("ljbdb")=rs1("ljbdb")+(jzpay+0)
   rs1.update   
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM bdbdate"
rs_d2.open sql_d2,conn1,2,3
rs_d2.addnew
rs_d2("zuser")=syuser
rs_d2("bz")="�յ�-"&jcname&""
rs_d2("sy")=jzpay
rs_d2("sybdb")=rs1("sybdb")
rs_d2("ljbdb")=rs1("ljbdb")
rs_d2.update
end if
%>
<% 
response.Write "<script language=javascript>alert('���ã�ת�˳ɹ���');location.replace('bdbjzpay.asp');</script>"
%>