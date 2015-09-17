<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('还没有到结算的日期（每星期二22点后）！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('游戏业务结算成功！');history.go(-1);</script></c:if>
<br />
<br />
<br />
<br />
<br />
<center>
<a onClick="return confirm('提示：您确定了吗？')" href='doubleareacount?status=1'>执行双区计算</a>
<br />
<br />
<br />
<br />
<br />