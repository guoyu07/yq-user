<%
	ygid=request.cookies("regid")
	response.cookies("username")=""
	response.cookies("password")=""
	response.cookies("regid")=""
    response.redirect"../index.asp"
%>