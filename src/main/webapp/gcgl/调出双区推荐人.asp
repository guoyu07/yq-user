<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM sgxt where sjb>10 and id>6224 order by id "
rsTest.Open StrSQL,Conn7,1,1
While Not rsTest.EOF
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM gcuser where username='"&rsTest("username")&"'"
rs_my.open sql_my,conn2,1,1
   
Set rs_up = server.CreateObject("ADODB.Recordset")
sql_up = "SELECT * FROM gcuser where username ='"&rs_my("up")&"'"
rs_up.Open sql_up,Conn2,1,1
   
Set rs_sq = server.CreateObject("ADODB.Recordset")
sql_sq = "SELECT * FROM sgxtup"
rs_sq.Open sql_sq,Conn7,1,3 
rs_sq.addnew
rs_sq("username")=rsTest("username")
rs_sq("sjb")=rsTest("sjb")
rs_sq("bddate")=rsTest("bddate")
rs_sq("upname")=rs_up("name")
rs_sq("upuser")=rs_up("username")
rs_sq("upcall")=rs_up("call")
rs_sq("upqq")=rs_up("qq")
rs_sq.update
rsTest.MoveNext
Wend
'rsTest.UpdateBatch
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>调出成功</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<link rel="stylesheet" type="text/css" href="../css.css">
</head>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="117" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif"><b><font size="2">调出成功</font></b></td>
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