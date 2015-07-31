<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
lkid=request("lkid")
lksl=request("lksl")
gmmj=request("mj")
cjpay=request("jbpay")
%>
<%
response.cookies("lsyh")=""
response.redirect"/0625fhk/pdfhk0102/xtbfk007.asp?lkid="&lkid&"&mj="&gmmj&"&lksl="&lksl&""
%>