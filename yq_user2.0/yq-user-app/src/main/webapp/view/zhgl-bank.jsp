<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.642434221'/>QQ：613697151"></c:set>
<c:set var="cz02" value="<s:text name='viewindex2.jsp.index2.jsp.37800384'/>"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-950517773'/>"></c:set>
<c:set var="cms" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.475493810'/>"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.643357742'/>QQ：613697152"></c:set>
<c:set var="cz02" value="<s:text name='viewindex2.jsp.index2.jsp.37800384'/>"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-950517773'/>"></c:set>
<c:set var="cms" value="<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.475493810'/>"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
        <%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box2" style="height:633px;">
					<div class="fwzxbox">
						<div class="fwzxtop"><s:text name='viewindex2.jsp.index2.jsp.803273677'/>！<br />
							<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.909107657'/></a><span><br />
							<span style="color: #ff0000"><s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-1381859196'/></span>
						</div>
						<div class="fwzxc">
						<div class="fwzxc-l">
						<p><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.873927308'/>：</p>
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-1213449939'/><br />
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.483236660'/><br />
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-2027014662'/><br />
						</div>
						<div class="fwzxc-r">
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.533795659'/>：<br />
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.24172470'/>：<span style="color: #ff0000">${gcuserup.vipuser}</span><br />
						<c:if test="${not empty gcuserup.vipgh}">
						  <s:text name='reg.jsp.reg.jsp.-453899062'/>:${gcuserup.vipgh}<br />
						</c:if>
						<c:if test="${not empty gcuserup.vipnh}">
						  <s:text name='reg.jsp.reg.jsp.1781968004'/>:${gcuserup.vipnh}<br />
						</c:if>		
						<c:if test="${not empty gcuserup.vipjh}">
						 <s:text name='reg.jsp.reg.jsp.691148048'/>:${gcuserup.vipjh}<br />
						</c:if>
						<c:if test="${not empty gcuserup.vipzh}">
						  <p><s:text name='reg.jsp.reg.jsp.1019445992'/>:${gcuserup.vipzh}</p>
						</c:if>	
						<c:if test="${not empty gcuserup.vipcft}">
						 <s:text name='viewservice.jsp.service.jsp.35383524'/>:${gcuserup.vipcft}<br />
						</c:if>		
						<c:if test="${not empty gcuserup.vipzfb}">
						<s:text name='viewservice.jsp.service.jsp.25541940'/>:${gcuserup.vipzfb}<br />
						</c:if>
						<p><s:text name='reg.jsp.reg.jsp.-1009112269'/>：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}<s:text name='vipuserpay.jsp.userpay.jsp.837885'/></p>											
						<span style="color: #ff0000"><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.80418316'/>：1000.22  5000.12</span><br />
						</div>
						</div>
						
						<div class="fwzxbottom">
						<strong><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.889127'/>：</strong>
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.974981784'/>！<br />
						<span><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-925025214'/>：</span><br />
						<span><s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-107686232'/>：XXXXXX</span><br />
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-281897408'/>
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.1174619'/>！<br />
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.-1965101196'/><br />
						<s:text name='viewzhgl-bank.jsp.zhgl-bank.jsp.1571346232'/>！<br />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
