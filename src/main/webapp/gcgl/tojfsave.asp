<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
userid=request("jfid")
%>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,2,3
ylpay=rs("pay")
yljyg=rs("jyg")
rs("pay")=rs("pay")-request("jfpay")
rs("jyg")=rs("jyg")+request("jfpay")
rs.update
%>
<%
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM datepay"
rs_d1.open sql_d1,conn9,2,3
rs_d1.addnew
rs_d1("username")=userid
rs_d1("regid")="换积分"
rs_d1("jc")=request("jfpay")
rs_d1("pay")=rs("pay")
rs_d1("jydb")=rs("jydb")
rs_d1.update
%>
<%
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from gpjy "
rs1.open sql1,conn2,2,3
rs1.addnew
rs1("username")=userid
rs1("mysl")=request("jfpay")
rs1("sysl")=rs("jyg")
rs1("bz")="EP换积分"
rs1("cgdate")=Now()
rs1("jy")=1
rs1.update
%>
<div align="center">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<p align="center"><font color="#FF0000"><%=rs("username")%></font>修改成功</p>
			<p align="center">原EP总额为：<font color="#800000"><%=ylpay%></font>&nbsp; 换积分后为：<%=rs("pay")%></p>
			<p align="center">原积分为：<b><%=yljyg%></b> 换后为：<font color="#800000"><b><%=rs("jyg")%></b></font></p>
			</td>
		</tr>
	</table>
	<p align="center"><b><a href="eptojf.asp?jfid=<%=userid%>" style="text-decoration: none">返回</a></b></div>