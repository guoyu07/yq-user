<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/jflc.jsp" %>
				
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>充值记录明细</span>
					</div>
					<div class="a-recharge">
					<form method="POST" name="Form" onSubmit="return checkdate()" action="vipgo?status=1">
						<strong>请选择您要充值的金额：</strong>
						<select name="cjpay">
							<option selected value="0">==请选择收到的充值金额==</option>
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
							<option value="10000">1万</option>
							<option value="12000">1万2千</option>
							<option value="15000">1万5千</option>
							<option value="18000">1万8千</option>
							<option value="20000">2万</option>
							<option value="30000">3万</option>
							<option value="50000">5万</option>
						</select>
						<span class="c-r">**</span>
						<button type="submit">确 定 充 值</button>
						</form>
						<a href="/login2j?inputUrl=login6j.jsp" class="c-g">激活金币卡</a>
						<p class="c-r">（注：每次充值最低100元，并以100元的整数递增，如200，300，400，同时需要加尾数）</p>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th>用户名</th>
								<th>最近充值</th>
								<th>累计充值</th>
								<th>充值时间</th>
								<th>充值方式</th>
								<th>愿购买者</th>
								<th>IP地址</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${data.cjuser}</td>
								<td>${data.dqcj}</td>
								<td>${data.ljcj}</td>
								<td><fmt:formatDate value="${data.qldate}" type="both"/></td>
								<td>${data.cjfs}</td>
								<td>${data.bz}</td>
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