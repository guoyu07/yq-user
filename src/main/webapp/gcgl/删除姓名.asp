<!--#include file="../ct0618.asp"-->
<!--#include file="../dt0618.asp"-->
<!--#include file="../mq0618.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM gcuser where name='林玉' and sjb=0 order by id asc"
rsTest.Open StrSQL,Conn2,2,3
While Not rsTest.EOF
   rsTest("up")="300fhk"
   rsTest("gdgc")=0
   rsTest("pay")=0
   rsTest("jyg")=0
   rsTest("jydb")=0
   rsTest("cbpay")=0
   rsTest("txpay")=0
   rsTest("ljsy")=0
   rsTest("jjsy")=0
   rsTest("sytx")=0
   rsTest("fhsy")=0
   rsTest("ljfh")=0
   rsTest("password")=0
   rsTest("password3")=0
   rsTest("bank")=""
   rsTest("card")=""
   rsTest("call")=""
   rsTest("qq")=""
   rsTest("email")=""
   rsTest("add9dqu")=""
   rsTest("addsheng")=""
   rsTest("addshi")=""
   rsTest("addqu")=""
   rsTest("dldate")=abcd
   rsTest("dqdate")=abcd
   rsTest.update
set rs_datepay = Server.CreateObject("ADODB.Recordset")
sql_datepay = "delete * FROM datepay where username = '"&rsTest("username")&"'"
rs_datepay.open sql_datepay,conn9,2,3

set rs_txpay = Server.CreateObject("ADODB.Recordset")
sql_txpay = "delete * FROM txpay where payusername = '"&rsTest("username")&"'"
rs_txpay.open sql_txpay,conn9,2,3

set rs_gcfh = Server.CreateObject("ADODB.Recordset")
sql_gcfh = "delete * FROM gcfh where userid = '"&rsTest("username")&"'"
rs_gcfh.open sql_gcfh,conn9,2,3

set rs_gpjy = Server.CreateObject("ADODB.Recordset")
sql_gpjy = "delete * FROM gpjy where username = '"&rsTest("username")&"'"
rs_gpjy.open sql_gpjy,conn2,2,3
rsTest.MoveNext
Wend
rsTest.UpdateBatch
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