<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
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
if request("act")<>"" then
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,2,3
if rs("sjb")=20 then
   mysl=500
elseif rs("sjb")=40 then
   mysl=1000
elseif rs("sjb")=100 then
   mysl=1500
end if
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy where username='"&username&"' and bz='���ֺ��'"
rs_d1.open sql_d1,conn2,2,3
if not rs_d1.eof then
   response.write "<script language='javascript'>"
   response.write "alert('������ȡ�������');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jb")<>8 then
   response.write "<script language='javascript'>"
   response.write "alert('���λ��ֺ�����ṩ��2015��02��18��2015��02��23�տ���1�����ϵ������ȡ��лл��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   rs("jyg")=rs("jyg")+mysl
   rs("jb")=0
   rs.update
rs_d1.addnew
rs_d1("username")=rs("username")
rs_d1("mysl")=mysl
rs_d1("sysl")=rs("jyg")
rs_d1("bz")="���ֺ��"
rs_d1("abdate")=abcd
rs_d1("cgdate")=Now()
rs_d1("jy")=1
rs_d1.update   
end if
response.Write "<script language=javascript>alert('��ȡ"&mysl&"���ֺ���ɹ���');location.replace('gpjy.asp');</script>"
end if
%><p align="center"><a href="?act=1828">
<img border="0" src="http://www.zgyce.com/images/jfhb.jpg" width="1024" height="724"></a></p>