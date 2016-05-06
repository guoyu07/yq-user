<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${sjid==0}">
   <script language=javascript>alert('设置国内玩家成功！');location.href='searchuser?user=${diyid}&status=1';</script>
</c:if>

<c:if test="${sjid>0}">
   <script language=javascript>alert('设置海外玩家成功！');location.href='searchuser?user=${diyid}&status=1';</script>
</c:if>