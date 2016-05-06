<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码不正确!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能撒消，请选择其它交易！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('撤销求购积分成功！');location.replace('/mcsl');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.nm3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  return true;  }  
 </script>
<form method="POST" action="qxyjg?status=1&qxid=${qxid}"  name="Form" onSubmit="return checkdate()">
	<p align="center">　</p>
	<p align="center">请输入<font color="#FF0000">${userName}</font>的二级密码：<input type="password" name="pa3" size="20">&nbsp; <input type="submit" value="确认无误" name="B1"></p>
</form>