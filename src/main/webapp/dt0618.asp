<%
dim db2,connstr9
db2="../cf9dl\cf9dldate.mdb"
set conn9 = server.CreateObject("ADODB.Connection")
connstr9="DBQ="&server.mappath(db2)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn9.Open connstr9
%>