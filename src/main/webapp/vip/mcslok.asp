<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
tgpay=request("sl")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("bddate")+100>Now() and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('δ��100����˻���������ʱֹͣ�������ף�������ɺ��Զ����ţ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM sgxt where username = '"&username&"'"
rs_my.open sql_my,conn7,2,3
if not rs_my.eof then
if rs_my("mqfh")>0 and rs_my("mqfh")<rs_my("zfh") and rs_my("new")>0 and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('��Ϸ����δ��ɣ�������ʱֹͣ�������ף�������ɺ��Զ����ţ�');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
%>
<%
if rs("stopjyg")>19 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�Ϊ���ṩ����ƽ��֤�Ľ��׹����ۼƹ������20�ʣ���������ɺ�ſ��Լ���������лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 or tgpay>2000 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���������������С����򵥱������������ܴ���2000���֣�лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('���ã��������������ܴ�����ʣ��������� "&rs("jyg")&" ��лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("jyg")=rs("jyg")-(tgpay+0)
   rs("stopjyg")=rs("stopjyg")+1
   rs.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("mcsl")=tgpay
rs_d1("sysl")=rs("jyg")
rs_d1("pay")=request("gj")
rs_d1("bz")="����������"
rs_d1("jypay")=int(tgpay*request("gj")*1+0.1)/1
rs_d1.update
%>
<% 
response.Write "<script language=javascript>alert('�������Ƴɹ���');location.replace('gpjy.asp');</script>"
%>