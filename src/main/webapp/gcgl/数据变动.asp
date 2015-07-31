<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="../zqcjimg.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser "
rsTest.Open StrSQL, Conn2,2,3
While Not rsTest.EOF
if rsTest("dldate")<>"" and rsTest("dqdate")<>"" then
   rsTest("bz1")=1
end if
rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
Dim StrSQL0,rs0
Set rs0 = server.CreateObject("ADODB.Recordset")
StrSQL0 = "SELECT * FROM gcuser where jb=0 and sjb=0 and gdgc<50 and pay<50 and jyg<60 and payok=0 and bz1=0 and DateDiff('d',date(),regtime)<-10"
'StrSQL0 = "SELECT * FROM gcuser where password='0' and password3='0' and DateDiff('d',date(),regtime)<-10"
rs0.Open StrSQL0,Conn2,2,3
While Not rs0.EOF
   Set rs_up = server.CreateObject("ADODB.Recordset")
   StrSQL = "SELECT * FROM gcuser where up ='"&rs0("username")&"'"'//先找上级属于rs0的人
   rs_up.Open StrSQL,Conn2,2,3
   While Not rs_up.EOF
   set rs_my = Server.CreateObject("ADODB.Recordset")
   sql_my = "SELECT * FROM gcuser where username='"&rs_up("username")&"'"
   rs_my.open sql_my,conn2,2,3
   rs_my("up")=rs0("up")
   rs_my.update
   rs_up.MoveNext
   Wend
   rs_up.UpdateBatch

Set rs_gl = Server.CreateObject("ADODB.Recordset") 
sql_gl ="delete * from datepay where username = '"&rs0("username")&"'"
rs_gl.open sql_gl,conn9,2,3

Set rs_tx = Server.CreateObject("ADODB.Recordset") 
sql_tx ="delete * from txpay where payusername = '"&rs0("username")&"'"
rs_tx.open sql_tx,conn1,2,3

Set rs_txor = Server.CreateObject("ADODB.Recordset") 
sql_txor ="delete * from txifok where username = '"&rs0("username")&"'"
rs_txor.open sql_txor,conn9,2,3

Set rs_bd = Server.CreateObject("ADODB.Recordset") 
sql_bd ="delete * from bdbdate where zuser = '"&rs0("username")&"'"
rs_bd.open sql_bd,conn1,2,3

Set rs_gc = Server.CreateObject("ADODB.Recordset") 
sql_gc ="delete * from gcfh where userid = '"&rs0("username")&"'"
rs_gc.open sql_gc,conn9,2,3

Set rs_gp = Server.CreateObject("ADODB.Recordset") 
sql_gp ="delete * from gpjy where username = '"&rs0("username")&"'"
rs_gp.open sql_gp,conn2,2,3

Set rs_dl = Server.CreateObject("ADODB.Recordset") 
sql_dl ="delete * from dateip where user = '"&rs0("username")&"'"
rs_dl.open sql_dl,conn1,2,3

set rs_user = Server.CreateObject("ADODB.Recordset")
sql_user = "delete * FROM gcuser where username = '"&rs0("username")&"'"
rs_user.open sql_user,conn2,2,3
rs0.MoveNext
Wend
rs0.UpdateBatch
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