<%
dim db,connstr2
db="/cftogo/cftogouser.mdb"
set conn2 = server.CreateObject("ADODB.Connection")
connstr2="DBQ="&server.mappath(db)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn2.Open connstr2
%>