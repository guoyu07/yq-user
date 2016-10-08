<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-949213936'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-1341989901'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-498016988'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.440060053'/> 0.77 ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.908656802'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.2045778169'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.115010359'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.-1038261267'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='vipmcsl.jsp.mcsl.jsp.809721657'/> ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.-2099694066a'/>!');location.replace('mcsl');</script></c:if>
<div align="center">
	　<p>　</p>
	<table border="1" width="50%" id="table1" height="367" style="border-collapse: collapse">
		<tr>
	<td height="314"><b><font size="6" face="隶书"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-29610456'/></font></b>
	<p><b><font size="4"><s:text name='vipmcsl2.jsp.mcsl2.jsp.1864420800'/><font color="#FF0000">${jygj}</font></font></b></p>
	<p><font size="4" color="#800000"><b><s:text name='vipmcsl2.jsp.mcsl2.jsp.-1122443397'/>：</b></font></p>
	<p><b><font size="4"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-1071874342'/>：<font color="#800080">${dqpay}</font></font></b></p>
	<p><b><font size="4"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-1140375188'/></font></b></p>
	<p><b><font size="4"><s:text name='vipmcsl2.jsp.mcsl2.jsp.-817911047'/>：<font color="#800080">${mc30}</font></font></b></p>
	<p align="center"><a onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')" href="/mcsl?status=2&txpay=${txpay}&jygj=${jygj}"><input type="button" value="<s:text name='vipepmy.jsp.epmy.jsp.941836283'/>" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
		</tr>
		<tr>
	<td><p align="center"><b><font color="#FF0000" style="font-size: 11pt"><s:text name='vipmcsl2.jsp.mcsl2.jsp.21752002'/>！</font></b></td>
		</tr>
	</table>
	<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
<p align="center">　</div>
