<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�Ѳ����������µ�¼��');"
   response.write "window.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="120"
   cjyh=request("uid")
   cjpay=request("cj")
   cjfs=request("fs")
   czy=request("czy")
   'bfym=Request.ServerVariables("SERVER_NAME")
   'Request.ServerVariables("HTTP_HOST")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<!--#include file="secjlog.asp"-->
<%
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from fcxt where ncjud ='"&czy&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('����Ա�����ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&cjyh&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�û�Ա�����ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
  rs("cjtj")=rs("cjtj")+cjpay
  rs("gmdate")=Now()
  rs.update
end if
%>
<%
if cjpay=5000 and rs("syep")<4999 then
   response.write "<script language='javascript'>"
   response.write "alert('ʵ��һ��һ��һ���ֵ�����γ�ֵ5000�ɱ�����С��5000�����Ȳ��䱨���ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay=10000 and rs("syep")<9999 then
   response.write "<script language='javascript'>"
   response.write "alert('ʵ��һ��һ��һ���ֵ�����γ�ֵ10000�ɱ�����С��10000�����Ȳ��䱨���ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay=15000 and rs("syep")<14999 then
   response.write "<script language='javascript'>"
   response.write "alert('ʵ��һ��һ��һ���ֵ�����γ�ֵ15000�ɱ�����С��15000�����Ȳ��䱨���ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay=20000 and rs("syep")<19999 then
   response.write "<script language='javascript'>"
   response.write "alert('ʵ��һ��һ��һ���ֵ�����γ�ֵ20000�ɱ�����С��20000�����Ȳ��䱨���ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
if cjpay=5000 and rs("syep")>4999 then
  rs("syep")=rs("syep")-5000
  rs("ljbdb")=rs("ljbdb")+10000
  rs("sybdb")=rs("sybdb")+10000
  rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM bdbdate"
rs_d1.open sql_d1,conn1,2,3
rs_d1.addnew
rs_d1("zuser")=cjyh
rs_d1("sy")=10000
rs_d1("sybdb")=rs("sybdb")
rs_d1("ljbdb")=rs("ljbdb")
rs_d1("bz")="��ֵ5000��5000��������Ч"
rs_d1.update
elseif cjpay=10000 and rs("syep")>9999 then
  rs("syep")=rs("syep")-10000
  rs("ljbdb")=rs("ljbdb")+20000
  rs("sybdb")=rs("sybdb")+20000
  rs.update
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM bdbdate"
rs_d3.open sql_d3,conn1,2,3
rs_d3.addnew
rs_d3("zuser")=cjyh
rs_d3("sy")=20000
rs_d3("sybdb")=rs("sybdb")
rs_d3("ljbdb")=rs("ljbdb")
rs_d3("bz")="��ֵ10000��10000��������Ч"
rs_d3.update
elseif cjpay=15000 and rs("syep")>14999 then
  rs("syep")=rs("syep")-15000
  rs("ljbdb")=rs("ljbdb")+30000
  rs("sybdb")=rs("sybdb")+30000
  rs.update
set rs_d6 = Server.CreateObject("ADODB.Recordset")
sql_d6 = "SELECT * FROM bdbdate"
rs_d6.open sql_d6,conn1,2,3
rs_d6.addnew
rs_d6("zuser")=cjyh
rs_d6("sy")=30000
rs_d6("sybdb")=rs("sybdb")
rs_d6("ljbdb")=rs("ljbdb")
rs_d6("bz")="��ֵ15000��15000��������Ч"
rs_d6.update
elseif cjpay=20000 and rs("syep")>19999 then
  rs("syep")=rs("syep")-20000
  rs("ljbdb")=rs("ljbdb")+40000
  rs("sybdb")=rs("sybdb")+40000
  rs.update
set rs_d9 = Server.CreateObject("ADODB.Recordset")
sql_d9 = "SELECT * FROM bdbdate"
rs_d9.open sql_d9,conn1,2,3
rs_d9.addnew
rs_d9("zuser")=cjyh
rs_d9("sy")=40000
rs_d9("sybdb")=rs("sybdb")
rs_d9("ljbdb")=rs("ljbdb")
rs_d9("bz")="��ֵ20000��20000��������Ч"
rs_d9.update   
end if
%>
<%
response.cookies("lsyh")=""
response.redirect "/vgo/cfkfc04.asp?dl="&cjyh&"&cj="&cjpay&"&cjtj="&rs("cjtj")&"&cz="&czy&"&fs="&cjfs&""
%>