<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
userid=request("sfid")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,2,3
ylpay=rs("pay")
rs("pay")=rs("pay")-request("sfpay")
rs("fhpay")=rs("fhpay")-request("sfpay")
rs("vippay")=rs("vippay")-request("sfpay")
rs("txpay")=rs("txpay")+request("sfpay")
rs.update
if rs("vippay")<0 then
   rs("vippay")=0
   rs.update
end if
if rs("fhpay")<0 then
   rs("fhpay")=0
   rs.update
end if
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=userid
rs_d1("regid")=request("sflb")
rs_d1("jc")=request("sfpay")
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
%>
<div align="center">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<p align="center"><font color="#FF0000"><%=rs("username")%></font>修改成功</p>
			<p align="center">原EP总额为：<font color="#800000"><%=ylpay%></font>&nbsp; </p>
			<p align="center">消费后为：<b><font color="#FF0000"><%=rs("pay")%></font></b></p>
			</td>
		</tr>
	</table>
<p align="center"><b><a href="epsf.asp?sfid=<%=userid%>" style="text-decoration: none">返回</a></b></div>