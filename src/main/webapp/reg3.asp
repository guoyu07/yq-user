<%
id=request("id")
%>
<!--#include file="ctshop.asp"-->
<%
id=request("id")
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&id&"'"
rs.open sql,conn2,2,3
if rs("addsheng")="ɽ��ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="�Ϻ���" then
    rs("dqu")=0
    rs("add9dqu")="����һ��"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="�㽭ʡ" or rs("addsheng")="����ʡ" then
    rs("dqu")=1
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="�㶫ʡ" or rs("addsheng")="����׳��������" or rs("addsheng")="����ʡ" or rs("addsheng")="�Ĵ�ʡ" then
    rs("dqu")=2
    rs("add9dqu")="���ϵ���"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" then
    rs("dqu")=3
    rs("add9dqu")="���е���"
    rs.update
end if
if rs("addsheng")="������" or rs("addsheng")="�����" or rs("addsheng")="�ӱ�ʡ" or rs("addsheng")="�ӱ�ʡ" or rs("addsheng")="ɽ��ʡ" or rs("addsheng")="���ɹ�������" then
    rs("dqu")=4
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="���Ļ���������" or rs("addsheng")="�½�ά���������" or rs("addsheng")="�ຣʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" then
    rs("dqu")=5
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="����������" or rs("addsheng")="������" then
    rs("dqu")=6
    rs("add9dqu")="���ϵ���"
    rs.update
end if
if rs("addsheng")="����ʡ" or rs("addsheng")="����ʡ" or rs("addsheng")="������ʡ" then
    rs("dqu")=7
    rs("add9dqu")="��������"
    rs.update
end if
if rs("addsheng")="̨��ʡ" or rs("addsheng")="����ر�������" or rs("addsheng")="�����ر�������" then
    rs("dqu")=8
    rs("add9dqu")="�۰�̨����"
    rs.update
end if
%>
<%
sql_tx="select * from txifok where username = '"&id&"'"
Set rs_tx= Server.CreateObject("ADODB.Recordset") 
rs_tx.open sql_tx,conn9,2,3
if rs_tx.eof and rs_tx.bof then
  rs_tx.addnew
  rs_tx("username")=rs("username")
  rs_tx("up")=rs("up")
  rs_tx("password3")=rs("password3")
  rs_tx("name")=rs("name")
  rs_tx("call")=rs("call")
  rs_tx.update
end if
%>
<%
response.redirect "index.asp?id="&id&""
%>