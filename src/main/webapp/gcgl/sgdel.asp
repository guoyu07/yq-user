<!--#include file="../ct061800.asp"-->
<!--#include file="../mq061800.asp"-->
<%
'��ʼ��myid����
myid=request("my")
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&myid&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof or rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('���û������ڻ��Ѿ�����˫����Ա�����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
'��ʼ���±�sgxtuser�����ϼ�
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM sgxt where username = '"&myid&"'"
rs0.open sql0,conn7,2,3
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('�����˲����ڣ����������Ƿ���ȷ��');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs0("auid")<>"" or rs0("buid")<>"" then
   response.write "<script language='javascript'>"
   response.write "alert('��߻��ұ����ˣ�����ɾ����');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
	Call CalculateQ(myid)

Function CalculateQ(userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM sgxt where auid = '"&userName&"' or buid='"&userName&"'"
	'Response.write sql_Calculate&"<br>"

	rs_Calculate.open sql_Calculate,conn7,2,3
	If rs_Calculate.eof Or rs_Calculate.bof Then
	Exit Function
	End If
	
	if rs_Calculate("auid")=userName Then
	rs_Calculate("zaq")=rs_Calculate("zaq")-rs("sjb")'myup�����(A)�ܵ���+
	rs_Calculate("aq")=rs_Calculate("aq")-rs("sjb")
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName then'������߶�������0Ҳ����������
	rs_Calculate("zbq")=rs_Calculate("zbq")-rs("sjb")'myup���ұ�(B)�ܵ���+
	rs_Calculate("bq")=rs_Calculate("bq")-rs("sjb")
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'������߼�
	End if
 
End Function

%>
<%
Response.write "<center>"
Response.write "��Ҫ��ʾ��ϵͳ���ں�����...��ֹͣ��������������Ҫ�رձ�ҳ��"
StrSQL = "SELECT * FROM zuo_mingxi WHERE down='"&myid&"' order by id"
set rs_tjzuo = conn7.execute(StrSQL)
While Not rs_tjzuo.EOF
  StrSQL = "SELECT sum(sjb) as zuosjb FROM zuo_mingxi WHERE tjuser='"&rs_tjzuo("tjuser")&"' and count="&rs_tjzuo("count")&""
  set rs_tjzb = conn7.execute(StrSQL)
  While Not rs_tjzb.EOF
If rs_tjzb("zuosjb")>0 then
   sjtjzb=rs_tjzb("zuosjb")-rs("sjb")
else
   sjtjzb=0
End if
   set rs_d3 = Server.CreateObject("ADODB.Recordset")
   sql_d3 = "SELECT * FROM sgxt WHERE username='"&rs_tjzuo("tjuser")&"'"
   rs_d3.open sql_d3,Conn7,2,3
IF rs_tjzuo("count")=16 Then
   rs_d3("16z")=sjtjzb
elseif rs_tjzuo("count")=15 then
   rs_d3("15z")=sjtjzb
elseif rs_tjzuo("count")=14 then
   rs_d3("14z")=sjtjzb
elseif rs_tjzuo("count")=13 then
   rs_d3("13z")=sjtjzb
elseif rs_tjzuo("count")=12 then
   rs_d3("12z")=sjtjzb 
elseif rs_tjzuo("count")=11 then
   rs_d3("11z")=sjtjzb
elseif rs_tjzuo("count")=10 then
   rs_d3("10z")=sjtjzb
elseif rs_tjzuo("count")=9 then
   rs_d3("9z")=sjtjzb
elseif rs_tjzuo("count")=8 then
   rs_d3("8z")=sjtjzb
elseif rs_tjzuo("count")=7 then
   rs_d3("7z")=sjtjzb
elseif rs_tjzuo("count")=6 then
   rs_d3("6z")=sjtjzb
elseif rs_tjzuo("count")=5 then
   rs_d3("5z")=sjtjzb
elseif rs_tjzuo("count")=4 then
   rs_d3("4z")=sjtjzb
elseif rs_tjzuo("count")=3 then
   rs_d3("3z")=sjtjzb
elseif rs_tjzuo("count")=2 then
   rs_d3("2z")=sjtjzb
elseif rs_tjzuo("count")=1 then
   rs_d3("1z")=sjtjzb
End if
   rs_d3.update
   rs_tjzb.MoveNext
   Wend
rs_tjzuo.MoveNext
Wend
Rs_tjzuo.close
Set Rs_tjzuo=Nothing
%>
<%
StrSQL = "SELECT * FROM you_mingxi WHERE down='"&myid&"' order by id"
set rs_tjyou = conn7.execute(StrSQL)
While Not rs_tjyou.EOF
  StrSQL = "SELECT sum(sjb) as yousjb FROM you_mingxi WHERE tjuser='"&rs_tjyou("tjuser")&"' and count="&rs_tjyou("count")&""
  set rs_tjyb = conn7.execute(StrSQL)
  While Not rs_tjyb.EOF
If rs_tjyb("yousjb")>0 then
   sjtjyb=rs_tjyb("yousjb")-rs("sjb")
else
   sjtjyb=0
End if
   set rs_d4 = Server.CreateObject("ADODB.Recordset")
   sql_d4 = "SELECT * FROM sgxt WHERE username='"&rs_tjyou("tjuser")&"'"
   rs_d4.open sql_d4,Conn7,2,3
IF rs_tjyou("count")=16 Then
   rs_d4("16y")=sjtjyb
elseif rs_tjyou("count")=15 then
   rs_d4("15y")=sjtjyb
elseif rs_tjyou("count")=14 then
   rs_d4("14y")=sjtjyb
elseif rs_tjyou("count")=13 then
   rs_d4("13y")=sjtjyb
elseif rs_tjyou("count")=12 then
   rs_d4("12y")=sjtjyb
elseif rs_tjyou("count")=11 then
   rs_d4("11y")=sjtjyb
elseif rs_tjyou("count")=10 then
   rs_d4("10y")=sjtjyb
elseif rs_tjyou("count")=9 then
   rs_d4("9y")=sjtjyb
elseif rs_tjyou("count")=8 then
   rs_d4("8y")=sjtjyb
elseif rs_tjyou("count")=7 then
   rs_d4("7y")=sjtjyb
elseif rs_tjyou("count")=6 then
   rs_d4("6y")=sjtjyb
elseif rs_tjyou("count")=5 then
   rs_d4("5y")=sjtjyb
elseif rs_tjyou("count")=4 then
   rs_d4("4y")=sjtjyb
elseif rs_tjyou("count")=3 then
   rs_d4("3y")=sjtjyb
elseif rs_tjyou("count")=2 then
   rs_d4("2y")=sjtjyb
elseif rs_tjyou("count")=1 then
   rs_d4("1y")=sjtjyb
End if
   rs_d4.update
   rs_tjyb.MoveNext
   Wend
rs_tjyou.MoveNext
Wend
Rs_tjyou.close
Set Rs_tjyou=Nothing
%>
<%
set rs_aq = Server.CreateObject("ADODB.Recordset")
sql_aq = "SELECT * FROM sgxt where auid = '"&myid&"'"
rs_aq.open sql_aq,conn7,2,3
if not rs_aq.eof then
   rs_aq("auid")=""
   rs_aq.update
end if
%>
<%
set rs_bq = Server.CreateObject("ADODB.Recordset")
sql_bq = "SELECT * FROM sgxt where buid = '"&myid&"'"
rs_bq.open sql_bq,conn7,2,3
if not rs_bq.eof then
   rs_bq("buid")=""
   rs_bq.update
end if
%>
<%
Set rs_zuo = server.CreateObject("ADODB.Recordset")
StrSQL = "delete * FROM zuo_mingxi WHERE down='"&myid&"'"
rs_zuo.Open StrSQL, Conn7,2,3
%>
<%
Set rs_you = server.CreateObject("ADODB.Recordset")
StrSQL = "delete * FROM you_mingxi WHERE down='"&myid&"'"
rs_you.Open StrSQL, Conn7,2,3
%>
<%
set rs_d = Server.CreateObject("ADODB.Recordset")
sql_d = "delete * FROM sgxt where username = '"&myid&"'"
rs_d.open sql_d,conn7,2,3
%>
<%
'set rs_user = Server.CreateObject("ADODB.Recordset")
'sql_user = "delete * FROM gcuser where username = '"&myid&"'"
'rs_user.open sql_user,conn2,2,3
response.Write "<script language=javascript>alert('ɾ���ɹ���������');location.href='sgdel.asp?my='</script>"
%>