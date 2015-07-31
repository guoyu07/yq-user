<%
dim db0,connstr0
db0="/cf9dl/cf9dlsgxt.mdb"
set conn0 = server.CreateObject("ADODB.Connection")
connstr0="DBQ="&server.mappath(db0)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn0.Open connstr0
%>