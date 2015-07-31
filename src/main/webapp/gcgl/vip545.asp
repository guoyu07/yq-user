<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
<%
Set rs_admin = Server.CreateObject("ADODB.Recordset")
sql="select * from cfadmin where adminusername = 'admin'"
rs_admin.open sql,conn,3,2
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gj.value=="") {      alert("不能为空!");      return false;    } 
  return true;  }  
 </script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<link rel="stylesheet" type="text/css" href="../css.css">
</head>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border=height="117" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif">　</td>
    </tr>
    <tr>
      <td height="86" align="center" bgcolor="#C3DAF9">
        <form name="form" method="POST" action="vipjyjok.asp">
          <b>当前交易股价是：<font color="#FF0000"><%=rs_admin("jygj")%></font></b><p><span style="font-size: 9pt">&nbsp;<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." --><input type="text" name="56465" size="10" ></span></p>
		</form>
      </td>
    </tr>
  </table>
</div> 
</body> 
</html>