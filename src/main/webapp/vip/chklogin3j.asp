<!--#include file="../ct0618.asp"-->
<%
username=request("m_username")
password3=request("password3")
sql="select * from gcuser where username = '" & username & "' and password3 = '" & password3 & "'"
Set rs_login = conn2.execute(sql)
if rs_login.eof and rs_login.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����������,���������룡');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
elseif rs_login("payok")=1 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���ͬһ�����˺Ż�ͬһ���֤�����˺��ѷ����ɹ����������ĵȴ�������ɺ��ٷ����ڶ��ʣ�����Ϲ����������������ȷ���տ��ٷ����ڶ��ʣ�лл��');"
   response.write "location.replace('epmcjl.asp');"
   response.write "</script>"
   response.end
elseif rs_login("txlb")=3 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�һ���̳ǵ��̼��˻���ʱ���ṩ�������ܣ�лл��');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
elseif rs_login("cxt")<4 and rs_login("cxdate")>date() then
   response.write "<script language='javascript'>"
   response.write "alert('���ã����ĳ�����Ϊ"&rs_login("cxt")&"����ȡ��[���Ʒ���]ʱ�仹��"&rs_login("cxdate")-date()&"�죬лл��');"
   response.write "location.replace('login3j.asp');"
   response.write "</script>"
   response.end
elseif rs_login("jygt1")=2 or rs_login("dbt1")=2 then
   response.write "<script language='javascript'>"
   response.write "alert('�����������������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs_login("bank")="�Ƹ�ͨ" or rs_login("card")="֧����" then
   response.write "<script language='javascript'>"
   response.write "alert('����տʽ��Ϊ���������С���ũҵ���С��򡰽������С��ٽ�������������');"
   response.write "location.replace('dateuser.asp');"
   response.write "</script>"
   response.end
else
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=10"
rs2.open sql2,conn2,1,1
ajsdate=rs2("jsdate")
aregtime=rs_login("regtime")
response.cookies("regid")=rs_login("username")
response.cookies("password")=rs_login("password")
end if
Rs_login.close
Set Rs_login=Nothing
Rs2.close
Set Rs2=Nothing
conn2.close
set conn2=nothing
%>
<%
if aregtime>ajsdate then
   response.redirect "userpay.asp"
else
   'response.redirect "login3j.asp?ts=ƽ̨ϵͳ���ں���ͳ�����ݣ���ʱ�����𲽻ָ�һ���������ܣ���л��ҵĹ�ע�����£�"
   response.redirect "userpay_10yh.asp"
end if
%>