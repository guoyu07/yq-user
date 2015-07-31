<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
response.cookies("lsyh")=""
%>
<%
Dim StrSQL0,rs0
Set rs0 = server.CreateObject("ADODB.Recordset")
StrSQL0 = "SELECT * FROM gcuser where jyg>50000 and jygt1=0 "
rs0.Open StrSQL0, Conn2,2,3
While Not rs0.EOF
    rs0("jygdate")=now()
    rs0("jygt1")=1
    rs0.MoveNext
Wend
rs0.UpdateBatch
%>
<%
Dim StrSQL1,rs1
Set rs1 = server.CreateObject("ADODB.Recordset")
StrSQL1 = "SELECT * FROM gcuser where jyg<50000 and jygt1=1 "
rs1.Open StrSQL1, Conn2,2,3
While Not rs1.EOF
    rs1("jygdate")=abcd
    rs1("jygt1")=0
    rs1.MoveNext
Wend
rs1.UpdateBatch
%>
<%
Dim StrSQL2,rs2
Set rs2 = server.CreateObject("ADODB.Recordset")
StrSQL2 = "SELECT * FROM gcuser where jydb>30 and dbt1=0 "
rs2.Open StrSQL2, Conn2,2,3
While Not rs2.EOF
    rs2("dbdate")=now()
    rs2("dbt1")=1
    rs2.MoveNext
Wend
rs2.UpdateBatch
%>
<%
Dim StrSQL3,rs3
Set rs3 = server.CreateObject("ADODB.Recordset")
StrSQL3 = "SELECT * FROM gcuser where jydb<30 and dbt1=1 "
rs3.Open StrSQL3, Conn2,2,3
While Not rs3.EOF
    rs3("dbdate")=abcd
    rs3("dbt1")=0
    rs3.MoveNext
Wend
rs3.UpdateBatch
%>
<%
dim rs4,sql4
set rs4 = Server.CreateObject("ADODB.Recordset")
sql4="select * from fcxt where id =2 and jy5w>3000000"
rs4.open sql4,conn2,2,3
if not rs4.eof then
rs4("jy5w")=rs4("jy5w")-3000000
rs4("dqgj")=rs4("dqgj")+0.01
rs4("jygj")=rs4("jygj")+0.01
rs4("zgj")=rs4("zgj")+0.01
rs4.update
end if
%>
<% 
'sql_xt="select sum(jyg) as ljyg from gcuser where sjb>0" 
'Set rs_xt= Server.CreateObject("ADODB.Recordset") 
'rs_xt.open sql_xt,conn2,1,1
%>
<% 
'sql_xt0="select sum(jyg) as ljyg0 from gcuser where sjb=0" 
'Set rs_xt0= Server.CreateObject("ADODB.Recordset") 
'rs_xt0.open sql_xt0,conn2,1,1
%>
<%
dim rs_sq,sql_sq
set rs_sq = Server.CreateObject("ADODB.Recordset")
sql_sq ="select * from fcxt where id =2 "
rs_sq.open sql_sq,conn2,2,3
mqbz=rs_sq("payadd")
sqbz=rs_sq("payadd")-1
lastname=rs_sq("lname")
%>
<%
Set rs_lid= Server.CreateObject("ADODB.Recordset")
sql_lid="select * from sgxt where username = '"&lastname&"'" 
rs_lid.open sql_lid,conn7,1,1
lastid=rs_lid("id")
%>
<% 
sql_nd="select sum(sjb) as ljnd from sgxt where id>"&lastid&"" 
Set rs_nd= Server.CreateObject("ADODB.Recordset") 
rs_nd.open sql_nd,conn7,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>代理商家会员搜索</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<link rel="stylesheet" type="text/css" href="../css.css">
</head>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="117" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif"><b>
		<font size="2">代理会员搜索</font></b></td>
    </tr>
    <tr>
      <td height="86" align="center" bgcolor="#C3DAF9">
        <form name="form1" method="POST" action="searchuserok.asp">
          <span style="font-size: 9pt">&nbsp;<input type="text" name="user" size="20">
          <input type="submit" name="Submit" value="搜索"> 输入该会员的ID或者真实姓名、QQ均可</span></form>
      </td>
    </tr>
  </table>
</div> 
<p><span style="font-size: 9pt"><%'rs_xt("ljyg")%></span></p>
<p><span style="font-size: 9pt"><%'rs_xt0("ljyg0")%></span></p>
<p><span style="font-size: 9pt"><%=lastname%></span></p>
<p><span style="font-size: 9pt"><%=lastid%></span></p>
<p><span style="font-size: 9pt"><%=rs_nd("ljnd")%></span></p>
</body> 
</html>