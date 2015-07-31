<%
dim db7,connstr7
db7="../cf9dl\cf9dlsgxt.mdb"
set conn7 = server.CreateObject("ADODB.Connection")
connstr7="DBQ="&server.mappath(db7)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn7.Open connstr7
%>