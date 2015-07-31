<%
dim dbth,connstrth
dbth="../enter\enter.mdb"
set connth = server.CreateObject("ADODB.Connection")
connstrth="DBQ="&server.mappath(dbth)&";DRIVER={Microsoft Access Driver (*.mdb)};"
connth.Open connstrth
%>