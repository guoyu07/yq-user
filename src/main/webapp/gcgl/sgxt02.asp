<!--#include file="conn.asp"-->
<%
'��ʼ�ҿ�λ����myid
tuser=request("up")
myid=request("my")
sjb=request("sjb")
%>
<%
if sjb=1 then
   fd=2000
elseif sjb=3 then   
   fd=6000
elseif sjb=7 then   
   fd=14000
elseif sjb=14 then   
   fd=28000
elseif sjb=28 then   
   fd=56000
elseif sjb=56 then   
   fd=112000
end if
%>
<%
'��ʼ���±�sgxtuser�����ϼ�
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxtuser where username = '"&tuser&"'"
rs.open sql,conn,2,3
if rs.eof and rs.bof or tuser="0001" then
'�������һ���û���
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT top 1 * FROM sgxtuser order by id desc"
rs0.open sql0,conn,1,1
   myup=rs0("username")
else
   myup=rs("username")
end if
%>
<%
'ȡ���յõ��ϼ�myup�ļ�¼
set rs_myup = Server.CreateObject("ADODB.Recordset")
sql_myup = "SELECT * FROM sgxtuser where username = '"&myup&"'"
rs_myup.open sql_myup,conn,2,3
%>
<%
'Ȼ��������ϼ��Ƽ���������û������
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT * FROM sgxtuser where username = '"&myup&"'"
rs1.open sql1,conn,2,3
if rs1("auid")<>"" and rs1("buid")<>"" then'������߶������ڿ�Ҳ����������
   tj1=rs1("auid")'��ȡ��ߵ��û������Ƽ�
   tj2=rs1("buid")'�ұߵ��û�������
elseif rs1("auid")="" then'���������ߵ��ڿգ���myid�ͷ���myup���
    rs1("auid")=myid
    rs1.update
else'����myid����myup�ұ�
    rs1("buid")=myid
    rs1.update
end if

'�����������ˣ����ÿ��myup���涼û��������������˻��˳�����������������ˣ����Եÿ�ʼ�ղţ���tj1=rs1("auid")'��ȡ��ߵ��û������Ƽ�����
'��Ҫ�������ߵ�һ��tj1����ߺͱ߱�����ˣ�����myid��λ�ã��ٲ��еü�⣨��tj2=rs1("buid")'�ұߵ��û������á���������myid��λ��
'�����������ȥ����ֱ�����óɹ���
%>
<%
'���氲�ð��úú����±�sgxtuser�������ҵ�һ����¼
set rs_myid = Server.CreateObject("ADODB.Recordset")
sql_myid = "SELECT * FROM sgxtuser where username='"&myid&"'"
rs_myid.open sql_myid,conn,2,3
'If rs_myid.eof Or rs_myid.bof Then
rs_myid.addnew
rs_myid("username")=myid
rs_myid("sjb")=sjb '�ҵĵ���
rs_myid("fdpay")=fd'�ҵķⶥ����
rs_myid.update
%>


<%
	Call CalculateQ(myid)

Function CalculateQ(userName)
	set rs_Calculate = Server.CreateObject("ADODB.Recordset")
	sql_Calculate = "SELECT * FROM sgxtuser where auid = '"&userName&"' or buid='"&userName&"'"
	'Response.write sql_Calculate&"<br>"

	rs_Calculate.open sql_Calculate,conn,2,3
	If rs_Calculate.eof Or rs_Calculate.bof Then
	Exit Function
	End If
	
	if rs_Calculate("auid")=userName Then
	rs_Calculate("zaq")=rs_Calculate("zaq")+sjb'myup�����(A)�ܵ���+
	rs_Calculate("aq")=rs_Calculate("aq")+sjb'myup�����Ŀǰ����+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	ElseIf  rs_Calculate("buid")=userName then'������߶�������0Ҳ����������
	rs_Calculate("zbq")=rs_Calculate("zbq")+sjb'myup���ұ�(B)�ܵ���+
	rs_Calculate("bq")=rs_Calculate("bq")+sjb'myup���ұ�Ŀǰ����+
	rs_Calculate.update
	Call CalculateQ(rs_Calculate("username"))

	Else
	Exit Function'������߼�
	End if
 
End Function

'���һ�������������յ��ϼ���߰��úã�����ϼ�������������ҵĵ�������������ϼ����ұߣ�����ϼ����ұ������ҵĵ���sjb
'ͬʱ���ҵ�����ϼ�������˭�����棨�����ϼ��������������ϼ�������ң�����Ҳ����������ӵ���sjb
'ͬʱ�����ϼ�һ���أ�Ҳ��Ҫ�����㡣��������
'rs_myup("zaq")=rs_myup("zaq")+sjb'myup�����(A)�ܵ���+
'rs_myup("aq")=rs_myup("aq")+sjb'myup�����Ŀǰ����+
'rs_myup.date
'rs_myup("zbq")=rs_myup("zbq")+sjb'myup���ұ�(B)�ܵ���+
'rs_myup("bq")=rs_myup("bq")+sjb'myup���ұ�Ŀǰ����+
'rs_myup.date
%>






















