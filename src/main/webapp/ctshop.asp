<!--#include file="abc123.asp"-->
<%
dim db3,connstr2
db3="cftogo\cftogouser.mdb"
set conn2 = server.CreateObject("ADODB.Connection")
connstr2="DBQ="&server.mappath(db3)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn2.Open connstr2
%>
<%
dim db2,connstr9
db2="cf9dl\cf9dldate.mdb"
set conn9 = server.CreateObject("ADODB.Connection")
connstr9="DBQ="&server.mappath(db2)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn9.Open connstr9
%>