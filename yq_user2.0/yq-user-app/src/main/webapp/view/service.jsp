<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewservice.jsp.service.jsp.724834337'/></span>
					</div>
					<div class="content-txt">
						<div class="service">
						<p><s:text name='viewservice.jsp.service.jsp.858879560'/>：	${upuname}***</p>
						<p><s:text name='viewservice.jsp.service.jsp.1003555'/>：	${gcuserup.vipuser}</p>
						<p><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.1050407'/>QQ：	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="<s:text name='viewservice.jsp.service.jsp.488997268'/>" title="<s:text name='viewservice.jsp.service.jsp.488997268'/>"></a>${gcuserup.qq}</p>
						<p><s:text name='viewservice.jsp.service.jsp.1010407087'/>：	${gcuserup.call}</p>
						<c:if test="${not empty gcuserup.vipgh}">
						  <p><s:text name='reg.jsp.reg.jsp.-453899062'/>:${gcuserup.vipgh}</p>
						</c:if>
						<c:if test="${not empty gcuserup.vipnh}">
						  <p><s:text name='reg.jsp.reg.jsp.1781968004'/>:${gcuserup.vipnh}</p>
						</c:if>		
						<c:if test="${not empty gcuserup.vipjh}">
						  <p><s:text name='reg.jsp.reg.jsp.691148048'/>:${gcuserup.vipjh}</p>
						</c:if>
						<c:if test="${not empty gcuserup.vipzh}">
						  <p><s:text name='reg.jsp.reg.jsp.1019445992'/>:${gcuserup.vipzh}</p>
						</c:if>	
						<c:if test="${not empty gcuserup.vipcft}">
						  <p><s:text name='viewservice.jsp.service.jsp.35383524'/>:${gcuserup.vipcft}</p>
						</c:if>		
						<c:if test="${not empty gcuserup.vipzfb}">
						  <p><s:text name='viewservice.jsp.service.jsp.25541940'/>:${gcuserup.vipzfb}</p>
						</c:if>				
						<p><s:text name='reg.jsp.reg.jsp.-1009112269'/>：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}<s:text name='vipuserpay.jsp.userpay.jsp.837885'/></p>
						  <s:text name='viewservice.jsp.service.jsp.643086062'/>，<br />
						  <s:text name='viewservice.jsp.service.jsp.-1565630892'/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
