<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.642434221'/>QQ：613697151"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.643357742'/>QQ：613697152"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1 new4-top">
					<div class="content-title">
						<span><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.855113397'/></span>
					</div>
					<div class="i-gg">
					<p><s:text name='viewindex2.jsp.index2.jsp.803273677'/>！
					<p><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-836674711'/>:${cz01}<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-836674711a'/>:${qq}<a target="_blank" href="https://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes"><s:text name='viewservice.jsp.service.jsp.488997268'/></a></p>
					<p style="color: red;"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-1381859196'/></p><br />
					<p><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1839200756'/>
<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1316609687'/></p>
					</div>
				</div>
				<div class="content-box2 mth10">
					<div class="content-title">
						<span><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.853151501'/></span>
					</div>
					<div class="new4-bottom">
						<h3><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1536312008'/></h3>
						<p>（<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1634195660'/>）
(<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.578779497'/>)</p>
						<p><a href="/bank?dq=${gcuser.dqu}"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.578779497a'/></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
