<%
Function CheckPermission()
	If Session("cjlog")<>"" then 
		checkPermission=TRUE
	Else
		checkPermission=FALSE
	End if
End Function

Dim Tmpadmin
Tmpadmin = CheckPermission()
If Tmpadmin <> TRUE then
	response.write "<script language=javascript>alert('�������ӳ�ʱ,�����µ�½!');top.location.href='melogin.asp';</script>"
response.end
End if
%>