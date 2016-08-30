<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('标题不能为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('内容不能为空！');history.go(-1);</script></c:if>
<html><head><title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../images/css.css" rel="stylesheet" type="text/css">
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "宋体"; font-size: 9pt ;line-height: 18px;}
-->
</style>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">
<span style="font-size: 9pt">

</body>
</html>
</span>
<div align="center">
<form name="form1" method="POST" action="/admin/addnotice?status=1">
    <div align="center">
      <center>
    　<table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="359">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"><b><span style="font-size: 11pt">添加公告</span></b></td>
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"><b><span style="font-size: 11pt">add notice</span></b></td>
      </tr>
      <tr> 
        <td align="right" width="10%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">公告标题：</td>
        <td width="30%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input name="title" size="105"></td>
        <td align="left" width="10%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">notice title：</td>
        <td width="30%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input name="title_en" size="105"></td>
      </tr>
      <tr> 
      	<th>
	      	<tr>
	        <td align="right" width="5%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">公告内容：</td>
	        <td width="45%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><textarea rows="25" name="content" cols="110"></textarea></td>
	        <td align="left" width="5%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF">notice content：</td>
	        <td width="45%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><textarea rows="25" name="content_en" cols="110"></textarea></td>
	      	</tr>
      	</th>
      </tr>
      <tr> 
        <td align="center" colspan="4" width="100%" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="22"><div align="center"><input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="添加公告" class="lkbtn"></div></td>
      </tr>
    </table>
      </center>
    </div>
</div>
</form>