<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('执行更新成功！');location.href='/admin/fhjl';</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('执行普通会员用户分红成功！');location.href='/admin/fhjl';</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('执行双区会员用户分红成功！');location.href='/admin/fhjl';</script></c:if>
	