<!--#include file="../shopmfh.asp"-->
<!--#include file="jk_md5.asp"-->
<%
	response.cookies("fhk0625")=request("jbk")
	response.cookies("fhk0628")="110120119"
	response.cookies("pdid")=""
	response.cookies("pdpa")=""
%>
<%
'sql2="select * from cfuser where username = '"&regid&"'" 
'Set rs2= Server.CreateObject("ADODB.Recordset") 
'rs2.open sql2,conn1,1,1
'if rs2("jhtj")*100>rs2("jhstop")*10000 then
   'response.write "<script language='javascript'>"
   'response.write "alert('�Ѽ���������ֵ���� "&rs2("jhstop")&" ������ϵ���ش����˾�ͷ�����������Ѷ');"
   'response.write "history.go(-1);"
   'response.write "</script>"
   'response.end
'end if
%>
<%
dim pa,pa1,fw,fw1
pa=request("pdpa")
pa1=LCase(pa) 
fw=request("fwid")
fw1=LCase(fw)
'Response.write(str1 & "," & str2) 
%>
<%
pdid=request("pdid")
pdpa=md5(pa1)
fwid=md5(fw1)
Set rs_login = Server.CreateObject("ADODB.Recordset")
sql="select * from ejbk where pdid = '" & pdid & "'"
rs_login.open sql,conn0,1,1
if pdid="'or'='or'" then
   response.write "<script language='javascript'>"
   response.write "alert('�벻Ҫ�������ֱ�վ��');"
   response.write "window.location.replace('login.asp');"
   response.write "</script>"
   response.end
end if
if rs_login.eof and rs_login.bof then
   response.redirect "chklog1.asp?pdid="&pdid&"&pdpa="&pdpa&"&fwid="&fwid&""
   response.end
elseif rs_login("pdpamd5")<>pdpa then
   response.write "<script language='javascript'>"
   response.write "alert('��� ��¼���� ����ȷ�����������룡');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs_login("fwidmd5")<>fwid then
   response.write "<script language='javascript'>"
   response.write "alert('��� ��α���� ����ȷ�����������룡');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
   response.cookies("pdid")=rs_login("pdid")
   response.cookies("gmdate")=rs_login("gmdate")
   response.cookies("gmuser")=rs_login("up")
   response.cookies("mj")=rs_login("bf2")
   response.Write "<script language=javascript>alert('������ȷ�����ڽ������ѻ�����ֵϵͳ��');location.href='jypd0.asp?mj="&rs_login("bf2")&"'</script>"
   response.end
rs_login.close
%>