<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1616194221'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('电子卡发放及业绩更新<s:text name='reg1.jsp.reg1.jsp.799375'/>！');location.href='datepay'</script></c:if>
