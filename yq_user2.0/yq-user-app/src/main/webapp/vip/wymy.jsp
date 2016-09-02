<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipwymy.jsp.wymy.jsp.-1519534343'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipwymy.jsp.wymy.jsp.-791568500'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipwymy.jsp.wymy.jsp.-1596880694'/>！');location.replace('/gpjysc');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<p align="center">　</p>
<p align="center"><s:text name='vipwymy.jsp.wymy.jsp.-1234597066'/><b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b><s:text name="vipwymy.jsp.wymy.jsp.-1234597066a"></s:text>！</p>
<p align="center">　</p>
<p align="center"><font size="6"><s:text name='vipwymy.jsp.wymy.jsp.1181588703'/>：<font color="#FF0000">${gpjy.jypay}</font></font></p>
<p align="center"><font size="5"><s:text name='vipwymy.jsp.wymy.jsp.-766773789'/>：<b><font color="#FF0000">${gpjy.jypay}</font></b></font></p>
<p align="center">　</p>
<p align="center"><a onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')" href="/wymy?status=1&id=${id}"><input type="button" value="<s:text name='vipepmy.jsp.epmy.jsp.941836283'/>" name="B1" onclick=disabled=true style="font-size: 14pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('<s:text name='vipepmy.jsp.epmy.jsp.-246306007'/>')" href="/gpjysc"><font color="#008000"><s:text name='vipepmy.jsp.epmy.jsp.-246306007a'/></font></a></b></p>
<p align="center">　</p>
