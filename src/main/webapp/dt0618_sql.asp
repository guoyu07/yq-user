<%
TxtIP="118.123.17.97"'ip
TxtUID="gckt0730"'数据库用户
TxtPWD="kt0730ok2"'数据库密码
TxtDB="gcd09"'数据库名
connstr9 = "driver={SQL Server};server="&TxtIP&";uid="&TxtUID&";pwd="&TxtPWD&";database="&TxtDB
Set conn9 = Server.CreateObject("ADODB.Connection")
conn9.open connstr9'打开数据库连接字符串。不出错就是连接成功。
%>