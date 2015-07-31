<!--#include file=../dt0618.asp-->
<!--#include file="checkadmin.asp"-->
<%
cpbh=request("bh")
dim rs_cp,sql_cp
set rs_cp = Server.CreateObject("ADODB.Recordset")
sql_cp="select * from cpuser where cgid = "&cpbh&""
rs_cp.open sql_cp,conn9,2,3
rs_cp("fwdate")=Now()
rs_cp.update
%>
<% 
response.Write "<script language=javascript>alert('发货录入成功！');window.location.replace('cgcp.asp');</script>"
%>