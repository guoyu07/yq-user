<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.-253996823'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.-1299761769'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.1309921904'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.-201715946'/>。。。！');location.href='vipgo';</script></c:if>
