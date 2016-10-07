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
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/jflc.jsp" %>
				
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.1507906292'/></span>
					</div>
					<div class="a-recharge">
					<form method="POST" name="Form" onSubmit="return checkdate()" action="vipgo?status=1">
						<strong><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.1478585129'/>：</strong>
						<select name="cjpay">
							<option selected value="0">==<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.-255407690'/>==</option>
							<option value="100">100</option>
							<option value="200">200</option>
							<option value="300">300</option>
							<option value="400">400</option>
							<option value="500">500</option>
							<option value="600">600</option>
							<option value="700">700</option>
							<option value="800">800</option>
							<option value="900">900</option>
							<option value="1000">1000</option>
							<option value="1200">1200</option>
							<option value="1500">1500</option>
							<option value="1800">1800</option>
							<option value="2000">2000</option>
							<option value="2200">2200</option>
							<option value="2500">2500</option>
							<option value="3000">3000</option>
							<option value="4000">4000</option>
							<option value="5000">5000</option>
							<option value="6000">6000</option>
							<option value="7000">7000</option>
							<option value="8000">8000</option>
							<option value="9000">9000</option>
							<option value="10000">1<s:text name='wan'/></option>
							<option value="12000">1<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.19218840'/></option>
							<option value="15000">1<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.19218933'/></option>
							<option value="18000">1<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.19219026'/></option>
							<option value="20000">2<s:text name='wan'/></option>
							<option value="30000">3<s:text name='wan'/></option>
							<option value="50000">5<s:text name='wan'/></option>
						</select>
						<span class="c-r">**</span>
						<button type="submit"><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.-379325335'/></button>
						</form>
						<a href="/login2j?inputUrl=login6j.jsp" class="c-g"><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.1519971254'/></a>
						<p class="c-r">（<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.1634195660'/>）</p>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.821575720'/></th>
								<th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.989728617'/></th>
								<th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.640388245a'/></th>
								<th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.640388245'/></th>
								<th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.640372301'/></th>
								<th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.777033699'/></th>
								<th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.25449993'/></th>
								<th>IP<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.714256'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${data.cjuser}</td>
								<td>${data.dqcj}</td>
								<td>${data.ljcj}</td>
								<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
								<td><fmt:formatDate value="${data.qldate}" type="both"/></td>
								<td>${data.cjfs}</td>
								<td>${data.bz}</td>
								<td>${data.cz}</td>
								<td>${data.ip}</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
