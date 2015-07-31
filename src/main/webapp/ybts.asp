<%
dim db,connstr2
db="cftogo\cftogouser.mdb"
set conn2 = server.CreateObject("ADODB.Connection")
connstr2="DBQ="&server.mappath(db)&";DRIVER={Microsoft Access Driver (*.mdb)};"
conn2.Open connstr2
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&request("ybuser")&"'"
rs.open sql,conn2,2,3
if request("states")=0 then
rs("txlb")=3
rs.update
response.write "ÒÑÉóºË³É¹¦"
elseif request("states")=1 then
rs("txlb")=0
rs.update
response.write "Î´ÉóºË"
end if
%>