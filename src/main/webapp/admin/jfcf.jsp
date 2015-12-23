<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==2000}">
<script language=javascript>alert('拆分成功！！');location.href="jfcfshow";</script>
</c:if>
<c:if test="${erroCodeNum==2001}">
<script language=javascript>alert('代卖已进入后台执行，请进入后台进行日志查看进程！');location.href="jfcfshow";</script>
</c:if>

<c:if test="${erroCodeNum==2002}">
<script language=javascript>alert('积分成交操作已进入后台执行，请进入后台进行日志查看进程！');location.href="jfcfshow";</script>
</c:if>

<c:if test="${erroCodeNum==2003}">
<script language=javascript>alert('操作成功！');location.href="jfcfshow";</script>
</c:if>
<HTML>
<style><!--
        A:visited{TEXT-DECORATION: none}
        A:active{TEXT-DECORATION: none}
        A:hover{TEXT-DECORATION: underline overline}
        A:link{text-decoration: none;}
        TD { FONT-SIZE: 9pt;font-family:宋体}
.default-border-tlrb {
BORDER-RIGHT: #68bd5b 1px solid; BORDER-TOP: #68bd5b 1px solid; BORDER-LEFT: #68bd5b 1px solid; BORDER-BOTTOM: #68bd5b 1px solid
}
        --></style>
        	<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<HEAD>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<title>积分拆分及代卖</title>
<div align="center">
<a href="closeMm?close=${!close}"  onClick="return confirm('确定吗,close=${!close}');"><c:if test="${close}">开启积分买入卖出</c:if><c:if test="${!close}">关闭积分买入卖出</c:if></a><-----------------------><a href="djm"  onClick="return confirm('确定成交所有吗?');">成交所有当前求购积分信息</a><-----------------------><a href="cf"  onClick="return confirm('确定拆分吗?');">拆分</a>《--------------------------》<a href="dm" onClick="return confirm('确定执行代卖吗?');">拆分满3次自动卖70%</a>
 </div>
</BODY>
</HTML>
