<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('还不是正式管理不可以修改！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('省级管理已被占用了！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('市级管理已被占用了！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('区级管理已被占用了！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('大区级管理已被占用了！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('修改成功！');location.href='dluser?uid=${uid}';</script></c:if>
<title>管理员设置</title>
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
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.dldate.value=="") {      alert("还不是正式管理!");      return false;    } 
  if (Form.dqdate.value=="") {      alert("还不是正式管理!");      return false;    }  
  return true;  }  
 </script>
<form name="form" METHOD="POST" action="dluser?status=1&uid=${uid}">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="123">
      <tr bgcolor="#ffffdd"> 
      <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><span style="font-size: 11pt">管理员设置</span></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
      <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>会员号：</b></td>
      <td align="right" width="57%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p align="left"><font color="#FF0000">${uid}&nbsp;&nbsp; 级别</font><b><font color="#0000FF">${gcuser.jb}</font></b><font color="#FF0000">&nbsp;&nbsp; </font>1大区<font color="#FF0000">&nbsp; </font>2省 3市 4区/县</td>
      </tr>
      <tr bgcolor="#ffffdd"> 
      <td align="right" width="98%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" colspan="2"><p align="center"><font size="2"><a style="text-decoration: none" onClick="return confirm('提示：您确定给 ${uid} 设置成为省级管理吗？ ')" href="csheng?uid=${uid}" >设置省级管理</a>&nbsp;&nbsp;<a style="text-decoration: none" onclick="return confirm('提示：您确定给 ${uid} 设置成为市级管理吗？ ')" href="cshi?uid=${uid}" ><font color="#FF00FF">设置市级管理</font></a>&nbsp;&nbsp;<a style="text-decoration: none" onclick="return confirm('提示：您确定给 ${uid} 设置成为区/县级管理吗？ ')" href="carea?uid=${uid}"><font color="#800000">设置区/县级管理</font></a>&nbsp;&nbsp;<a style="text-decoration: none" onclick="return confirm('提示：您确定给 ${uid} 设置成为大区级管理吗？ ')" href="cbigarea?uid=${uid}"><font color="#000000">设置大区级管理</font></a></font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
       <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">正式管理级别：</td>
       <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><select size="1" name="jb">
		<option selected value="${gcuser.jb}">${gcuser.jb}</option>
			<option value="0">撒消管理(0)</option>
			<option value="1">大区级管理(1)</option>
			<option value="2">省级管理(2)</option>
			<option value="3">市级管理(3)</option>
			<option value="4">区/县级管理(4)</option></select>&nbsp; 1大区<font color="#FF0000">&nbsp; </font>2省 3市 4区/县</td>
      </tr>
      <tr>
      <td align="right" width="41%" height="37" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">开始时间：</td>
      <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="dldate" size="20" value="<fmt:formatDate value="${gcuser.dldate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">到期时间：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="dqdate" size="20" value="<fmt:formatDate value="${gcuser.dqdate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>"></td>
      </tr>
      <tr> 
      <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="33"><div align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="确定修改" class="lkbtn"></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>