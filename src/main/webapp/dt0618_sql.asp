<%
TxtIP="118.123.17.97"'ip
TxtUID="gckt0730"'���ݿ��û�
TxtPWD="kt0730ok2"'���ݿ�����
TxtDB="gcd09"'���ݿ���
connstr9 = "driver={SQL Server};server="&TxtIP&";uid="&TxtUID&";pwd="&TxtPWD&";database="&TxtDB
Set conn9 = Server.CreateObject("ADODB.Connection")
conn9.open connstr9'�����ݿ������ַ�����������������ӳɹ���
%>