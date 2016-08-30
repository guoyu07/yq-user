<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipqxqg.jsp.qxqg.jsp.2022589602'/>！');location.replace('mysl');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipqxqg.jsp.qxqg.jsp.-791568500'/>！');location.replace('mysl');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipqxqg.jsp.qxqg.jsp.1013019213'/>！');location.replace('mysl');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script language="JavaScript"> 
function checkdate()  {  
  if (Form.nm3.value=="") {      alert("<s:text name='vipqxqg.jsp.qxqg.jsp.-1989247238'/>!");      return false;    } 
return true;  }  
 </script>
<form method="POST" action="qxqg?status=1&qxid=${qxid}"  name="Form" onSubmit="return checkdate()">
	<p align="center">　</p>
		<p align="center"><s:text name='vipupuser.jsp.upuser.jsp.35593833'/><font color="#FF0000">${userName}</font><s:text name='reg.jsp.reg.jsp.630954966'/>：<input type="password" name="pa3" size="20">&nbsp; <input type="submit" value="确认无误" name="B1"></p>
</form>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700"  size="2"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
