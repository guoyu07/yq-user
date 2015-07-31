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
	response.write "<script language=javascript>alert('网络连接超时,请重新登陆!');top.location.href='melogin.asp';</script>"
response.end
End if
%>