<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
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
   jzpay=request("jzpay")
   jzuser=request("jzuser")
end if
%>
<%
if Instr(Request("jzpay")/100,".") <> 0 then  '�Ƿ�100������
   response.write "<script language='javascript'>"
   response.write "alert('ת�˱�����100�ı������磺100��200��300��400��500��1000��5000�����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
if username<>"300fhk" then
set rs_zuo = Server.CreateObject("ADODB.Recordset")
sql_zuo="select * from zuo_mingxi where tjuser ='"&username&"' and down = '" &jzuser&"'"
rs_zuo.open sql_zuo,conn7,1,1
if rs_zuo.eof and rs_zuo.bof then
set rs_you = Server.CreateObject("ADODB.Recordset")
sql_you="select * from you_mingxi where tjuser ='"&username&"' and down = '" &jzuser&"'"
rs_you.open sql_you,conn7,1,1
if rs_you.eof and rs_you.bof then
   response.write "<script language='javascript'>"
   response.write "alert('ֻ��ת���Լ��ŶӵĲ��ѽ���˫������ң�');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
end if
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
elseif jzuser=rs("username") then
   response.write "<script language='javascript'>"
   response.write "alert('���ã�����ת���Լ���лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif jzpay<0 or jzpay=0 or jzpay>100000 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���ת��һ�Ҳ���С����򳬹�100000��лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('VIP���һ���˻���������ڻ����50000��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs("pay")<jzpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('���ã���ת��һ�Ҳ��ܴ�����ʣ��һ�� "&rs("pay")&" ��лл��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from gcuser where username ='"&jzuser&"'"
rs1.open sql1,conn2,2,3
if rs1.eof and rs1.bof then
   response.write "<script language='javascript'>"
   response.write "alert('ת����û��������ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs1("pay")=rs1("pay")+(jzpay+0)
   rs1("cbpay")=rs1("cbpay")+(jzpay+0)
   rs1("vippay")=rs1("vippay")+(jzpay+0)
   rs1.update
   rs("pay")=rs("pay")-(jzpay+0)
   rs("txpay")=rs("txpay")+(jzpay+0)
   rs.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=username
rs_d1("regid")="ת��-"&jzuser&""
rs_d1("jc")=jzpay
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update

set rs_d2 = Server.CreateObject("ADODB.Recordset")
sql_d2 = "SELECT * FROM datepay"
rs_d2.open sql_d2,conn9,2,3
rs_d2.addnew
rs_d2("username")=jzuser
rs_d2("regid")="�յ���������"&left(username,2)&"***ת��"
rs_d2("syjz")=jzpay
rs_d2("pay")=rs1("pay")
rs_d2("jydb")=rs1("jydb")
rs_d2.update
end if
%>
<%
set rs_vip= Server.CreateObject("ADODB.Recordset")
sql_vip= "SELECT * FROM vipxtgc where vipname='"&username&"' and DateDiff('d',date(),vipdate)=0 order by vipid desc"
rs_vip.open sql_vip,conn2,2,3
if not rs_vip.eof then
   rs_vip("jcyb")=rs_vip("jcyb")+(jzpay+0)
   rs_vip.update
else
   rs_vip.addnew
   rs_vip("vipname")=username
   rs_vip("vipdate")=date()
   rs_vip("jcyb")=jzpay
   rs_vip.update
end if
response.Write "<script language=javascript>alert('���ã�ת�˳ɹ���');location.replace('datepay.asp');</script>"
%>