<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipqxyjg.jsp.qxyjg.jsp.2022589602'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipqxyjg.jsp.qxyjg.jsp.-246756169'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipqxyjg.jsp.qxyjg.jsp.1013019213'/>！');location.replace('/mcsl');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.nm3.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='reg.jsp.reg.jsp.630954966'/>密码!");      return false;    } 
  return true;  }  
 </script>
<form method="POST" action="qxyjg?status=1&qxid=${qxid}"  name="Form" onSubmit="return checkdate()">
	<p align="center">　</p>
	<p align="center"><s:text name='vipupuser.jsp.upuser.jsp.35593833'/><font color="#FF0000">${userName}</font><s:text name='reg.jsp.reg.jsp.630954966'/>：<input type="password" name="pa3" size="20">&nbsp; <input type="submit" value="确认无误" name="B1"></p>
</form>
