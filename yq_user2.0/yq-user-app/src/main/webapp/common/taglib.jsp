<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/aldmanagertags" prefix="aldtags"%>
<%@ taglib uri="/aldmanagerdttags" prefix="dt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
<%
	response.setCharacterEncoding("utf-8");
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<c:if test="${erroCodeNum==1860}"><script language=javascript>alert('系统暂时关闭，请稍后访问！');history.go(-1);</script></c:if>
