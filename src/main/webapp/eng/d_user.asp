<!--#include file="../mq0618ert.asp"-->
<%
'''''''''''所有用户   非常耗时,警惕操作, 
strSQL = "SELECT username from sgxt order by id "
SET rs1 = Conn7.Execute(strSQL)
Do While Not rs1.EOF
	x = 1
	upuser = rs1(0)
	Response.Write(upuser & ",")
	zysjb = Conn7.Execute("select sjb from sgxt where username = '" & upuser & "'")(0)
	cup(upuser)
	Response.Write("<hr />")
	rs1.MoveNext
Loop
rs1.Close : SET rs1 = Nothing

Function cup(user)
	strSQL = Replace("SELECT TOP 1 username,buid FROM sgxt WHERE auid = '{0}' OR buid = '{0}'", "{0}", user)
	SET rs_ks = Conn7.Execute(strSQL)
	If rs_ks.Eof Then
		Response.Write(" Altogether " & x - 1 & " Layer")
		Exit Function
	End If
	If Not rs_ks.EOF Then
		zy = "左"
		strDEL = "DELETE FROM zuo_mingxi WHERE tjuser = '" & rs_ks(0) & "' AND down = '" & upuser & "' AND count = " & x
		strADD = "INSERT INTO zuo_mingxi (tjuser,down,count,sjb) VALUES ('" & rs_ks(0) & "','" & upuser & "'," & x & "," & zysjb & ")"
		If user = rs_ks("buid") Then
		zy = "右"
		strDEL = "DELETE FROM you_mingxi WHERE tjuser = '" & rs_ks(0) & "' AND down = '" & upuser & "' AND count = " & x
		strADD = "INSERT INTO you_mingxi (tjuser,down,count,sjb) VALUES ('" & rs_ks(0) & "','" & upuser & "'," & x & "," & zysjb & ")"
		End If
		Conn7.Execute(strDEL)
		Conn7.Execute(strADD)
		Response.Write(rs_ks(0) & "(" & zy & "),")
		newuser = rs_ks(0)
		x = x + 1
		Response.Flush()
	End If
	cup(newuser)
End Function
%>