<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
Set rs_admin = Server.CreateObject("ADODB.Recordset")
sql="select * from fcxt where adminusername = 'admin'"
rs_admin.open sql,conn2,2,3
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
  <table width="100%" border="1" height="117" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif">　</td>
    </tr>
    <tr>
      <td height="86" align="center" bgcolor="#C3DAF9">
        <form name="form" method="POST" action="vipgjok.asp">
          <b>当前固定股价是：<font color="#FF0000"><%=rs_admin("dqgj")%></font></b><p><span style="font-size: 9pt">
			<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." --><input type="text" name="gj" size="10" ><input type="submit" name="Submit" value="确定修改"></span></p>
		</form>
      </td>
    </tr>
  </table>
</div> 
<p>　</p>
<form method="POST" name="form2" action="ffok.asp">
	<p align="center">分红设置：<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="5" --><input type="text" name="ff" size="12" maxlength="5">&nbsp;<input type="submit" value="提交" name="B1"></p>
</form>
</body> 
</html>