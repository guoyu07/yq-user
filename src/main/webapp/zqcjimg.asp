<%
dim db1,connstr1
db1="../cftogo\cftogolog.mdb"
set conn1 = server.CreateObject("ADODB.Connection")
connstr1="DBQ="&server.mappath(db1)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn1.Open connstr1
%>