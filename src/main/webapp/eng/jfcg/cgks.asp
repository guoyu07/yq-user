<!--#include file="../ctshop.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "top.location.replace('login.asp');"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jfsl="1"
   cpbh=request("cpbh")
end if
%>
<%
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
elseif rs("jyg")+0<10 or rs("jyg")+0=0 or jfsl+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('���ã����ֲ��㣬��ʱ���ܲ��룬лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_cp,sql_cp
set rs_cp = Server.CreateObject("ADODB.Recordset")
sql_cp="select * from jfcp where cpbh = "&cpbh&" "
rs_cp.open sql_cp,conn9,2,3
if rs_cp("dqjf")=0 or rs_cp("dqjf")<jfsl+0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ָò�Ʒ�ѳɹ������������Ժ����Ի���ϵ�ͷ�������һ��������ѡ��������Ʒ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs_cp("dqjf")=rs_cp("dqjf")-(jfsl+0)
   rs_cp.update
   rs("jyg")=rs("jyg")-(jfsl+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM gpjy"
rs_d1.open sql_d1,conn2,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("mcsl")=jfsl
rs_d1("sysl")=rs("jyg")
rs_d1("abdate")=abcd
rs_d1("bz")="����-"&rs_cp("cpmq")
rs_d1("jy")=1
rs_d1("cgdate")=Now()
rs_d1.update
end if
%>
<%
if rs_cp("dqjf")=10 or rs_cp("dqjf")<21 and rs_cp("cglist")<>0 then
   rs_cp("dqjf")=rs_cp("zjfsl")-jfsl
   rs_cp("cglist")=rs_cp("cglist")-1
   rs_cp.update
end if
%>
<%
if rs_cp("dqjf")=0 or rs_cp("dqjf")<0 and rs_cp("cglist")=0 then
set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM cpuser"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("cguser")=username
rs_d2("cpmq")="jf-"&rs_cp("cpmq")
rs_d2("jydate")=Now()
rs_d2("jyjf")=rs_cp("zjfsl")
rs_d2("jyname")=rs("name")
rs_d2("jyqq")=rs("qq")
rs_d2("jycall")=rs("call")
rs_d2.update
set rs_d3 = Server.CreateObject("ADODB.Recordset")
sql_d3 = "SELECT * FROM gpjy"
rs_d3.open sql_d3,conn2,2,3
rs_d3.addnew
rs_d3("username")=username
rs_d3("sysl")=rs("jyg")
rs_d3("date")=abcd
rs_d3("bz")="�����ɹ�-"&rs_cp("cpmq")
rs_d3("jy")=1
rs_d3("cgdate")=Now()
rs_d3.update
rs_cp("dqjf")=rs_cp("zjfsl")+0
rs_cp("cglist")=rs_cp("cblist")+0
rs_cp("jysl")=rs_cp("jysl")+1
rs_cp.update
response.write "<script language='javascript'>"
response.write "alert('��ϲ���������ɹ�������ϵ�ͷ��Ǽǣ��Ա㹫˾����Ѳ�Ʒ�ĵ������ϣ�');"
response.write "history.go(-1);"
response.write "</script>" 
response.end
else
response.write "<script language='javascript'>"
response.write "alert('���ã����ε����������һ��㣬����"&rs_cp("dqjf")&"�Ϳ������У��������ͣ�����');"
response.write "history.go(-1);"
response.write "</script>" 
response.end
end if
%>