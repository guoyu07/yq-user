<html>
<head>
<title>增值服务-管理登录</title>
</head>
<script language="javascript">
function checkdata() {
var Empty=false
if (Form.adminusername.value==""|| Form.password.value=="") {
alert("用户名、密码不能为空！");
Form.adminusername.focus();
Form.password.focus();
return (false);
}
return (true);
}
	  </script>
<body bgcolor="#EEEEEE" text="#000000" scroll="no">
<div align="center">
</body>
</html>
<br>
　<table width="575" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td style="font-family: 宋体; font-size: 9pt">
	　<p>　</p>
	<p align="center"><font color="#FF0000">
	<span style="font-size: 30pt; font-weight: 700">金币卡管理后台</span></font></p>
	<p>　</td>
  </tr><BR>
  <tr valign="top"> 
            <form name="Form" method="POST" action="glfk01.asp" onsubmit="return checkdata()">
    <td style="font-family: 宋体; font-size: 9pt"> 
      <table width="575" border="0" cellspacing="2" cellpadding="0" background="../images/2.gif" height="142">
        <tr>
          <td height="14" width="79" style="font-family: 宋体; font-size: 9pt">　</td>
          <td height="14" width="490" style="font-family: 宋体; font-size: 9pt">　</td>
        </tr>
        <tr>
          <td width="79" height="40" style="font-family: 宋体; font-size: 9pt">　</td>
          <td width="490" height="40" style="font-family: 宋体; font-size: 9pt"> 
            <table width="469" border="0" cellspacing="0" cellpadding="0" height="143">
              <tr>
        <td width="133" height="33" align="right" style="border-left: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" valign="middle" bgcolor="#FFFFFF" bordercolor="#336699"> 
          <font size="2">用户名：</font></td>
        <td width="71%" height="33" style="border-right: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" colspan="2" valign="middle" bgcolor="#FFFFFF" bordercolor="#336699"> 
            <font size="2"> 
            <input name="lkid" size="20" style="float: left" ></font></td>
    			</tr>
				<tr>
        <td width="133" height="29" style="border-left: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" align="right" bgcolor="#FFFFFF" bordercolor="#336699"> 
          <div align="right"><font size="2">密&nbsp;码：</font></div>
        </td>
        <td width="71%" height="29" style="border-right: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" colspan="2" bgcolor="#FFFFFF" bordercolor="#336699"> 
            <font size="2"> 
            <input type="password" name="fkpa" size="20" style="float: left"></font></td>
  			</tr>
				<tr>
        <td width="133" height="36" style="border-left: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" align="right" bgcolor="#FFFFFF" bordercolor="#336699"> 
<font size="2">验证码：</font></td>
        <td width="15%" height="36" style="border-right: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" bgcolor="#FFFFFF" bordercolor="#336699"> 
<font size="2">
<input name="ValidCode" size="8" style="float: left"></font></td>
        <td width="50%" height="36" style="border-right: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" bgcolor="#FFFFFF" bordercolor="#336699" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"> 
<font size="2">
<img src="../DVcode.asp" height="18" align="left"></font></td>
  			</tr>
				<tr>
        <td width="89%" height="45" colspan="3" align="center" style="border-left: 1px solid #C9D8AD; border-right: 1px solid #C9D8AD; border-bottom: 1px solid #C9D8AD; font-family:宋体; font-size:9pt" bgcolor="#FFFFFF" bordercolor="#336699">
          <div align="center">
            <input type="submit" name="Submit" value="进入管理中心" class="lkbtn"></div>
        </td>
  			</tr>
            </table>
          </td>
        </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td style="font-family: 宋体; font-size: 9pt">
    　</td>
  </tr>
</table>