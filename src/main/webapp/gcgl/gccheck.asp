<!--#include file="../ct0618.asp"-->
<!--#include file="jk_md5.asp"-->
<%
adminusername=request("adminusername")
userid=trim(Request("adminusername"))
password=jk_md5(trim(request("password")),"short")
'�жϽ��ܵ��ʺ�\�����Ƿ����Ҫ��
if userid="" then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ���Ϊ��!');window.history.go(-1);}</script>"
end if
if instr(1,userid,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,userid,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,password,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,password,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,password,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���*!');window.history.go(-1);}</script>"
end if
if instr(1,password,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���$!');window.history.go(-1);}</script>"
end if
'��֤��
if lcase(request.form("validcode"))=lcase(session("validcode")) then
session("validcode")=empty
else
Response.Write "<script language=""JavaScript"">alert('��֤��������������룡');window.location.replace('melogin.asp');</script>"
Response.End
end if

Set rs_admin = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where adminusername = '" & adminusername & "' and password = '" & password & "'"
rs_admin.open sql,conn2,1,1
if rs_admin.eof and rs_admin.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�˺Ż��������');"
   response.write "window.location.replace('melogin.asp');"
   response.write "</script>"
   response.end
else
Session("adminusername")=rs_admin("adminusername")
session("password")=rs_admin("password")
response.redirect "manager.asp"
end if
%>