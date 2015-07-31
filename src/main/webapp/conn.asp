<%
	on error resume next
	session.Timeout = 20
	dim conn,connstr,db
	db = "./abc--1.mdb"
	set conn = server.CreateObject("ADODB.Connection")
	connstr = "Provider=Microsoft.Jet.Oledb.4.0;data source="&server.MapPath(db)
	conn.open connstr
%>