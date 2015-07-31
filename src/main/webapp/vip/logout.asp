<%
	ygid=request.cookies("regid")
	response.cookies("username")=""
	response.cookies("password")=""
	response.cookies("regid")=""
	response.redirect "/vgo/tqdl.asp?dl="&ygid&""
    'response.redirect"login.asp"
%>