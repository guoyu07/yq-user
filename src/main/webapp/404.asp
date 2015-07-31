<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Dim nUrl,nUser
	nUrl = Request.QueryString
	nUrl = Mid(nUrl,5)
	If InStr(nUrl,"?")>0 Then nUrl = Mid(nUrl,1,InStr(nUrl,"?")-1)
	If Right(nUrl,1) = "/" Then nUrl = Left(nUrl,Len(nUrl)-1)
	If InStrRev(nUrl,"/")>0 Then nUser = Mid(nUrl,InStrRev(nUrl,"/")+1)

If Not IsNull(nUser) And Not IsEmpty(nUser) And Len(nUser) > 0 Then
	'Server.Transfer("/index.asp")
	Response.Redirect("/reg.asp?id="& nUser)
Else
	'Response.Status=404
	Response.Write("http://www.zgyce.com")
End if
%>
