<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq061866.asp"-->
<%
'��ʼ��myid����
myid=request("my")
jsjb=request("bsjb")
%>
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&myid&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof or rs("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('�û�Ա�����ڻ��Ѿ���˫����Ա������Ҫ�ظ����������������Ƿ���ȷ��');"
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
	rs_Calculate("zaq")=rs_Calculate("zaq")+jsjb'myup�����(A)�ܵ���+
	rs_Calculate("aq")=rs_Calculate("aq")+jsjb'myup�����Ŀǰ����+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName then'������߶�������0Ҳ����������
	rs_Calculate("zbq")=rs_Calculate("zbq")+jsjb'myup���ұ�(B)�ܵ���+
	rs_Calculate("bq")=rs_Calculate("bq")+jsjb'myup���ұ�Ŀǰ����+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'������߼�
	End if
 
End Function

%>
<%
response.Write "<script language=javascript>alert('��ϲ��ͨ�ɹ�������ҵ���Ѹ��¡�������');location.href='searchg0701.asp'</script>"
'response.redirect "searchg0701.asp"
%>