<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('该一币卖出方不是本人，请重新操作！');location.href='epmcjl';</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('该一币交易进行中或已经由它人交易成功，暂时不能撤销，或稍后再试！');location.href='epmcjl';</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('撤销成功！');location.href='epmcjl';</script></c:if>
