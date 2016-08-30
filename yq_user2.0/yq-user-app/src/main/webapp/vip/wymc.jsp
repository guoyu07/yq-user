<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipwymc.jsp.wymc.jsp.-1711119250'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipwymc.jsp.wymc.jsp.-791568500'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-949213936'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.2022589602'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipwymc.jsp.wymc.jsp.1671642723'/>！');location.replace('/gpjysc');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script>
</script>
<p align="center">　</p>
<p align="center">　</p>
<p align="center"><font size="6"><s:text name='vipwymc.jsp.wymc.jsp.-1871713252'/>：<font color="#FF0000">${gpjy.mysl}</font></font></p>
<p align="center"><font size="5"><s:text name='vipwymc.jsp.wymc.jsp.1883427228'/></font></p>
<div align="center">
	<table border="0" width="52%" id="table1" cellspacing="1" bgcolor="#E6E6E6" height="210">
	<tr>
	<td><b><font size="4"><font color="#FF0000"></font>单价是：<font color="#FF0000">
	<c:if test="${gpjy.pay<1}">0${gpjy.pay}</c:if><c:if test="${gpjy.pay>=1}">${gpjy.pay}</c:if>&nbsp; </font>总额为：<font color="#FF0000">${gpjy.jypay}</font></font><font size="4" color="#800000"> </font></b>
	<p><b><font size="4" color="#800000"><s:text name='vipsggpjy.jsp.sggpjy.jsp.682340'/>成功后：</font></b></p>
	<p><b><font size="4"><s:text name='vipwymc.jsp.wymc.jsp.1468095834'/></font></b></p>
	<p><b><font size="4"><s:text name='vipwymc.jsp.wymc.jsp.-1140375188'/></font></b></p>
	<p><b><font size="4"><s:text name='vipwymc.jsp.wymc.jsp.-817911047'/></font></font></b></p>
	</td>
	</tr>
	</table>
	</div>
	<FORM action="/wymc?status=1&id=${id}" method="POST" onSubmit="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')">
	<p align="center"><s:text name='vipmcsl.jsp.mcsl.jsp.630954966'/>:<input type="password" name="pa3"/></p>
<p align="center"><input type="submit" value="<s:text name='vipepmy.jsp.epmy.jsp.941836283'/>" name="B1"  style="font-size: 14pt; color: #0000FF; font-weight: bold"></p></FORM>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('<s:text name='vipepmy.jsp.epmy.jsp.-246306007'/>')" href="/gpjysc"><font color="#008000"><s:text name='vipepmy.jsp.epmy.jsp.-246306007a'/></font></a></b></p>
<p align="center">　</p>
