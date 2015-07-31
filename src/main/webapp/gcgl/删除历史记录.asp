<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<%
Set rs_gl = Server.CreateObject("ADODB.Recordset") 
sql_gl ="delete * from datepay where id<1287344"
rs_gl.open sql_gl,conn9,2,3
%>
<%
Set rs_gc = Server.CreateObject("ADODB.Recordset") 
sql_gc ="delete * from gcfh where id>6556 and id<163803"
rs_gc.open sql_gc,conn9,2,3
%>
<%
Set rs_bd = Server.CreateObject("ADODB.Recordset") 
sql_bd ="delete * from bdbdate where id<215513"
rs_bd.open sql_bd,conn1,2,3
%>
<%
Set rs_gp = Server.CreateObject("ADODB.Recordset") 
sql_gp ="delete * from gpjy where id>6557 and id<513725"
rs_gp.open sql_gp,conn2,2,3
%>
<%
Set rs_dl = Server.CreateObject("ADODB.Recordset") 
sql_dl ="delete * from dateip where id<581239"
rs_dl.open sql_dl,conn1,2,3
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
</body> 
</html>