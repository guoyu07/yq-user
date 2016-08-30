<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.745012'/> -->
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></span>
					</div>
					<div class="content-form new3-top">
						  <p><s:text name="viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.-1226774048"></s:text>：<b>${ejbk.bf2}0</b></p>
						  <p><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.-426269472'/>！</p>
						  <p><a onClick="return confirm('<s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.-1035441473'/>？')" href="activedGoldCard?pdid=${id}&pdpa=${pdpa}&fwid=${fwid}"><button class="but1"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.-1035441473a'/></button></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
