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
  <table width="100%" border="1" height="117" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif">　</td>
    </tr>
    <tr>
      <td height="86" align="center" bgcolor="#C3DAF9">
        <form name="form" method="POST" action="vipjyjok.asp">
			<p>　</p>
			<p><font size="4"><b>交易价：</b></font><span style="font-size: 9pt"><font size="4"><!--webbot bot="Validation" S-Data-Type="Number" S-Number-Separators=",." I-Maximum-Length="10" --><input type="text" name="jygj" size="10" value="<%=rs_admin("jygj")%>" maxlength="10" ></font></span><b><font size="4"> 
			当前</font><font size="4" color="#FF0000"><%=rs_admin("jygj")%></font></b></p>
			<p><b><font size="4">最高价：<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="zgj" size="10" maxlength="10" value="<%=rs_admin("zgj")%>"> 
			当前<font color="#FF00FF"><%=rs_admin("zgj")%></font></font></b></p>
			<p><b><font size="4">最低价：<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="10" --><input type="text" name="zdj" size="10" maxlength="10" value="<%=rs_admin("zdj")%>"> 
			当前<font color="#800080"><%=rs_admin("zdj")%></font></font></b></p>
			<p><span style="font-size: 9pt"><input type="submit" name="Submit" value="确定修改"></span></p>
		</form>
      </td>
    </tr>
  </table>
</div> 
</body> 
</html>