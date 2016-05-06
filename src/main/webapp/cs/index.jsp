<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>会员搜索</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table width="100%" border="1" height="72" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">会员搜索</font></b></td>
    </tr>
    <tr>
      <td height="48" align="center" bgcolor="#C3DAF9">
		<form name="form" method="POST" action="searchUser">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 9pt">&nbsp;<input type="text" name="user" size="20"> <input type="submit" name="Submit" value="搜索">&nbsp;&nbsp;&nbsp; </span>
		<b>&nbsp; <a href="/cslogin" style="text-decoration: none">返回登录</a></b></p>
		</form></td>
    </tr>
  </table>
</div>
<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<iframe name="I1" width="100%" align="center" border="0" frameborder="0" src="chargeRecord" marginwidth="1" marginheight="1" height="100%"></iframe></p>
</body> 
</html>