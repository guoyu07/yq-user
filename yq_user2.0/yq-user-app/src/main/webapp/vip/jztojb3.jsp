<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipjztojb2.jsp.jztojb2.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipjztojb.jsp.jztojb.jsp.1616194221'/>！');history.go(-1);</script></c:if>
<div align="center">
　<p>　</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000"><s:text name='vipjztojb3.jsp.jztojb3.jsp.1498284680'/></font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000"><s:text name='vipjztojb3.jsp.jztojb3.jsp.-1194971633'/></font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#FF0000">${gmsl}<s:text name='vipjztojb3.jsp.jztojb3.jsp.-600053871'/>
		<c:if test="${mj==10}">10<s:text name='vipjztojb.jsp.jztojb.jsp.1554998638'/>）</c:if>
		<c:if test="${mj==50}">50<s:text name='vipjztojb.jsp.jztojb.jsp.1726773544'/>）</c:if>
		<c:if test="${mj==100}">100<s:text name='vipjztojb.jsp.jztojb.jsp.-356053146'/>）</c:if>
		<c:if test="${mj==300}">300<s:text name='vipjztojb.jsp.jztojb.jsp.-1988509399'/>）</c:if>
		<c:if test="${mj==500}">500<s:text name='vipjztojb.jsp.jztojb.jsp.674001644'/>）</c:if>
		<c:if test="${mj==1000}">1000<s:text name='vipjztojb.jsp.jztojb.jsp.530883694'/>）</c:if>
</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000"><s:text name='vipjztojb3.jsp.jztojb3.jsp.-1748044275'/></font></p>
<p>　</p>
<p><a onClick="return confirm('<s:text name='vipjztojb3.jsp.jztojb3.jsp.600719861'/>？ ')" href="jztojb?status=3&mj=${mj}&gmsl=${gmsl}">
<input type="button" value="<s:text name='vipjztojb3.jsp.jztojb3.jsp.1964436824'/>" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a> </p>
<p>　<p>  <b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700"><s:text name='vipjztojb3.jsp.jztojb3.jsp.326642469'/></font></a></div>
